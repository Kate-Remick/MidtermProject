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
	boolean removeJournalEntry(Journal log);
	Goal addEditGoals(Journal log, Goal goal);
	boolean removeGoals(Journal log, Goal goal);
	Customer editFacilityPreferences(FacilityPreferences prefs);
	List<Facility> addFacility(Facility facility);
	boolean removeFacility(Facility facility);
	Customer editCustomerInfo(Customer customer);
	Customer addActivities(Activity activity);
	Customer editActivities(Activity activity);
	boolean removeActivities(Activity activity);
	List<Facility> searchFacilityByActivity(Activity activity);
	List<Facility> searchFacilityByCategory(Category category);
	List<Facility> searchFacilityByLocation(Address address);
	List<Facility> searchFacilityByPreferences(FacilityPreferences prefs);
	

}
