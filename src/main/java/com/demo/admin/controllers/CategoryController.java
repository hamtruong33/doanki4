package com.demo.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/category")
public class CategoryController {

	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "category.index";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addcategory")
	public String addcategory() {
		return "category.add";
	}
	
}
