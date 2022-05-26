package com.skilldistillery.fitnessfinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.fitnessfinder.data.CustomerDAO;
import com.skilldistillery.fitnessfinder.entities.Customer;
import com.skilldistillery.fitnessfinder.entities.Goal;
import com.skilldistillery.fitnessfinder.entities.Journal;

@Controller
public class CustomerJournalController {

	@Autowired
	private CustomerDAO customerDao;

	@RequestMapping(path = "viewJournal.do", method = RequestMethod.GET)
	public ModelAndView viewJournalPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("hasIncompleteGoals", customerDao.customerHasUncompletedGoals(((Customer)session.getAttribute("customer")).getId()));
		Customer customer = customerDao.findCustomerById(((Customer)session.getAttribute("customer")).getId());
		session.setAttribute("customer", customer);
		mv.setViewName("journal");
		return mv;
	}

	@RequestMapping(path = "addJournal.do", method = RequestMethod.GET)
	public ModelAndView addJournalPageForm(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("incompleteGoals", customerDao.incompleteGoals(((Customer)session.getAttribute("customer")).getId()));
		mv.setViewName("journalForm");
		return mv;
	}

	@RequestMapping(path = "addJournal.do", method = RequestMethod.POST)
	public ModelAndView addJournalPage(Journal journal, HttpSession session, int goalId, boolean accomplished) {
		ModelAndView mav = new ModelAndView();
		Goal goal = customerDao.findGoalById(goalId);
		goal.setCompleted(accomplished);
		journal.setGoal(goal);
		journal.setCustomer((Customer) session.getAttribute("customer"));
		Customer customer = customerDao.addJournalEntry(journal);
		mav.addObject("hasIncompleteGoals", customerDao.customerHasUncompletedGoals(((Customer)session.getAttribute("customer")).getId()));
		session.setAttribute("customer", customer);
//		mav.addObject("recentEntry", journal);
		mav.setViewName("journal");
		return mav;
	}
	
	@RequestMapping(path = "addGoal.do", method = RequestMethod.POST)
	public ModelAndView addGoalPage(Goal goal, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer customer = (Customer)session.getAttribute("customer");
		goal.setCustomer(customer);
		customer = customerDao.addGoals(goal);
		mav.addObject("newGoal", goal);
		mav.addObject("hasIncompleteGoals", customerDao.customerHasUncompletedGoals(((Customer)session.getAttribute("customer")).getId()));
		session.setAttribute("customer", customer);
		mav.setViewName("journal");
		return mav;
	}

	@RequestMapping(path = "removeJournal.do", method = RequestMethod.GET)
	public ModelAndView removeJournalPage(@RequestParam("journalId") String journalId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean removed = customerDao.removeJournalEntry(Integer.parseInt(journalId));
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		Customer customer = (Customer)session.getAttribute("customer");
		customer = customerDao.findCustomerById(customer.getId());
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:viewJournal.do");
		return mav;
	}

	@RequestMapping(path = "addGoal.do", method = RequestMethod.GET)
	public String addGoalPageForm() {
		return "goalForm";
	}

	

	@RequestMapping(path = "removeGoal.do", method = RequestMethod.GET)
	public ModelAndView removeGoalPage(@RequestParam("goalId") String goalId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean removed = customerDao.removeGoals(Integer.parseInt(goalId));
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		Customer customer = (Customer)session.getAttribute("customer");
		customer = customerDao.findCustomerById(customer.getId());
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:viewJournal.do");
		return mav;
	}
	@RequestMapping(path = "completeGoal.do", method = RequestMethod.GET)
	public ModelAndView completePage(@RequestParam("goalId") String goalId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer customer =  customerDao.completeGoals(Integer.parseInt(goalId));
		customer = customerDao.findCustomerById(customer.getId());
		session.setAttribute("customer", customer);
		mav.setViewName("redirect:viewJournal.do");
		return mav;
	}
}
