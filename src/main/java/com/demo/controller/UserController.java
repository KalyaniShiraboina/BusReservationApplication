package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.dao.FeedbackRepository;
import com.demo.dao.ReservationRepository;
import com.demo.model.Bus;
import com.demo.model.Feedback;
import com.demo.model.Reservation;
import com.demo.model.User;
import com.demo.service.BusService;
import com.demo.service.FeedbackService;
import com.demo.service.ReservationService;
import com.demo.service.RouteService;
import com.demo.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private ReservationRepository reservationRepo;

    @Autowired
    private FeedbackRepository feedbackRepo;

    @Autowired
    private FeedbackService feedbaService;


    // 1️⃣ Registration page
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // 2️⃣ Handle registration
    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String password,
                               @RequestParam String firstName,
                               @RequestParam String lastName,
                               @RequestParam String contact,
                               @RequestParam String email,
                               Model model) {

        User existing = userService.login(username, password);
        if(existing != null) {
            model.addAttribute("error", "Username already exists");
            return "register";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setContact(contact);
        user.setEmail(email);

        userService.registerUser(user);
        model.addAttribute("success", "Registration successful. Please login.");

        return "login";
    }

    // 3️⃣ Login page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // 4️⃣ Handle login
    @PostMapping("/login")
    public String loginUser(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {

        User user = userService.login(username, password);

        if(user != null) {
            session.setAttribute("user", user);
            return "dashboard";
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    // 5️⃣ Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }
    
    
    @Autowired
    private BusService busService;

    @Autowired
    private RouteService routeService;

    // Search page
    @GetMapping("/search")
    public String searchPage(Model model) {
        model.addAttribute("routes", routeService.getAllRoutes());
        return "search-buses";
    }

    // Search result
    @PostMapping("/search")
    public String searchBuses(@RequestParam String source,
                              @RequestParam String destination,
                              Model model) {

        List<Bus> buses = busService.searchBuses(source, destination);
        model.addAttribute("buses", buses);

        return "available-buses";
    }
    
    @Autowired
    private ReservationService reservationService;

    // Show booking page
    @GetMapping("/book/{busId}")
    public String bookPage(@PathVariable Long busId, Model model, HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        model.addAttribute("busId", busId);
        return "book-ticket";
    }

    // Handle booking
    @PostMapping("/book")
    public String bookTicket(@RequestParam Long busId,
                             @RequestParam int seats,
                             HttpSession session,
                             Model model) {

        User user = (User) session.getAttribute("user");

        Reservation reservation = reservationService.bookSeat(busId, seats, user);

        if (reservation == null) {
            model.addAttribute("error", "Not enough seats available");
            return "book-ticket";
        }

        model.addAttribute("reservation", reservation);
        return "booking-success";
    }

    @GetMapping("/cancel/{id}")
    public String cancelBooking(@PathVariable Long id, HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        reservationService.cancelReservation(id);
        return "redirect:/user/my-reservations";
    }
    
    @GetMapping("/my-reservations")
    public String myReservations(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }

        model.addAttribute("reservations",
                reservationService.getReservationsByUser(user.getUserId()));

        return "my-reservations";
    }
    
    
    @GetMapping("/start-journey/{id}")
    public String startJourney(@PathVariable Long id, HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        reservationService.startJourney(id);
        return "redirect:/user/my-reservations";
    }

    @GetMapping("/end-journey/{id}")
    public String endJourney(@PathVariable Long id, HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        reservationService.endJourney(id);
        return "redirect:/user/my-reservations";
    }
    
    
    @Autowired
    private FeedbackService feedbackService;

    // Show feedback page
    @GetMapping("/feedback/{reservationId}")
    public String feedbackPage(@PathVariable Long reservationId,
                               HttpSession session,
                               Model model) {

        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }

        Reservation res = reservationRepo.findById(reservationId).orElse(null);

        if(res == null || !res.isJourneyEnded()) {
            return "redirect:/user/my-reservations";
        }

        // Prevent duplicate feedback
        if(feedbackRepo.findByReservationReservationId(reservationId) != null) {
            return "redirect:/user/my-reservations";
        }

        model.addAttribute("reservation", res);
        model.addAttribute("feedback", new Feedback());

        return "feedback";
    }

    // Save feedback
    @PostMapping("/feedback/save")
    public String saveFeedback(@ModelAttribute Feedback feedback,
                               @RequestParam Long reservationId,
                               HttpSession session) {

        User user = (User) session.getAttribute("user");

        Reservation res = reservationRepo.findById(reservationId).orElse(null);

        feedback.setReservation(res);
        feedback.setUser(user);
        feedback.setBus(res.getBus());

        feedbackService.saveFeedback(feedback);

        return "redirect:/user/my-reservations";
    }


    
    
   
}
