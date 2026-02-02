package com.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	
	Admin findByAdminUsername(String adminUsername);

}
