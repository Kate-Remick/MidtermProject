package com.skilldistillery.fitnessfinder.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Login;
import com.skilldistillery.fitnessfinder.entities.Role;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Login findUserById(int id) {

		return em.find(Login.class, id);
	}

	@Override
	public Login findByUsernameAndPassword(String username, String password) {
		String jpql = "SELECT l FROM Login l WHERE l.username = :username " + "AND l.password = :password";
		Login login = em.createQuery(jpql, Login.class).setParameter("username", username)
				.setParameter("password", password).getResultList().get(0);
		return login;
	}

	@Override
	public Boolean checkIfUsernameExists(String username) {
		boolean exists;
		String jpql = "SELECT l FROM Login l WHERE username = :username";
		List<Login> login = em.createQuery(jpql, Login.class).setParameter("username", username).getResultList();
		exists = !(login == null);
		return exists;
	}

	@Override
	public Login createCustomerUser(String username, String password) {
		Login login = new Login();
		login.setRole(em.find(Role.class, 1));
		login.setUsername(username);
		login.setPassword(password);
		em.persist(login);
		return login;
	}

	@Override
	public Login createFacilityUser(String username, String password) {
		Login login = new Login();
		login.setRole(em.find(Role.class, 2));
		login.setUsername(username);
		login.setPassword(password);
		em.persist(login);
		return login;
	}

	@Override
	public Customer loginCustomerUser(Login login) {
		String jpql = "SELECT c FROM Customer c WHERE c.login.id = :id";
		Customer customer = em.createQuery(jpql, Customer.class).setParameter("id", login.getId()).getResultList()
				.get(0);
		customer.getCustomerActivities();
		customer.getFacilities();
		customer.getGoals();
		customer.getLogs();
		return customer;
	}

	@Override
	public Facility loginFacilityUser(Login login) {
		String jpql = "SELECT f FROM Facility f WHERE f.login.id = :id";
		Facility facility = em.createQuery(jpql, Facility.class).setParameter("id", login.getId()).getResultList()
				.get(0);
		facility.getActivities();
		facility.getCustomers();
		return facility;
	}

	@Override
	public List<Activity> getAllActivities() {
		List<Activity> activities = new ArrayList<>();
		String jpql = "SELECT a FROM Activity a";
		activities = em.createQuery(jpql, Activity.class).getResultList();
		return activities;
	}
//	@Override
//	public Login createTrainerUser(String username, String password) {
//		Login login = new Login(); 
//		login.setRole(em.find(Role.class, 3));
//		login.setUsername(username);		
//		login.setPassword(password);		
//		em.persist(login);
//		return login;
//	}

}
