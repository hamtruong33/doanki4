package com.demo.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.Group1;
import com.demo.entities.Orders;
import com.demo.entities.Roleforuser;
import com.demo.entities.User;
import com.demo.helper.BCrypt;
import com.demo.services.OrderService;
import com.demo.services.RoleService;
import com.demo.services.UserService;
import com.demo.validators.UserValidator;

@Controller
@RequestMapping("admin/account")
public class AccountController {

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		List<User> users = userService.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(users);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "account.index";

	}

	//
	// delete button
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {

		List<Orders> orders = orderService.findbyuser(id);
		if (orders.isEmpty()) {
			userService.delete(id);
			return "redirect:../../account";
		} else {
			redirectAttributes.addFlashAttribute("msg", "This account having orders ,so you can't delete it");
			return "redirect:../../account?msg=delete";
		}

	}
	// go to add account page
	@RequestMapping(method = RequestMethod.GET, value = "addaccount")
	public String addAccount(ModelMap modelMap) {
		modelMap.put("account", new User());
		return "account.add";
	}

	// add button
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Validated({ Group1.class }) @ModelAttribute("account") User user, BindingResult bindingResult,
			HttpServletRequest request, ModelMap modelMap) {

		UserValidator userValidator = new UserValidator();

		userValidator.validate(user, bindingResult);

		// get value role using HttpServletRequest
		int role = Integer.parseInt(request.getParameter("role"));
		if (bindingResult.hasErrors()) {
			return "account.add";
		} else {
			User user2 = userService.findByUsername(user.getUsername());
			if (user2 == null) {
				BCrypt encoder = new BCrypt();
				user.setPassword(encoder.hashpw(user.getPassword(), BCrypt.gensalt()));
				if (userService.save(user) != null) {
					Roleforuser roleforuser = roleService.findById(role);
					roleforuser.getUsers().add(user);
					roleService.save(roleforuser);
					return "redirect:../../account";
				} else {
					modelMap.put("msg", "Register False");
					return "account.add";
				}

			} else {
				modelMap.put("msg", "Username has been taken ");
				return "account.add";
			}
		}

	}

	// disable account
	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, HttpServletRequest request, ModelMap modelMap) {
		List<Roleforuser> roleforusers = roleService.findAll();
		modelMap.put("roleforusers", roleforusers);
		User user = userService.findByUserId(id);
		String status = request.getParameter("status");

		// user.setStatus(status);
		userService.save(user);
		return "redirect:../../account";
	}

}
