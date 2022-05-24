package com.skilldistillery.fitnessfinder.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
		System.out.println("******************creating customer");
		user = em.find(Login.class, user.getId());
		customer.setLogin(user);
		em.persist(customer);
		em.flush();
		// TODO add cascade type to customer entity
		return customer;
	}

	@Override
	public Customer addJournalEntry(Journal log) {
		log.setCreatedAt(LocalDateTime.now());
		Goal goal = log.getGoal();
		goal.setCompleted(log.getGoal().isCompleted());
		em.persist(log);
		Customer customer = em.find(Customer.class, log.getCustomer().getId());
		log.setCustomer(customer);
		customer.addJournal(log);
		em.flush();
		return customer;
	}

	@Override
	public boolean removeJournalEntry(int log) {
		boolean removed = false;
		Journal removeLog = em.find(Journal.class, log);
		Customer customer = em.find(Customer.class, removeLog.getCustomer().getId());
		if (removeLog != null) {
			customer.removeJournal(removeLog);
			removeLog.setCustomer(null);
		}
		removed = !customer.getLogs().contains(removeLog);
		return removed;
	}

	@Override
	public Customer addGoals(Goal goal) {
		Customer customer = em.find(Customer.class, goal.getCustomer().getId());
		em.persist(goal);
		goal.setCustomer(customer);
		customer.addGoal(goal);
		em.flush();
		return customer;
	}

	@Override
	public Customer completeGoals(int goalId) {
		Goal goal = em.find(Goal.class, goalId);
		goal.setCompleted(true);
		Customer customer = goal.getCustomer();
		return customer;
	}

	@Override
	public boolean removeGoals(int goalId) {
		boolean removed = false;
		Goal removeGoal = em.find(Goal.class, goalId);
		Customer customer = em.find(Customer.class, removeGoal.getCustomer().getId());
		if (removeGoal != null) {
			customer.removeGoal(removeGoal);
			removeGoal.setCustomer(null);
		}
		removed = !customer.getGoals().contains(removeGoal);
		return removed;
	}

	

	@Override
	public Facility addFacility(int customerId, int facilityId) {
		Facility facility = em.find(Facility.class, facilityId);
		Customer customer = em.find(Customer.class, customerId);
		customer.addFacility(facility);
		return facility;
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
	public Customer editCustomerInfo(Customer customer, int customerId) {
		Customer editCustomer = em.find(Customer.class, customerId);
		if (editCustomer != null) {
			editCustomer.setFirstName(customer.getFirstName());
			editCustomer.setLastName(customer.getLastName());
			editCustomer.setBirthDate(customer.getBirthDate());
			editCustomer.setBio(customer.getBio());
			if (!em.contains(customer.getAddress())) {
			em.persist(customer.getAddress());
		}
		editCustomer.setAddress(customer.getAddress());
		em.flush();
			
			em.flush();
		}
		return editCustomer;
	}
	
	
	@Override
	public Customer editFacilityPreferences(int customerId, FacilityPreferences prefs) {
		Customer customer = em.find(Customer.class, customerId);
		FacilityPreferences updatedPrefs =  customer.getFacilityPreferences();
		updatedPrefs.setAlwaysOpen(prefs.isAlwaysOpen());
		updatedPrefs.setPriceMax(prefs.getPriceMax());
		updatedPrefs.setHasTrainers(prefs.isHasTrainers());
		customer.setFacilityPreferences(updatedPrefs);
		return customer;
	}

	@Override
	public Customer editActivities(int customerId, List<CustomerActivity> activities) {
		System.out.println("*************************1");
		Customer editCustomer = em.find(Customer.class, customerId);
		if(editCustomer.getCustomerActivities() != null) {
			System.out.println("*************************deleting customerActivities");
			editCustomer.setCustomerActivities(null);
			editCustomer.setCustomerActivities(new ArrayList<>());
		}
		for (CustomerActivity customerActivity : activities) {
			customerActivity.setCustomer(editCustomer);
			System.out.println("*************************persisting customerActivities");
			em.persist(customerActivity);
			System.out.println("************************* associating customerActivities");
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
		String partialZip = address.getZip().replace(address.getZip().charAt(address.getZip().length() - 1), '%');
		String jpql = "SELECT f FROM Facility f WHERE f.address.zip IS LIKE :addressId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("addressId", partialZip)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByPreferences(FacilityPreferences prefs) {
		String jpql = "SELECT f FROM Facility f WHERE f.alwaysOpen = :prefsOpen AND f.hasTrainers = :prefsTrainers AND f.price <= :prefsPrice";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("prefsOpen", prefs.isAlwaysOpen())
				.setParameter("prefsTrainers", prefs.isHasTrainers()).setParameter("prefsPrice", prefs.getPriceMax())
				.getResultList();
		return facilities;
	}

	@Override
	public List<Activity> getAllActivities() {
		List<Activity> activities = new ArrayList<>();
		String jpql = "SELECT a from Activity a";
		activities = em.createQuery(jpql, Activity.class).getResultList();
		return activities;
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<>();
		String jpql = "SELECT c from Category c";
		categories = em.createQuery(jpql, Category.class).getResultList();
		return categories;
	}

	@Override
	public Activity findActivityById(int activityId) {
		Activity activity = em.find(Activity.class, activityId);
		return activity;
	}

	@Override
	public List<CustomerActivity> addCustomerActivities(List<CustomerActivity> ca) {
		Customer customer = em.find(Customer.class, ca.get(0).getCustomer().getId());
		customer.setCustomerActivities(ca);
		return ca;
	}

	@Override

	public Journal findJournalById(int id) {
		Journal journal = em.find(Journal.class, id);
		return journal;
	}

	@Override
	public Customer findCustomerById(int id) {
		Customer customer = em.find(Customer.class, id);
		return customer;
	}

	@Override
	public Facility findFacilityById(int id) {
		Facility facility = em.find(Facility.class, id);
		return facility;
	}

	@Override
	public Login findLoginById(int id) {
		Login login = em.find(Login.class, id);
		return login;
	}

	public Goal findGoalById(int goalId) {
		Goal goal = em.find(Goal.class, goalId);
		return goal;
	}
	
	

}
