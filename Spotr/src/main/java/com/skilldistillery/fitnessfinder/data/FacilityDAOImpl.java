package com.skilldistillery.fitnessfinder.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Journal;
import com.skilldistillery.fitnessfinder.entities.Login;

@Service
@Transactional
public class FacilityDAOImpl implements FacilityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Facility createFacility(Login user, Facility facility) {
		user = em.find(Login.class, facility.getId());
		facility.setLogin(user);
		em.persist(facility);
		em.flush();
		// TODO add cascade type to facility entity
		return facility;
	}

	@Override
	public Facility editFacilityInfo(Facility facility, Facility newFacility) {
		Facility editFacility = em.find(Facility.class, facility.getId());
		if (editFacility != null) {
			editFacility.setHasTrainers(newFacility.isHasTrainers());
			editFacility.setBrand(newFacility.getBrand());
			editFacility.setName(newFacility.getName());
			editFacility.setOwnerName(newFacility.getOwnerName());
			editFacility.setAlwaysOpen(newFacility.isAlwaysOpen());
			editFacility.setPrice(newFacility.getPrice());
			editFacility.setActivities(newFacility.getActivities());
			editFacility.setAddress(newFacility.getAddress());
			em.flush();
		}
		return editFacility;
	}
	

	@Override
	public Activity findActivityById(int activityId) {
		Activity activity =  em.find(Activity.class, activityId);
		return activity;
	}

	@Override
	public Facility editFacilityAddress(Address address, Facility facility) {
		if (!em.contains(address)) {
			em.persist(address);
		}
		facility.setAddress(address);
		em.flush();
		return facility;
	}

	@Override
	public List<Activity> editActivities(int facilityId, List<Activity> activities) {
		Facility facility = em.find(Facility.class, facilityId);
		facility.setActivities(activities);
		return activities;
	}

	@Override
	public List<Activity> getAllActivities() {
		List<Activity> activities = new ArrayList<>();
		String jpql = "SELECT a FROM a=Activity a";
		activities = em.createQuery(jpql, Activity.class).getResultList();
		return activities;
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
}
