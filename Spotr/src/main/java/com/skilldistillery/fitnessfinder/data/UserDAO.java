package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Login;

public interface UserDAO {
	Login findUserById(int id);
	Login findByUsernameAndPassword(String username, String password);
	Boolean checkIfUsernameExists(String username);
	Login createCustomerUser(String username, String password);
	Login createFacilityUser(String username, String password);
	Customer loginCustomerUser(Login login);
	Facility loginFacilityUser(Login login);
	List<Activity> getAllActivities();
//	Login createTrainerUser(String username, String password);
	
}
