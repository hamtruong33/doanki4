package com.demo.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.User;

@Controller
@RequestMapping("admin/home")
public class HomeAdminController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "adminhome.index";
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
