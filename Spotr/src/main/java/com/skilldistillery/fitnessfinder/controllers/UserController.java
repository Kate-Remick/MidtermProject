package com.skilldistillery.fitnessfinder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.fitnessfinder.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("DEBUG", dao.findUserById(1));
		return "home";
		
	}
	
	//DUMMY METHOD FOR TESTING JSP PAGES
	@RequestMapping(path = "customer.do")
	public String dummyCustomer(Model model) {
		return "customer";
	}
	
	//DUMMY METHOD FOR TESTING JSP PAGES
	@RequestMapping(path = "facility.do")
	public String dummyFacility(Model model) {
		return "facility";
	}

	//DUMMY METHOD FOR TESTING JSP PAGES
	@RequestMapping(path = "newCustomer.do")
	public String dummyNewCustomer(Model model) {
		return "new_customer";
	}
	
}
