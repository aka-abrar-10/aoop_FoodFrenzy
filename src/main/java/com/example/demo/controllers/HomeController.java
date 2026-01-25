package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entities.Product;
import com.example.demo.entities.User;
import com.example.demo.loginCredentials.AdminLogin;
import com.example.demo.services.ProductServices;
import com.example.demo.services.UserServices;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private ProductServices productServices;

	@Autowired
	private UserServices userServices;

	@GetMapping(value = { "/home", "/" })
	public String home(Model model, HttpSession session) {
		// Get user name from session if logged in
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			model.addAttribute("name", userName);
		}
		return "Home";
	}

	@GetMapping("/products")
	public String products(Model model, HttpSession session) {
		List<Product> allProducts = this.productServices.getAllProducts();
		model.addAttribute("products", allProducts);
		// Get user name from session if logged in
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			model.addAttribute("name", userName);
		}
		return "Products";
	}

	@GetMapping("/location")
	public String location(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			model.addAttribute("name", userName);
		}
		return "Locate_us";
	}

	@GetMapping("/about")
	public String about(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			model.addAttribute("name", userName);
		}
		return "About";
	}

	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		model.addAttribute("adminLogin", new AdminLogin());
		String userName = (String) session.getAttribute("userName");
		if (userName != null) {
			model.addAttribute("name", userName);
		}
		return "Login";
	}

	@GetMapping("/AdminLogin.html")
	public String adminLoginPage(Model model) {
		model.addAttribute("adminLogin", new AdminLogin());
		return "AdminLogin";
	}

	@GetMapping("/CustomerLogin.html")
	public String customerLoginPage() {
		return "CustomerLogin";
	}

	// Register page - show registration form
	@GetMapping(value = { "/register.html", "/register" })
	public String registerPage(Model model) {
		model.addAttribute("userRegistration", new User());
		return "register";
	}

	// Register - process registration form
	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user, Model model) {
		try {
			// Check if email already exists
			User existingUser = userServices.getUserByEmail(user.getUemail());
			if (existingUser != null) {
				model.addAttribute("userRegistration", new User());
				model.addAttribute("error", "Email already registered! Please use a different email.");
				return "register";
			}
			// Save new user
			userServices.addUser(user);
			// Redirect to login page with success message
			return "redirect:/CustomerLogin.html";
		} catch (Exception e) {
			model.addAttribute("userRegistration", new User());
			model.addAttribute("error", "Registration failed. Please try again.");
			return "register";
		}
	}

	// Logout - clear session and redirect to home
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// Clear all session attributes
		session.invalidate();
		return "redirect:/home";
	}
}