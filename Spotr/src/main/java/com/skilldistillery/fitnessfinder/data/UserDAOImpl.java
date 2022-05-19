package com.skilldistillery.fitnessfinder.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.fitnessfinder.entities.User;

@Service	
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findBuUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
