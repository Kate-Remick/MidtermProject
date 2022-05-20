package com.skilldistillery.fitnessfinder.data;

import com.skilldistillery.fitnessfinder.entities.Login;

public interface UserDAO {
	Login findUserById(int id);
	Login findBuUsernameAndPassword(String username, String password);
}
