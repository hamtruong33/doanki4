package com.demo.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/shop")
public class ShopAdminController {

	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "shop.index";
	}
	
}
