package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Journal;
import com.skilldistillery.fitnessfinder.entities.Login;

public interface FacilityDAO {
	
	Facility createFacility(Login user, Facility facility);
	Facility editFacilityInfo(Facility facility, Facility newFacility);
	Facility editFacilityAddress(Address address, Facility facility);
	List<Activity> editActivities(int facilityId, List<Activity> activities);
	List<Activity> getAllActivities();
	Journal findJournalById(int id);
	Customer findCustomerById(int id);
	Facility findFacilityById(int id);
	Login findLoginById(int id);
	Activity findActivityById(int activityId);

}
