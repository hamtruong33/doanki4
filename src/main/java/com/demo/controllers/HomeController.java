package com.demo.controllers;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.BestSeller;
import com.demo.entities.Group1;
import com.demo.entities.Product;
import com.demo.entities.Roleforuser;
import com.demo.entities.Shop;
import com.demo.entities.User;
import com.demo.services.EmailService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.ProductService;
import com.demo.services.ReviewService;
import com.demo.services.RoleService;
import com.demo.services.ShopService;
import com.demo.services.UserService;
import com.demo.validators.ShopValidator;
import com.demo.validators.UserValidator;

@Controller
@RequestMapping("home")
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// @Autowired
	// private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private ReviewService reviewService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("listnewproduct", productService.listNewProduct(4));
		List<Product> products = new ArrayList<Product>();
		for(BestSeller bestsaller : productService.bestseller()) {
			products.add(productService.findById(bestsaller.getProductid()));
		}
		modelMap.put("bestseller", products);
		return "home.index";

		
	}
	//go to login user page
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String index(ModelMap modelMap,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "accessDenied", required = false) String accessDenied,
			Authentication authentication) {
		if (error != null) {
			modelMap.put("msg", "Invalid username or password");

		}
		if (logout != null) {
			modelMap.put("msg", "Logout Successfully");
		}
		if(accessDenied!=null) {
			modelMap.put("msg", "Access Denied");
		}
		// if(authentication ==null) {
			
			User user = new User();
			modelMap.put("user", user);
			
			return "home.loginAndRegister";
		// }else {
		// 	User user = userService.findByUsername(authentication.getName());
		// 	modelMap.put("user", user);
		// 	modelMap.put("ordersdetails", orderDetailService.findByUser(user.getId()));
		// 	modelMap.put("reviews", reviewService.findallByIdUser(user.getId()));
		// 	return "redirect:../../profile";
		// }
		
	}
	

	//function for user register
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@Validated({ Group1.class }) @ModelAttribute("user") User user, BindingResult bindingResult,
			HttpSession session, HttpServletRequest request // BindingResult bindingResult luon luon phai dat sau doi
															// tuong can validation , neu ko thi se validation se ko
															// hoat dong
			, ModelMap modelMap) {

		UserValidator userValidator = new UserValidator();

		userValidator.validate(user, bindingResult);

		if (bindingResult.hasErrors()) {
			return "home.loginAndRegister";
		} else {
			User user2 = userService.findByUsername(user.getUsername());
			if (user2 == null) {
				String captcha = session.getAttribute("captcha_security").toString();
				String recaptcha = request.getParameter("captcha");
				if (captcha.equals(recaptcha)) {
					BCrypt encoder = new BCrypt();
					user.setPassword(encoder.hashpw(user.getPassword(), BCrypt.gensalt()));
					// user.setShop(false);
					// userService.save(user);

					if (userService.save(user) != null) {
						Roleforuser roleforuser = roleService.findById(1);
						roleforuser.getUsers().add(user);
						roleService.save(roleforuser);
						modelMap.put("msgl", "Register Successfully");
					} else {
						modelMap.put("msgl", "Register False");
					}
					return "home.loginAndRegister";
				} else {
					modelMap.put("error1", "Invalid Captcha");
					return "home.loginAndRegister";
				}

			} else {
				modelMap.put("msg1", "Username has been taken ");
				return "home.loginAndRegister";
			}

		}

	}
	//
	// go to forgot password
	@RequestMapping(value = "gotoforgotpassword", method = RequestMethod.GET)
	public String gotoforgotpassword() {
		return "account.forgotPassword";
	}

	//
	// go to reset password
	@RequestMapping(value = "resetPassword", method = RequestMethod.GET)
	public String resetpassword(ModelMap modelMap, @RequestParam(value = "token", required = false) String token) {
		modelMap.put("token", token);
		return "account.resetPassword";
	}
	//
	// forgot password

	@RequestMapping(value = "forgot", method = RequestMethod.POST)
	public String forgot(HttpServletRequest request, ModelMap modelMap) {
		// Lookup user in database by e-mail
		String email = request.getParameter("email");
		User user = userService.findByEmail(email);

		if (user == null) {
			modelMap.put("messerr", "We didn't find an account for that e-mail address.");
			return "account.forgotPassword";
		} else {
			// Generate random 36-character string token for reset password
			user.setToken(UUID.randomUUID().toString());

			// Save token to database
			userService.save(user);

			String appUrl = request.getScheme() + "://" + request.getServerName() + ":9596";

			// Email message
			SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
			// passwordResetEmail.setFrom("Spring boot");
			passwordResetEmail.setTo(user.getEmail());
			passwordResetEmail.setSubject("Password Reset Request");
			passwordResetEmail.setText("To reset your password, click the link below:\n" + appUrl
					+ "/home/resetPassword?token=" + user.getToken());

			emailService.sendEmail(passwordResetEmail);

			modelMap.put("messerr", "A password reset link has been sent to " + email);
			return "account.forgotPassword";
		}
	}

	//
	// reset password
	@RequestMapping(value = "setNewPassword", method = RequestMethod.POST)
	public String setNewPassword(ModelMap modelMap, @RequestParam(value = "token", required = false) String token,
			@ModelAttribute("user") User user, HttpServletRequest request) {

		// Find the user associated with the reset token
		user = userService.findByToken(token);
		if (user != null) {

			// Set new password

			String password = request.getParameter("newpassword");
			String confirmpass = request.getParameter("confirmpassword");

			if (password.equalsIgnoreCase(confirmpass)) {
				user.setPassword(bCryptPasswordEncoder.encode(password));
			} else {
				modelMap.put("messerr", "Oops! Passwords do not match");
				return "account.resetPassword";
			}

			// Set the reset token to null so it cannot be used again
			user.setToken(null);

			// Save user
			userService.save(user);

			modelMap.put("messerr", "You have successfully reset your password.  You may now login.");
			return "home.loginAndRegister";
		} else {

			modelMap.put("messerr", "Oops!  This is an invalid password reset link.");
			return "account.resetPassword";
		}

	}
	
	
}
