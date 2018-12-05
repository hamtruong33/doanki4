package com.demo.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Group1;
import com.demo.entities.Group2;
import com.demo.entities.User;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.ReviewService;
import com.demo.services.UserService;
import com.demo.validators.UserValidator;

@Controller
@RequestMapping("user")
public class UserController implements ServletContextAware{

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ServletContext servletContext;

//	@RequestMapping(method = RequestMethod.GET)
//	public String index(ModelMap modelMap, @RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout) {
//		if (error != null) {
//			modelMap.put("msg", "Invalid username or password");
//
//		}
//		if (logout != null) {
//			modelMap.put("msg", "Logout Successfully");
//		}
//		User user = new User();
//		modelMap.put("user", user);
//		return "user.index";
//	}
//
//	@RequestMapping(value = "login", method = RequestMethod.POST)
//	public String login(
//
//			ModelMap modelMap, HttpSession session, @ModelAttribute("user") User user) {
//
//		if (userService.findByUsername(user.getUsername()) != null) {
//			User user2 = userService.findByUsername(user.getUsername());
//			if (BCrypt.checkpw(user.getPassword(), user2.getPassword())) {
//				session.setAttribute("user", user2);
//				return "user.profile";
//			} else {
//				modelMap.put("msg", "Co ghi do sai sai ");
//				return "user.index";
//			}
//		} else {
//			modelMap.put("msg", "Tai Khoan Khong Ton Tai ");
//			return "user.index";
//
//		}
//
//	}

//	@RequestMapping(value = "logout", method = RequestMethod.GET)
//	public String logout() {
//		
//		return "redirect:../home/login";
//	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile( ModelMap modelMap,Authentication authentication) {
//		if(authentication==null){
//			return "redirect:../home/login";
//		}else{
			System.out.println(authentication.getAuthorities());
			User user = userService.findByUsername(authentication.getName());
			modelMap.put("user", user);
			modelMap.put("ordersdetails", orderDetailService.findByUser(user.getId()));
			modelMap.put("reviews", reviewService.findallByIdUser(user.getId()));
			
			return "user.profile";
//		}
		


	}
	

	@RequestMapping(value = "setting", method = RequestMethod.GET)
	public String setting(HttpSession session, ModelMap modelMap,Authentication authentication) {
//		if(authentication==null){
//			return "redirect:../home/login";
//		}else{
			User user = userService.findByUsername(authentication.getName());
			user.setPassword("");
			modelMap.put("user", user);
			return "user.setting";
//		}
		

	}

	

	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit(@Validated({Group2.class})@ModelAttribute("user")  User user,BindingResult bindingResult ,
			HttpSession session,
			@RequestParam("files") MultipartFile files) {
			UserValidator userValidator = new UserValidator();
		 
			userValidator.validate(user, bindingResult);

			if(bindingResult.hasErrors()) {
				return "user.setting";
			}else {
				BCrypt encoder = new BCrypt();
				
				User user2 = userService.findByUsername(user.getUsername());
				user2.setEmail(user.getEmail());
				user2.setAddress(user.getAddress());
				user2.setPhone(user.getPhone());
				user2.setFullName(user.getFullName());
				//System.out.println(encoder.checkpw(user.getPassword(), user2.getPassword()));
				user2.setPhoto(saveImg(files));
				if(user.getPassword().equalsIgnoreCase("")) {
					userService.save(user2);
				}else {
					user2.setPassword(encoder.hashpw(user.getPassword(), BCrypt.gensalt()));
					userService.save(user2);
				}
				
				
				//session.setAttribute("user", user2);		
				return "redirect:../user/profile";
			}
		
		
		
		
	}
	private String saveImg(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths
					.get(servletContext.getRealPath("/resources/images/user/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	//
	//
	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		this.servletContext = servletContext;
	}

	
}
