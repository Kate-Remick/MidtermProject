package com.skilldistillery.fitnessfinder.data;

import java.util.List;

import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Login;

public interface FacilityDAO {
	
	Facility createFacility(Login user, Facility facility);
	Facility editFacilityInfo(Facility facility);
	List<Activity> addActivity(Activity activity);
	List<Activity> removeActivity(Activity activity);
}
