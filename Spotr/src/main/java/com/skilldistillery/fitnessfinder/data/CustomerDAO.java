package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Category;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.CustomerActivity;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.FacilityPreferences;
import com.skilldistillery.fitnessfinder.entities.Goal;
import com.skilldistillery.fitnessfinder.entities.Journal;
import com.skilldistillery.fitnessfinder.entities.Login;

public interface CustomerDAO {
	
	Customer createCustomer(Login user, Customer customer);
	Journal addJournalEntry(Journal log);
	boolean removeJournalEntry(Journal log);
	Goal addGoals(Goal goal);
	Goal completeGoals(Goal goal);
	boolean removeGoals(Goal goal);
	Customer editFacilityPreferences(int customerId, FacilityPreferences prefs);
	Facility addFacility(int customerId, int facilityId);
	boolean removeFacility(int customerId, Facility facility);
	Customer editCustomerInfo(Customer customer, int id);
	Customer editActivities(int customerId, List<CustomerActivity> activities);
	Customer editCustomerPrefs(FacilityPreferences prefs);
	boolean removeActivities(int customerId, CustomerActivity activity);
	List<Facility> searchFacilityByActivity(Activity activity);
	List<Facility> searchFacilityByCategory(Category category);
	List<Facility> searchFacilityByLocation(Address address);
	List<Facility> searchFacilityByPreferences(FacilityPreferences prefs);
	List<Activity> getAllActivities();
	List<Category> getAllCategories();
	List<CustomerActivity> addCustomerActivities(List<CustomerActivity> ca);
	Activity findActivityById(int activityId);
	Journal findJournalById(int id);
	Customer findCustomerById(int id);
	Facility findFacilityById(int id);
	Login findLoginById(int id);
	

}
