package com.demo.seller.controllers;

import com.demo.entities.Shop;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("seller/profile")
public class SellerProfileController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpSession session, ModelMap modelMap){
        Shop shop = (Shop) session.getAttribute("shop");
        modelMap.put("shop",shop);

        return "seller.profile" ;
    }

}
