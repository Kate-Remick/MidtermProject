package com.skilldistillery.fitnessfinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String viewJournalPage(HttpSession session) {
		return "journal";
	}

	@RequestMapping(path = "addJournal.do", method = RequestMethod.GET)
	public String addJournalPageForm() {
		return "journalForm";
	}

	@RequestMapping(path = "addJournal.do", method = RequestMethod.POST)
	public ModelAndView addJournalPage(Journal journal, HttpSession session, int goalId, boolean accomplished) {
		ModelAndView mav = new ModelAndView();
		Goal goal = customerDao.findGoalById(goalId);
		goal.setCompleted(accomplished);
		journal.setGoal(goal);
		journal.setCustomer((Customer) session.getAttribute("customer"));
		journal = customerDao.addJournalEntry(journal);
		session.setAttribute("customer", journal.getCustomer());
		mav.addObject("recentEntry", journal);
		mav.setViewName("journal");
		return mav;
	}

	@RequestMapping(path = "removeJournal.do", method = RequestMethod.GET)
	public ModelAndView removeJournalPage(@RequestParam("journalId") int journalId) {
		ModelAndView mav = new ModelAndView();
		boolean removed = customerDao.removeJournalEntry(journal);
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		mav.setViewName("journal");
		return mav;
	}

	@RequestMapping(path = "addGoal.do", method = RequestMethod.GET)
	public String addGoalPageForm() {
		return "goalForm";
	}

	@RequestMapping(path = "addGoal.do", method = RequestMethod.POST)
	public ModelAndView addGoalPage(Goal goal) {
		ModelAndView mav = new ModelAndView();
		goal = customerDao.addGoals(goal);
		mav.addObject("newGoal", goal);
		mav.setViewName("goal");
		return mav;
	}

	@RequestMapping(path = "removeGoal.do", method = RequestMethod.GET)
	public ModelAndView removeGoalPage(@RequestParam("goal") Goal goal) {
		ModelAndView mav = new ModelAndView();
		boolean removed = customerDao.removeGoals(goal);
		if (removed) {
			mav.addObject("removed", "Removal successful");
		}
		mav.setViewName("goal");
		return mav;
	}
}
