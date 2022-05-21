package com.skilldistillery.fitnessfinder.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.fitnessfinder.data.UserDAO;
import com.skilldistillery.fitnessfinder.entities.Login;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDao;
	// TODO
	// THIS IS JUST A SAMPLE FROM THE OTHER STUFF TO LOOK AT FOR NOW
	// THIS IS JUST A SAMPLE FROM THE OTHER STUFF TO LOOK AT FOR NOW
	// THIS IS JUST A SAMPLE FROM THE OTHER STUFF TO LOOK AT FOR NOW
	// THIS IS JUST A SAMPLE FROM THE OTHER STUFF TO LOOK AT FOR NOW
	// THIS IS JUST A SAMPLE FROM THE OTHER STUFF TO LOOK AT FOR NOW
	// TODO

//	GET/POST login.do - If a user is logged in and requests login.do, they should be redirected to index.do.
//	GET login.do displays the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "redirect:index.do";
		}
		return "login";
	}

//	POST login.do attempts to log in the user by retrieving it from the DAO. 
//	If the userName and password match the DAO data, load the User object into session,
//	and redirect to the account page, account.do. 
//	If the login fails, display the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(Login login, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "redirect:index.do";
		}
		login = userDao.findByUsernameAndPassword(login.getUsername(), login.getPassword());
		if (login != null) {
			session.setAttribute("loggedInUser", login);
			session.setAttribute("loginTime", LocalDateTime.now());
			return "redirect:account.do";
		} else {
			return "login";
		}
	}

//	logout.do removes the user from session and redirects to index.do.
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:index.do";
	}

//	@RequestMapping(path="logout.do")
//	public ModelAndView logout(HttpSession session) {
//		session.removeAttribute("loggedInUser");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:index.do");
//		return mv;
//	}

	public boolean sessionTimedOut(HttpSession session) {
		LocalDateTime loginTime = (LocalDateTime) session.getAttribute("loginTime");
		if (java.time.Duration.between(loginTime, LocalDateTime.now()).getSeconds() > 60 * 30) {
			return true;
		}
		return false;
	}

}
