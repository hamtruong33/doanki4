package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Shop;

@Controller
@RequestMapping("shoplogin")
public class LoginSellerController {
	
	// go to login shop page
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
		modelMap.put("shop", new Shop());
		return "shop.login";
	}
}
