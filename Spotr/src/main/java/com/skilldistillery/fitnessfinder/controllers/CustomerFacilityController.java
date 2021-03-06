package com.skilldistillery.fitnessfinder.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.CustomerDAO;
import com.skilldistillery.fitnessfinder.entities.Activity;
import com.skilldistillery.fitnessfinder.entities.Category;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Facility;

@Controller
public class CustomerFacilityController {

	@Autowired
	private CustomerDAO customerDao;

	@RequestMapping(path = "findFacilities.do", method = RequestMethod.GET)
	public ModelAndView findFacilities(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer customer = (Customer)session.getAttribute("customer");
		List<Facility> preferredFacilities = customerDao.searchFacilityByPreferences(customer.getFacilityPreferences());
		System.out.println("**************************88" +preferredFacilities);
		session.setAttribute("facilities", preferredFacilities);
		mav.addObject("activities", customerDao.getAllActivities());
		mav.addObject("categories", customerDao.getAllCategories());
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "category", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByCategory(@RequestParam("category") int category, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByCategory(category);
		mav.addObject("activities", customerDao.getAllActivities());
		mav.addObject("categories", customerDao.getAllCategories());
		session.setAttribute("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "address", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByLocation(@RequestParam("address") int address, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByLocation(address);
		mav.addObject("activities", customerDao.getAllActivities());
		mav.addObject("categories", customerDao.getAllCategories());
		session.setAttribute("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "findFacilities.do", params = "activity", method = RequestMethod.POST)
	public ModelAndView findFacilitiesByActivity(@RequestParam("activity") int activity, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facilities = customerDao.searchFacilityByActivity(activity);
		mav.addObject("activities", customerDao.getAllActivities());
		mav.addObject("categories", customerDao.getAllCategories());
		session.setAttribute("facilities", facilities);
		mav.setViewName("findFacilities");
		return mav;
	}

	// TODO add from facility page
	@RequestMapping(path = "addFacilities.do", method = RequestMethod.GET)
	public ModelAndView addFacilities(@RequestParam("facilityId") int facilityId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer customer  =(Customer)session.getAttribute("customer");
		Facility facility = customerDao.addFacility(customer.getId(), facilityId);
		customer = customerDao.findCustomerById(customer.getId());
		mav.addObject("activities", customerDao.getAllActivities());
		mav.addObject("categories", customerDao.getAllCategories());
		session.setAttribute("facilities", customerDao.searchFacilityByPreferences(customer.getFacilityPreferences()));
		mav.addObject("addedMessage",
				"The following facility has been added to your facilities list: " + facility.getName());
		mav.setViewName("findFacilities");
		return mav;
	}

	@RequestMapping(path = "removeFacilities.do", method = RequestMethod.GET)
	public ModelAndView removeFacilities(@RequestParam("facilityId") int facilityId, HttpSession session) {
		Customer customer = (Customer)session.getAttribute("customer");
		Facility facility = customerDao.findFacilityById(facilityId);
		ModelAndView mav =  new ModelAndView();
		boolean removed = customerDao.removeFacility(customer.getId(), facility);
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		customer = customerDao.findCustomerById(customer.getId());
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:viewCustomer.do");
		return mav;
	}
	@RequestMapping(path="customerViewFacility.do", method = RequestMethod.GET)
	public ModelAndView customerViewFacility(HttpSession session, @RequestParam("facilityId") int facilityId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("cFacility", customerDao.findFacilityById(facilityId));
		mv.setViewName("customerFacilityView");
		return mv;
	}

}
