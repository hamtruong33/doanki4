package com.demo.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/role")
public class RoleController {

	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "role.index";
	}
	@RequestMapping(method=RequestMethod.GET,value="addrole")
	public String addrole() {
		return "role.add";
	}
	
}
