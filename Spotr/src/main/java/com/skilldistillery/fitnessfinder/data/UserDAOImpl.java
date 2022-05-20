package com.skilldistillery.fitnessfinder.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fitnessfinder.entities.Login;

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
	public Login findBuUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
