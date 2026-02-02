package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.Route;
import com.demo.service.RouteService;


import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/routes")
public class RouteController {

    @Autowired
    private RouteService routeService;

    // Show all routes
    @GetMapping
    public String viewRoutes(Model model, HttpSession session) {

        if(session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("routes", routeService.getAllRoutes());
        model.addAttribute("route", new Route());

        return "routes";
    }

    // Add route
    @PostMapping("/save")
    public String saveRoute(@ModelAttribute Route route) {
        routeService.saveRoute(route);
        return "redirect:/admin/routes";
    }

    // Delete route
    @GetMapping("/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        routeService.deleteRoute(id);
        return "redirect:/admin/routes";
    }
    
}

