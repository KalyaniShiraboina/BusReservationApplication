package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.Bus;
import com.demo.service.BusService;
import com.demo.service.RouteService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/buses")
public class BusController {
	
	 @Autowired
	    private BusService busService;

	    @Autowired
	    private RouteService routeService;

	    // View buses page
	    @GetMapping
	    public String viewBuses(Model model, HttpSession session) {

	        if(session.getAttribute("admin") == null) {
	            return "redirect:/admin/login";
	        }

	        model.addAttribute("bus", new Bus());
	        model.addAttribute("buses", busService.getAllBuses());
	        model.addAttribute("routes", routeService.getAllRoutes());

	        return "buses";
	    }

	    // Add bus
	    @PostMapping("/save")
	    public String saveBus(@ModelAttribute Bus bus) {
	        busService.saveBus(bus);
	        return "redirect:/admin/buses";
	    }

	    // Delete bus
	    @GetMapping("/delete/{id}")
	    public String deleteBus(@PathVariable Long id) {
	        busService.deleteBus(id);
	        return "redirect:/admin/buses";
	    }

}
