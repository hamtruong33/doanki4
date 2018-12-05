package com.demo.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.User;
import com.demo.services.UserService;

@Controller
@RequestMapping("admin/account")
public class AccountController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap modelMap , HttpServletRequest request) {
		List<User>  users = userService.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(users);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "account.index";
		
	}
	//
	//delete button
	@RequestMapping(value="delete/{id}" , method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		
		
		return "redirect:../../account";
	}
	
	//disable account
	@RequestMapping(value="disable/{id}",method=RequestMethod.POST)
	public String disable(@PathVariable("id") int id,HttpServletRequest request) {
		User user = userService.findByUserId(id);
		String status = request.getParameter("status");
		//user.setStatus(status);
		userService.save(user);
		return "redirect:../../account";
	}
//	@RequestMapping(method=RequestMethod.GET,value="addaccount")
//	public String addAccount() {
//		return "account.add";
//	}
}
