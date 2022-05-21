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
		// TODO
		em.persist(customer);
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
		if (removeLog != null) {
			em.remove(removeLog);
			removed = !em.contains(removeLog);
		}
		return removed;
	}

	@Override
	public Goal addEditGoals(Journal log, Goal goal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeGoals(Journal log, Goal goal) {
		// TODO
		boolean removed = false;
		return removed;
	}

	@Override
	public Customer editFacilityPreferences(FacilityPreferences prefs) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> addFacility(Facility facility) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeFacility(Facility facility) {
		boolean removed = false;
		Journal removeFacility = em.find(Journal.class, facility.getId());
		if (removeFacility != null) {
			em.remove(removeFacility);
			removed = !em.contains(removeFacility);
		}
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
			// TODO WHAT ELSE ARE WE EDITING?
		}
		return editCustomer;
	}

	@Override
	public Customer addActivities(Activity activity) {
		// TODO List<CustomerActivity> customerActivities
		return null;
	}

	@Override
	public Customer editActivities(Activity activity) {
		// TODO List<CustomerActivity> customerActivities
		return null;
	}

	@Override
	public boolean removeActivities(Activity activity) {
		
		boolean removed = false;
		Journal removeActivity = em.find(Journal.class, activity.getId());
		if (removeActivity != null) {
			em.remove(removeActivity);
			removed = !em.contains(removeActivity);
		}
		return removed;
	}

	@Override
	public List<Facility> searchFacilityByActivity(Activity activity) {
		// TODO ???
		String jpql = "SELECT f FROM Facility f JOIN f.activity WHERE f.activity.id = :activityId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class)
                .setParameter("activityId", activity)
                .getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByCategory(Category category) {
		// TODO ???
		String jpql = "SELECT";
		return null;
	}

	@Override
	public List<Facility> searchFacilityByLocation(Address address) {
		// TODO ???
		String jpql = "SELECT f FROM Facility f WHERE f.address.id = :addressId";
		List<Facility> facilities = em.createQuery(jpql, Facility.class)
                .setParameter("addressId", address)
                .getResultList();
		return facilities;
	}

	@Override
	public List<Facility> searchFacilityByPreferences(FacilityPreferences prefs) {
		// TODO ???
		String jpql = "SELECT ";
		return null;
	}

}
