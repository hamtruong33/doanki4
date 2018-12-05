package com.demo.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Item;
import com.demo.entities.Orderdetail;
import com.demo.entities.Orders;
import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.OrderService;
import com.demo.services.PayPalService;
import com.demo.services.ProductService;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ProductService productService;

	@Autowired
	private PayPalService payPalService;
	
	@Autowired
	private OrderService orderService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession httpSession, ModelMap modelMap) {
		// System.out.println(payPalService.getPayPalConfig());
		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
		if (cart == null) {
			httpSession.setAttribute("quantity", 0);
		} else {
			int quantity = 0;
			for (Item item : cart) {
				quantity = quantity + item.getQuantity();
			}
			httpSession.setAttribute("quantity", quantity);
		}
		modelMap.put("payPalConfig", payPalService.getPayPalConfig());
		return "cart.index";
	}

	//
	// add to cart
	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id, HttpSession httpSession, ModelMap modelMap,HttpServletRequest request) {
		//User user = (User) httpSession.getAttribute("user");
		
		if (httpSession.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.findById(id), 1));
			httpSession.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
			int index = exists(id, cart);
			if (index == -1) {
				cart.add(new Item(productService.findById(id), 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
		}
		modelMap.put("payPalConfig", payPalService.getPayPalConfig());
		String currentlink = request.getHeader("referer");
		String[] text = currentlink.split("\\W",0);
		//System.out.println(text[5]);
		if(text[5].equalsIgnoreCase("product")) {
			return "redirect:../../product";
		}else {
			return "redirect:../../home";
		}
		//return "redirect:../../cart";
	}

//	@RequestMapping(value = "success", method = RequestMethod.GET)
//	public String success(HttpSession httpSession, ModelMap modelMap, HttpServletRequest request) {
//		// httpSession.removeAttribute("cart");
////		PayPalSucess payPalSucess = new PayPalSucess();
////		PayPalResult payPalResult = payPalSucess.getPayPal(request, payPalService.getPayPalConfig());
//		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
//		//List<Orderdetail> orderdetails = new ArrayList<Orderdetail>();
//		
//		Orders orders = new Orders();
//		Date date = new Date();
//		orders.setNgaytao(date);
//		User user = (User) httpSession.getAttribute("user");
//		orders.setUser(user);
//		orders.setStatus(true);
//		orders.setHttt("cash");
//		orders.setName(date.toString());
//		// orders.set
//		Set<Orderdetail> orderdetails = new HashSet<Orderdetail>(0);
//		for (Item item : cart) {
//			Orderdetail orderdetail = new Orderdetail();
//			orderdetail.setProduct(item.getProduct());
//			orderdetail.setPrice(item.getProduct().getPrice());
//			orderdetail.setQuantity(item.getQuantity());
//			orderdetail.setOrders(orders);
//			orderdetails.add(orderdetail);
//		}
//		orders.setOrderdetails(orderdetails);
//		
//		orderService.save(orders);
//		
//		httpSession.removeAttribute("cart");
//		return "cart.success";
//	}
	//

	// check trung
	private int exists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

	//
	// remove
	@RequestMapping(value = "remove/{index}", method = RequestMethod.GET)
	public String remove(@PathVariable("index") int index, HttpSession httpSession) {
		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
		cart.remove(index);
		httpSession.setAttribute("cart", cart);
		return "redirect:../../cart";
	}

	//
	// button minus
	@RequestMapping(value = "minus/{index}", method = RequestMethod.GET)
	public String minus(@PathVariable("index") int index, HttpSession httpSession) {
		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
		int quantity = cart.get(index).getQuantity() - 1;
		if (quantity <= 0) {
			cart.remove(index);
		} else {
			cart.get(index).setQuantity(quantity);
		}
		return "redirect:../../cart";
	}

	//
	// button plus
	@RequestMapping(value = "plus/{index}", method = RequestMethod.GET)
	public String plus(@PathVariable("index") int index, HttpSession httpSession) {
		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
		int quantity = cart.get(index).getQuantity() + 1;
		
		Product product = cart.get(index).getProduct();
		if (quantity > product.getQuantity()) {
			cart.get(index).setQuantity(quantity - 1);
		} else {
			cart.get(index).setQuantity(quantity);
		}
		return "redirect:../../cart";
	}
}
