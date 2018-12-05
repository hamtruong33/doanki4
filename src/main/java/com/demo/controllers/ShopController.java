package com.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.BestSeller;
import com.demo.entities.Orderdetail;
import com.demo.entities.Product;
import com.demo.entities.Shop;
import com.demo.services.OrderDetailService;

@Controller
@RequestMapping("/shop**")
public class ShopController {
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession session,ModelMap modelMap) {
		List<BestSeller> bestSellers = orderDetailService.bestseller();
		for (BestSeller bestSeller : bestSellers) {
			System.out.println(bestSeller.getSum());
		}
		//modelMap.put("orderdetails", orderdetails);
		return "shop.index";
		
	}


}
