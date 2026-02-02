package com.demo.service;

import com.demo.model.User;

public interface UserService {
	 User registerUser(User user);
	    User login(String username, String password);

}
