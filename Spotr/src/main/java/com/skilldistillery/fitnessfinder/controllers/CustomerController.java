package com.skilldistillery.fitnessfinder.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.CustomerDAO;
import com.skilldistillery.fitnessfinder.entities.Address;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.CustomerActivity;
import com.skilldistillery.fitnessfinder.entities.FacilityPreferences;
import com.skilldistillery.fitnessfinder.entities.Gender;
import com.skilldistillery.fitnessfinder.entities.Login;

@Controller
public class CustomerController {

	@Autowired
	private CustomerDAO customerDao;

	@RequestMapping(path = "createCustomer.do", method = RequestMethod.POST)
	public ModelAndView createCustomer(Customer customer, String dob, Address address, Gender gender,
			FacilityPreferences prefs, HttpSession session, @RequestParam("activities") String[] activityId,
			@RequestParam("skillLevel") int[] skillLevels) {
		ModelAndView mav = new ModelAndView();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		customer.setBirthDate(LocalDate.parse(dob, formatter));
		System.out.println(customer.getBirthDate());
		customer.setAddress(address);
		customer.setGender(gender);
		customer.setFacilityPreferences(prefs);
		Login login = (Login) session.getAttribute("loggedInUser"); // HELPED FROM JEREMY
		customer = customerDao.createCustomer(login, customer);
		List<CustomerActivity> customerActivities = new ArrayList<CustomerActivity>();
//		if (activityId != null && activityId.length > 0) {
//			for (int i = 0; i < activityId.length; i++) {
//				CustomerActivity ca = new CustomerActivity();
//				ca.setActivity(customerDao.findActivityById(Integer.parseInt(activityId[i])));
//				ca.setSkillLevel(skillLevels[i]);
//				ca.setCustomer(customer);
////				customer.removeCustomerActivity(ca);
//				customerActivities.add(ca);
//			}
//		}
//		customerDao.addCustomerActivities(customerActivities);
		session.setAttribute("customer", customer);
		mav.setViewName("customer");
		return mav;
	}
	

	@RequestMapping(path = "editCustomerInfo.do", method = RequestMethod.GET)
	public String editCustomerPage() {
		return "customerInfo";
	}

	@RequestMapping(path = "editCustomerInfo.do", method = RequestMethod.POST)
	public ModelAndView editCustomer(Customer customer, String dob, Address address, Gender gender,
			FacilityPreferences prefs, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		customer.setBirthDate(LocalDate.parse(dob, formatter));
		System.out.println(customer.getBirthDate());
		customer.setAddress(address);
		customer.setGender(gender);
		customer.setFacilityPreferences(prefs);
		Customer editedCustomer = customerDao.editCustomerInfo(customer);
		Login login = (Login) session.getAttribute("loggedInUser"); // HELPED FROM JEREMY
		customer = customerDao.createCustomer(login, customer);
		
		session.setAttribute("customer", customer);
		mav.setViewName("customer");
		return mav;
	}

	@RequestMapping(path = "editedCustomerInfo.do", method = RequestMethod.GET)
	public String editedCustomerPage() {
		return "customer";
	}

	@RequestMapping(path = "editCustomerAddress.do", method = RequestMethod.GET)
	public String editCustomerAddressPage() {
		return "customerAddress";
	}

	@RequestMapping(path = "editCustomerAddress.do", method = RequestMethod.POST)
	public ModelAndView editCustomerAddress(@RequestParam("customer") Customer customer, Address address,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		customer = customerDao.editCustomerAddress(customer, address);
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:editedCustomerInfo.do");
		return mav;
	}

	@RequestMapping(path = "editCustomerPrefs.do", method = RequestMethod.GET)
	public String editCustomerPrefsPage() {
		return "customerPrefs";
	}

	@RequestMapping(path = "editCustomerPrefs.do", method = RequestMethod.POST)
	public ModelAndView editCustomerPrefs(@RequestParam("customer") Customer customer, FacilityPreferences prefs,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		customer = customerDao.editFacilityPreferences(customer.getId(), prefs);
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:editedCustomerInfo.do");
		return mav;
	}

	@RequestMapping(path = "editCustomerActivities.do", method = RequestMethod.GET)
	public String editCustomerAcivities() {
		return "customerActivitiesForm";
	}

	@RequestMapping(path = "editCustomerActivities.do", method = RequestMethod.POST)
	public String editCustomerActivities(@RequestParam("customer") Customer customer,
			@RequestParam("activities") CustomerActivity... activities) {
		List<CustomerActivity> newActivities = new ArrayList<>();
		if (activities != null && activities.length > 0) {
			for (int i = 0; i < activities.length; i++) {
				newActivities.add(activities[i]);
			}
		}
		customerDao.editActivities(customer.getId(), newActivities);
		return "redirect:editedCustomerActivites.do";
	}

	@RequestMapping(path = "editedCustomerActivites.do", method = RequestMethod.GET)
	public String editedActivities() {
		return "customer";
	}

}
