package com.demo.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Item;
import com.demo.entities.Orderdetail;
import com.demo.entities.OrderdetailId;
import com.demo.entities.Orders;
import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.PayPalService;
import com.demo.services.ProductService;
import com.demo.services.UserService;


@Controller
@RequestMapping("checkout")
public class CheckOutController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private PayPalService payPalService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession httpSession ,ModelMap modelmap) {
		List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
		modelmap.put("cart", cart);
		modelmap.put("payPalConfig", payPalService.getPayPalConfig());
		return "checkout.index";
	}
	//
	//success ( place order)
	
	@RequestMapping(value="success" , method = RequestMethod.GET)
	public String success(HttpSession httpSession , ModelMap modelMap, Authentication authentication,
			HttpServletRequest request,
			@RequestParam(value = "cash", required = false) String cash,
			@RequestParam(value = "paypal", required = false) String paypal) {
		//User user = (User) httpSession.getAttribute("user");
		
//		if (authentication != null) {
			List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
			if (!cart.isEmpty()) {
				User user = userService.findByUsername(authentication.getName());
				Orders orders = new  Orders();
				orders.setName("hoa don user " + user.getId() );
				orders.setUser(user);
				
				
				orders.setDateCreated(new Date());
				orders.setStatus(false);
				Random rand = new Random();
				int n = rand.nextInt(10000)+ 10000;
				orders.setConfirmNumber(n);
				if (cash != null) {
					orders.setPaymentMethod("cash");

				}
				if (paypal != null) {
					
					PayPalSucess payPalSucess = new PayPalSucess();
					PayPalResult payPalResult = payPalSucess.getPayPal(request, payPalService.getPayPalConfig());
					if(payPalResult.getPayer_email()==null) {
						return "cart.index";
					}else {
						orders.setPaymentMethod("paypal");
					}
				}
				orderService.create(orders);
				double total = 0;
				for(Item item : cart) {
					Orderdetail orderdetail = new Orderdetail();
					orderdetail.setId(new OrderdetailId(orders.getId() , item.getProduct().getId()));
					orderdetail.setOrders(orders);
					orderdetail.setProduct(item.getProduct());
					orderdetail.setQuantity(item.getQuantity());
					orderdetail.setPrice(item.getQuantity() * item.getProduct().getPrice());
					total = total + item.getQuantity() * item.getProduct().getPrice();
					orderDetailService.save(orderdetail);
					Product product = item.getProduct();
					product.setQuantity(product.getQuantity()-item.getQuantity());
					productService.save(product);
				}
				modelMap.put("total", total);
				modelMap.put("user", user);
				modelMap.put("order", orders);
				httpSession.removeAttribute("cart");
				
				return "checkout.success";
			}else {
				modelMap.put("messerr", "You cart is empty.");
				return "cart.index";
			}
//		} else {
//			return "redirect:../home/login";
//		}
	}
	
}