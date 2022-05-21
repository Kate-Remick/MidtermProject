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
	public Journal removeJournalEntry(Journal log) {
		Journal removeLog = em.find(Journal.class, log.getId());
		em.remove(removeLog);
		// return boolean?
		return null;
	}

	@Override
	public Goal addEditGoals(Journal log, Goal goal) {

		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Goal removeGoals(Journal log, Goal goal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer editFacilityPreferences(FacilityPreferences preff) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> addFacility(Facility facility) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> removeFacility(Facility facility) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer editCustomerInfo(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer addEditActivities(Activity activity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer removeActivities(Activity activity) {
		Activity removeActivity = em.find(Activity.class, activity.getId());
		em.remove(removeActivity);
		// return boolean?
		return null;
	}

	@Override
	public List<Facility> searchFacilityByActivity(Activity activity) {
		String jpql = "SELECT f FROM facility f WHERE f.activity = :activity ";
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> searchFacilityByCategory(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> searchFacilityByLocation(Address address) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Facility> searchFacilityByPreferences(FacilityPreferences preff) {
		// TODO Auto-generated method stub
		return null;
	}

}
