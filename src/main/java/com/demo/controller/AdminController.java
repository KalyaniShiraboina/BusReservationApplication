package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.model.Admin;
import com.demo.model.Reservation;
import com.demo.service.AdminService;
import com.demo.service.FeedbackService;
import com.demo.service.ReservationService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	

    @Autowired
    private AdminService adminService;

    // Admin Login Page
    @GetMapping("/login")
    public String adminLoginPage() {
        return "admin-login";
    }
    
    
 // Admin Login Action
    @PostMapping("/login")
    public String adminLogin(@RequestParam String username,
                             @RequestParam String password,
                             HttpSession session) {

        Admin admin = adminService.login(username, password);

        if (admin != null) {
            session.setAttribute("admin", admin);
            return "admin-dashboard";
        }

        return "admin-login";
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
    
    @Autowired
    private ReservationService reservationService;

    // View all reservations
    @GetMapping("/reservations")
    public String viewReservations(Model model, HttpSession session) {

        if(session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<Reservation> reservations = reservationService.getAllReservations();
        model.addAttribute("reservations", reservations);

        return "admin-reservations";
    }
    
    
    @GetMapping("/cancel-reservation/{id}")
    public String cancelByAdmin(@PathVariable Long id) {
        reservationService.cancelReservation(id);
        return "redirect:/admin/reservations";
    }
    
    
    
    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/feedbacks")
    public String viewFeedbacks(Model model, HttpSession session) {

        if(session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("feedbacks", feedbackService.getAllFeedbacks());
        return "admin-feedbacks";
    }
    
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        return "admin-dashboard";
    }

    
    
   




}
