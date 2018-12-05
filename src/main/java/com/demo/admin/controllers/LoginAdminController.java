package com.demo.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.User;

@Controller
@RequestMapping("admin/login")
public class LoginAdminController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap  modelMap,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "accessdenied", required = false) String accessdenied
			) {
		if(error!=null) {
			modelMap.put("msg", "Invalid Username or Password");
		}
		if(logout!=null) {
			modelMap.put("msg", "Logout Successfully");
		}
		if(accessdenied!=null) {
			modelMap.put("msg", "Access Denied");
		}
		modelMap.put("user", new User());
		return "adminlogin.index";
	}
//	@RequestMapping(value="login",method=RequestMethod.GET)
//	public String login(ModelMap  modelMap,
//			@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout
//			) {
//		if(error!=null) {
//			modelMap.put("msg", "Invalid Username or Password");
//		}
//		if(logout!=null) {
//			modelMap.put("msg", "Logout Successfully");
//		}
//		modelMap.put("user", new User());
//		return "adminlogin.index";
//	}

}
