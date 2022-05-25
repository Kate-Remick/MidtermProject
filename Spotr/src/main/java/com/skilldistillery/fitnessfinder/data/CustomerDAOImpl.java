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
		List<Facility> facilities = customer.getFacilities();
		facilities.add(facility);
		customer.setFacilities(facilities);
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
		Customer editCustomer = em.find(Customer.class, customerId);
		String sql = "DELETE FROM CustomerActivity ca WHERE ca.customer.id = :id";
		em.createQuery(sql).setParameter("id", editCustomer.getId()).executeUpdate();
		em.flush();
		em.clear();
		editCustomer = em.find(Customer.class, customerId);
		List<CustomerActivity> newActivities = new ArrayList<>();
		for (CustomerActivity ca : activities) {
			ca.setActivity(em.find(Activity.class, ca.getActivity().getId()));
			ca.setCustomer(editCustomer);
			em.persist(ca);
			newActivities.add(ca);
		}
		System.out.println("************** Setting cas  for customer");
		editCustomer.setCustomerActivities(newActivities);
		return editCustomer;
	}
	



	@Override
	public List<Facility> searchFacilityByActivity(int activityId) {
		String jpql = "SELECT f FROM Facility f JOIN f.activities a WHERE a.id = :activityId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("activityId", activityId)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByCategory(int categoryId) {
		String jpql = "SELECT f FROM Facility f JOIN f.activities fa JOIN fa.categories fac WHERE fac.id = :categoryId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("categoryId", categoryId)
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByLocation(int addressId) {
		Address address = em.find(Address.class, addressId);
//		String partialZip = address.getZip().replace(address.getZip().charAt(address.getZip().length() - 1), '%');
//		partialZip = address.getZip().replace(address.getZip().charAt(address.getZip().length() - 2), '%');
		String jpql = "SELECT f FROM Facility f WHERE f.address.city = :city";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).setParameter("city", address.getCity())
				.getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByPreferences(FacilityPreferences prefs) {
		List<Facility> facilities = new ArrayList<>();
		if(prefs.getPriceMax() != null) {
			if(prefs.isAlwaysOpen() && prefs.isHasTrainers()) {
				String jpql = "SELECT f FROM Facility f WHERE f.alwaysOpen = :prefsOpen AND f.hasTrainers = :prefsTrainers AND f.price < :prefsPrice";
				facilities = em.createQuery(jpql, Facility.class).setParameter("prefsOpen", prefs.isAlwaysOpen())
						.setParameter("prefsTrainers", prefs.isHasTrainers()).setParameter("prefsPrice", prefs.getPriceMax())
						.getResultList();
				
			}else if(prefs.isAlwaysOpen()) {
				String openql = "SELECT f FROM Facility f WHERE f.alwaysOpen = :openPrefs AND f.price < :prefsPrice ";
				facilities = em.createQuery(openql, Facility.class).setParameter("prefsOpen", prefs.isAlwaysOpen())
						.setParameter("prefsPrice", prefs.getPriceMax())
						.getResultList();
				
			} else if(prefs.isHasTrainers()) {
				String trainerql = "SELECT f FROM Facility f WHERE f.hasTrainers = :trainerPrefs";
				facilities = em.createQuery(trainerql, Facility.class)
						.setParameter("prefsTrainers", prefs.isHasTrainers()).setParameter("prefsPrice", prefs.getPriceMax())
						.getResultList();
			}else {
				String jpql = "SELECT f FROM Facility f WHERE f.price < :prefsPrice";
				facilities = em.createQuery(jpql, Facility.class).setParameter("prefsPrice", prefs.getPriceMax()).getResultList();
			}
		}else {
			String jpql = "SELECT f FROM Facility f";
			facilities = em.createQuery(jpql, Facility.class).getResultList();
		}
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
	
	public List<Facility> getAllFacilites(){
		String jpql = "SELECT f FROM Facility f";
		List<Facility> facilities = em.createQuery(jpql, Facility.class).getResultList();
		return facilities;
	}

}
