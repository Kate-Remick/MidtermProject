package com.skilldistillery.fitnessfinder.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.FacilityDAO;
import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Facility;
import com.skilldistillery.fitnessfinder.entities.Login;

@Controller
public class FacilityController {

	@Autowired
	private FacilityDAO facilityDAO;

	@RequestMapping(path = "viewFacility.do", method = RequestMethod.GET)
	public String viewFacility(HttpSession session) {
		Facility facility = (Facility)session.getAttribute("facility");
		session.setAttribute("facility", facility);
		return "facility";
	}


	@RequestMapping(path="createFacility.do", method = RequestMethod.POST)
	public ModelAndView createFacility(Facility facility, Address address, HttpSession session, @RequestParam ("activityarray")String... activities) {
		ModelAndView mv = new ModelAndView();
		facility.setAddress(address);
		List<Activity> facilityActivity = new ArrayList<>();
		if (activities != null && activities.length > 0) {
			for (int i = 0; i < activities.length; i++) {
					Activity activity = facilityDAO.findActivityById(Integer.parseInt(activities[i]));
					facilityActivity.add(activity);
			}
		}
		facility.setActivities(facilityActivity);
		Login login = (Login) session.getAttribute("loggedInUser");
		facility = facilityDAO.createFacility(login, facility);
//		facility = facilityDAO.createFacility((Login)session.getAttribute("loggedInUser"), facility);
		session.setAttribute("facility", facility);
		mv.setViewName("facility");
		return mv;
	}
	
	@RequestMapping(path = "editFacility.do", method = RequestMethod.GET)
	public ModelAndView editFacilityForm() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("activities", facilityDAO.getAllActivities());
		mv.setViewName("updateFacility");
		return mv;
	}
	
	@RequestMapping(path="editFacility.do", method = RequestMethod.POST)
	public ModelAndView editFacility( Facility facility, Address address, HttpSession session, @RequestParam ("activityarray")String... activities) {
		ModelAndView mv = new ModelAndView();
		facility.setAddress(address);
		List<Activity> facilityActivity = new ArrayList<>();
		if (activities != null && activities.length > 0) {
			for (int i = 0; i < activities.length; i++) {
					
					Activity activity = facilityDAO.findActivityById(Integer.parseInt(activities[i]));
					facilityActivity.add(activity);
				
			}
		}
		facility.setActivities(facilityActivity);
		facility = facilityDAO.editFacilityInfo((Facility)session.getAttribute("facility"), facility);
		session.setAttribute("facility", facility);
		mv.setViewName("redirect:editedFacility.do");
		return mv;
	}
	
	@RequestMapping(path = "editedFacility.do", method = RequestMethod.GET)
	public String editedFacility() {
		return "facility";
	}

}
