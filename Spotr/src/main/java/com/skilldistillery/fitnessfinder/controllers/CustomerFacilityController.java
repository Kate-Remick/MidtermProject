package com.skilldistillery.fitnessfinder.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.CustomerDAO;
import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Category;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;

@Controller
public class CustomerFacilityController {

	@Autowired
	private CustomerDAO customerDao;

	@RequestMapping(path = "findFacilities.do", method = RequestMethod.GET)
	public ModelAndView findFacilities(@RequestParam("customer") Customer customer) {
		ModelAndView mav = new ModelAndView();
		List<Facility> preferredFacilities = customerDao.searchFacilityByPreferences(customer.getFacilityPreferences());
		mav.addObject("preferredFacilities", preferredFacilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "category", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByCategory(@RequestParam("category") Category category) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByCategory(category);
		mav.addObject("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "address", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByLocation(@RequestParam("address") Address address) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByLocation(address);
		mav.addObject("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "activity", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByActivity(@RequestParam("activity") Activity activity) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByActivity(activity);
		mav.addObject("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	// TODO add from facility page
	@RequestMapping(path = "addFacilities.do", method = RequestMethod.POST)
	public ModelAndView addFacilities(@RequestParam("customer") Customer customer,
			@RequestParam("facilityId") int facilityId) {
		ModelAndView mav = new ModelAndView();
		Facility facility = customerDao.addFacility(customer.getId(), facilityId);
		mav.addObject("addedMessage",
				"The following facility has been added to your facilities list" + facility.getName());
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "removeFacilities.do", method = RequestMethod.POST)
	public ModelAndView removeFacilities(@RequestParam("customer") Customer customer,
			@RequestParam("facility") Facility facility) {
		ModelAndView mav = new ModelAndView();
		boolean removed = customerDao.removeFacility(customer.getId(), facility);
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		mav.setViewName("customer");
		return mav;
	}

}