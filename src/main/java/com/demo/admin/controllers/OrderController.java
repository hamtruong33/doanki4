package com.demo.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Orders;
import com.demo.services.OrderService;

@Controller
@RequestMapping("admin/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap modelMap , HttpServletRequest request) {
		List<Orders> orders = orderService.findAllorderby();
		PagedListHolder  pagedListHolder = new PagedListHolder(orders);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		
		return "order.index";
	}
	
}
