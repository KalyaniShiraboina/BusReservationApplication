package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.AdminRepository;
import com.demo.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository repo;

    @Override
    public Admin login(String username, String password) {
        Admin admin = repo.findByAdminUsername(username);
        if (admin != null && admin.getAdminPassword().equals(password)) {
            return admin;
        }
        return null;
    }
}
