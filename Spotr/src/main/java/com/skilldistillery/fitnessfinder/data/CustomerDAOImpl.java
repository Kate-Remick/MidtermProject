package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Category;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.CustomerActivity;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.FacilityPreferences;
import com.skilldistillery.fitnessfinder.entities.Goal;
import com.skilldistillery.fitnessfinder.entities.Journal;
import com.skilldistillery.fitnessfinder.entities.Login;

@Service
@Transactional
public class CustomerDAOImpl implements CustomerDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Customer createCustomer(Login user, Customer customer) {
		user = em.find(Login.class, user.getId());
		customer.setLogin(user);
		em.persist(customer);
		// TODO add cascade type to customer entity
		em.flush();
		return customer;
	}

	@Override
	public Journal addJournalEntry(Journal log) {
		em.persist(log);
		em.flush();
		return log;
	}

	@Override
	public boolean removeJournalEntry(Journal log) {
		boolean removed = false;
		Journal removeLog = em.find(Journal.class, log.getId());
		Customer customer = em.find(Customer.class, log.getCustomer().getId());
		if (removeLog != null) {
			customer.removeJournal(removeLog);
		}
		removed = !customer.getLogs().contains(removeLog);
		return removed;
	}

	@Override
	public Goal addGoals(Goal goal) {
		Customer customer = em.find(Customer.class, goal.getCustomer().getId());
		em.persist(goal);
		goal.setCustomer(customer);
		em.flush();
		return null;
	}

	@Override
	public Goal completeGoals(Goal goal) {
		goal.setCompleted(true);
		return goal;
	}

	@Override
	public boolean removeGoals(Goal goal) {
		boolean removed = false;
		Goal removeGoal = em.find(Goal.class, goal.getId());
		Customer customer = em.find(Customer.class, removeGoal.getCustomer().getId());
		if (removeGoal != null) {
			customer.removeGoal(removeGoal);
		}
		removed = !customer.getGoals().contains(removeGoal);
		return removed;
	}

	@Override
	public Customer editFacilityPreferences(int customerId, FacilityPreferences prefs) {
		Customer customer = em.find(Customer.class, customerId);
		customer.setFacilityPreferences(prefs);
		return customer;
	}

	@Override
	public List<Facility> addFacility(int customerId, Facility facility) {
		facility = em.find(Facility.class, facility.getId());
		Customer customer = em.find(Customer.class, customerId);
		customer.addFacility(facility);
		return customer.getFacilities();
	}

	@Override
	public boolean removeFacility(int customerId, Facility facility) {
		boolean removed = false;
		Facility removeFacility = em.find(Facility.class, facility.getId());
		Customer customer = em.find(Customer.class, customerId);
		if (removeFacility != null) {
			customer.removeFacility(removeFacility);
		}
		removed = !customer.getFacilities().contains(removeFacility);
		return removed;
	}

	@Override
	public Customer editCustomerInfo(Customer customer) {
		Customer editCustomer = em.find(Customer.class, customer.getId());
		if (editCustomer != null) {
			editCustomer.setFirstName(customer.getFirstName());
			editCustomer.setLastName(customer.getLastName());
			editCustomer.setBirthDate(customer.getBirthDate());
			editCustomer.setBio(customer.getBio());
			em.flush();
		}
		return editCustomer;
	}

	@Override
	public Customer editCustomerAddress(Customer customer, Address address) {
		if (!em.contains(address)) {
			em.persist(address);
		}
		customer.setAddress(address);
		em.flush();
		return customer;
	}

	@Override
	public void editCustomerPrefs(FacilityPreferences prefs) {
		FacilityPreferences updatedPrefs = em.find(FacilityPreferences.class, prefs.getId());
		updatedPrefs.setAlwaysOpen(prefs.isAlwaysOpen());
		updatedPrefs.setPriceMax(prefs.getPriceMax());
		updatedPrefs.setHasTrainers(prefs.isHasTrainers());
	}

	@Override
	public Customer editActivities(int customerId, List<CustomerActivity> activities) {
		Customer editCustomer = em.find(Customer.class, customerId);
		editCustomer.getCustomerActivities().removeAll(editCustomer.getCustomerActivities());
		for (CustomerActivity customerActivity : activities) {
			customerActivity.setCustomer(editCustomer);
			em.persist(customerActivity);
			editCustomer.addCustomerActivity(customerActivity); // POSSIBLY EXTRANEOUS LINE?
		}
		return editCustomer;
	}

	@Override
	public boolean removeActivities(int customerId, CustomerActivity activity) {

		boolean removed = false;
		Customer removingCustomer = em.find(Customer.class, customerId);
		CustomerActivity removeActivity = em.find(CustomerActivity.class, activity.getId());
		if (removeActivity != null) {
			removingCustomer.removeCustomerActivity(activity);
			em.remove(removeActivity);
			removed = !em.contains(removeActivity);
		}
		return removed;
	}

	@Override
	public List<Facility> searchFacilityByActivity(Activity activity) {
		String jpql = "SELECT f FROM Facility f JOIN f.activities a WHERE a.id = :activityId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("activityId", activity)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByCategory(Category category) {
		String jpql = "SELECT f FROM Facility f JOIN Category c JOIN f.activities fa JOIN c.activities ca WHERE fa.id = ca.id AND c.id = :categoryId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("categoryId", category)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByLocation(Address address) {
		String partialZip = address.getZip().replace(address.getZip().charAt(address.getZip().length()-1), '%');
		String jpql = "SELECT f FROM Facility f WHERE f.address.zip IS LIKE :addressId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("addressId", partialZip)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByPreferences(FacilityPreferences prefs) {
		String jpql = "SELECT f FROM Facility f WHERE f.alwaysOpen = :prefsOpen AND f.hasTrainers = :prefsTrainers AND f.price <= :prefsPrice";
		List<Facility> facilities = em.createQuery(jpql, Facility.class)
												.setParameter("prefsOpen", prefs.isAlwaysOpen())
												.setParameter("prefsTrainers", prefs.isHasTrainers())
												.setParameter("prefsPrice", prefs.getPriceMax())
												.getResultList();
		return facilities;
	}

}
