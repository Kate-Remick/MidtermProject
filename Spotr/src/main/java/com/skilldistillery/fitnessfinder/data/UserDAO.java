package com.skilldistillery.fitnessfinder.data;

import com.skilldistillery.fitnessfinder.entities.User;

public interface UserDAO {
	User findUserById(int id);
	User findBuUsernameAndPassword(String username, String password);
}
