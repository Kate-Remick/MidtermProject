package com.skilldistillery.fitnessfinder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.fitnessfinder.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
}
