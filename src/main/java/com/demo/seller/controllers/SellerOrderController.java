package com.demo.seller.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.demo.entities.Orderdetail;
import com.demo.entities.Orders;
import com.demo.entities.Product;
import com.demo.entities.Shop;
import com.demo.entities.User;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.ProductService;
import com.demo.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("seller/order")
public class SellerOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ProductService productService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpSession session) {

        Shop shop = (Shop) session.getAttribute("shop");
        List<Orderdetail> orderdetails = orderDetailService.findByShop(shop.getId());
        modelMap.put("orderdetails", orderdetails);
        return "seller.order.index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "order-detail/{orderId}/{id}")
    public String detail(@PathVariable("id") int id,@PathVariable("orderId") int orderId, ModelMap modelMap, HttpSession session) {
        Shop shop = (Shop) session.getAttribute("shop");
        Orders orders = orderService.findById(orderId);
        User user = userService.findByUserId(orders.getUser().getId());
        Product product = productService.findById(id) ;
        Orderdetail orderdetail = orderDetailService.findByProductId(id);
       // List<Product> products = productService.findByShopId(shop.getId());

        modelMap.put("shop",shop);
        modelMap.put("user",user);
        modelMap.put("orders", orders);
        modelMap.put("product",product);
        modelMap.put("orderdetail",orderdetail);
        return "seller.order.detail";
    }
}
