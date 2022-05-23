package com.skilldistillery.fitnessfinder.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.FacilityDAO;
import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Login;

public class FacilityController {

	@Autowired
	private FacilityDAO facilityDAO;

	@RequestMapping(path = "viewFacility.do", method = RequestMethod.GET)
	public String viewFacility(HttpSession session) {
		return "viewFacility";
	}

	@RequestMapping(path = "createFacility.do", method = RequestMethod.GET)
	public ModelAndView createFacilityForm() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("activities", facilityDAO.getAllActivities());
		mv.setViewName("createFacility");
		return mv;
	}

	@RequestMapping(path="createFacility.do", method = RequestMethod.POST)
	public ModelAndView createFacility(@RequestParam ("loggedInUser")Login login, Facility facility, Address address, HttpSession session, @RequestParam ("activities")Activity... activity) {
		ModelAndView mv = new ModelAndView();
		facility.setAddress(address);
		List<Activity> facilityActivity = new ArrayList<>();
		if (activity != null && activity.length > 0) {
			for (int i = 0; i < activity.length; i++) {
				
					facilityActivity.add(activity[i]);
				
				
			}
		}
		facility.setActivities(facilityActivity);
		facilityDAO.createFacility(login, facility);
		session.setAttribute("facility", facility);
		mv.setViewName("facility");
		return mv;
	}
	
	@RequestMapping(path = "editFacility.do", method = RequestMethod.GET)
	public String editFacilityForm() {
		return "editFacilityForm";
	}
	
	@RequestMapping(path="editFacility.do", method = RequestMethod.POST)
	public ModelAndView editFacility(@RequestParam ("facility")Facility facilityUnderEdit, Facility facility, Address address, HttpSession session, @RequestParam ("activities")Activity... activity) {
		ModelAndView mv = new ModelAndView();
		facility.setAddress(address);
		List<Activity> facilityActivity = new ArrayList<>();
		if (activity != null && activity.length > 0) {
			for (int i = 0; i < activity.length; i++) {
				
					facilityActivity.add(activity[i]);
				
				
			}
		}
		facility.setActivities(facilityActivity);
		facilityDAO.editFacilityInfo(facilityUnderEdit, facility);
		session.setAttribute("facility", facility);
		mv.setViewName("redirect:editedFacility.do");
		return mv;
	}
	
	@RequestMapping(path = "editedFacility.do", method = RequestMethod.GET)
	public String editedFacility() {
		return "facility.do";
	}

}
