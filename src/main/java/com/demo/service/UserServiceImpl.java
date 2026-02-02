package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.UserRepository;
import com.demo.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
    private UserRepository repo;

    @Override
    public User registerUser(User user) {
        return repo.save(user);
    }

    @Override
    public User login(String username, String password) {
        User user = repo.findByUsername(username);
        if(user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
	

}
