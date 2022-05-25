package com.skilldistillery.fitnessfinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.UserDAO;
import com.skilldistillery.fitnessfinder.entities.Login;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			Login login = userDao.findByUsernameAndPassword(username, password);
			if (login == null ) {
				return "home";
			} else if (login.getRole().getId() == 1) {
				session.setAttribute("loggedInUser", login);
				session.setAttribute("customer", userDao.loginCustomerUser(login));
				return "customer";
			} else if (login.getRole().getId() == 2) {
				session.setAttribute("loggedInUser", login);
				session.setAttribute("facility", userDao.loginFacilityUser(login));
				return "facility";
			}
		}
		return "home";
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		if (session.getAttribute("customer") != null) {
			session.removeAttribute("customer");
		}
		if (session.getAttribute("facility") != null) {
			session.removeAttribute("facility");
		}
		return "redirect:home.do";
	}

	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public String createLogin() {

		return "createLogin";
	}

	@RequestMapping(path = "create.do", method = RequestMethod.POST)
	public ModelAndView createdLogin(@RequestParam("roleId")int roleId, Login login, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("activities", userDao.getAllActivities());

		if (userDao.checkIfUsernameExists(login.getUsername())) {
			mav.addObject("message", "Username already exists");
			mav.setViewName("createLogin");
		} else {
			switch (roleId) {
			case 1:
				login = userDao.createCustomerUser(login.getUsername(), login.getPassword());
				session.setAttribute("loggedInUser", login);
				mav.setViewName("createCustomer");
				break;
			case 2:
				login = userDao.createFacilityUser(login.getUsername(), login.getPassword());
				session.setAttribute("loggedInUser", login);
				mav.setViewName("createFacility");
				break;
			default:
				mav.setViewName("home");
				break;
			}
		}
		return mav;
	}

}
