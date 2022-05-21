package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Category;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.FacilityPreferences;
import com.skilldistillery.fitnessfinder.entities.Goal;
import com.skilldistillery.fitnessfinder.entities.Journal;
import com.skilldistillery.fitnessfinder.entities.Login;

public interface CustomerDAO {
	
	Customer createCustomer(Login user, Customer customer);
	Journal addJournalEntry(Journal log);
	Journal removeJournalEntry(Journal log);
	Goal addEditGoals(Journal log, Goal goal);
	Goal removeGoals(Journal log, Goal goal);
	Customer editFacilityPreferences(FacilityPreferences preff);
	List<Facility> addFacility(Facility facility);
	List<Facility> removeFacility(Facility facility);
	Customer editCustomerInfo(Customer customer);
	Customer addEditActivities(Activity activity);
	Customer removeActivities(Activity activity);
	List<Facility> searchFacilityByActivity(Activity activity);
	List<Facility> searchFacilityByCategory(Category category);
	List<Facility> searchFacilityByLocation(Address address);
	List<Facility> searchFacilityByPreferences(FacilityPreferences preff);
	

}
