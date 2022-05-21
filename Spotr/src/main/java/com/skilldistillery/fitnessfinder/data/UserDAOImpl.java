package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		String jpql = "SELECT l FROM Login l WHERE l.username = :username "
				+ "AND l.password = :password";
		Login login = em.createQuery(jpql, Login.class).setParameter("username", username).setParameter("password", password).getResultList().get(0);
		return login;
	}
	
	@Override
	public Boolean checkIfUsernameExists(String username) {
		boolean exists;
		String jpql = "SELECT l FROM Login l WHERE username = :username";
		Login login = em.createQuery(jpql, Login.class).setParameter("username", username).getResultList().get(0);
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
