package com.demo.seller.controllers;

import com.demo.entities.Membership;
import com.demo.entities.Shop;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.MembershipService;
import com.demo.services.PayPalService;
import com.demo.services.ShopService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;

//import com.paypal.base.rest.APIContext;
//import com.paypal.api.payments.Payment;
//import com.paypal.api.payments.PaymentExecution;
//import com.paypal.base.rest.PayPalRESTException;



@Controller
@RequestMapping("seller/membership")
public class SellerMemberShipController {

    @Autowired
    private PayPalService payPalService;

    @Autowired
    private ShopService shopService;

    @Autowired
    private MembershipService membershipService;



    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap){
        Membership membership1 = membershipService.findByMemberShipId(1);
        Membership membership2 = membershipService.findByMemberShipId(2);
        Membership membership3 = membershipService.findByMemberShipId(3);
        Membership membership5 = membershipService.findByMemberShipId(5);


        modelMap.put("paypalConfig",payPalService.getPayPalConfig());
        modelMap.put("membership1",membership1);
        modelMap.put("membership2",membership2);
        modelMap.put("membership3",membership3);
        modelMap.put("membership5",membership5);
        return "seller.membership";
    }

    @RequestMapping(value = "success/{id}", method = RequestMethod.GET)
    public String success(HttpSession session , ModelMap modelMap, HttpServletRequest request,@PathVariable("id") int id)
    {
        Shop shopBuyMemberShip = (Shop) session.getAttribute("shopBuyMemberShip");
        Date dateEnd = shopBuyMemberShip.getDateEnd();

//        PayPalSucess payPalSucess = new PayPalSucess();
//        PayPalResult payPalResult = payPalSucess.getPayPal(request, payPalService.getPayPalConfig());

        // id = Integer.parseInt(payPalResult.getItem_number());
        Membership membership = membershipService.findByMemberShipId(id);

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
       // c1.setTime(dateEnd);
        c2.setTime(new Date());
        c1.add(c2.DATE,membership.getDuration());

        shopBuyMemberShip.setDateEnd(c1.getTime());
        shopBuyMemberShip.setMembership(membership);
        shopBuyMemberShip.setStatus(true);
        shopService.save(shopBuyMemberShip);
//
//        System.out.println("Customer Info");
//        System.out.println("Email: " + payPalResult.getPayer_email());
//        System.out.println("First Name: " + payPalResult.getFirst_name());
//        System.out.println("Last Name: " + payPalResult.getLast_name());
//        System.out.println("Number Cart Item: "+payPalResult.getNum_cart_items());

        //createPayment(request);

        modelMap.put("shopBuy",shopBuyMemberShip);
        return "redirect:/seller/home";
    }

//    public Payment createPayment(HttpServletRequest req) {
//        Payment createdPayment = null;
//        String clientID = "AZ7v53MW0yBJOemnhSGw4jYsKwtCGbFJ0X0y1Pfo2Mxm0DofLkXPzUjO0tEnYGogNv2jGr9gjVch0jQB";
//        String clientSecret = "EID6xiejm644BupdfspjSr65LFMfdMUWuJOJUT1ROgDmHRrq5qrrDYj2oh31urzLdOez0RRN3UsGF7Sm";
//        String mode = "sandbox";
//
//        APIContext apiContext = new APIContext(clientID, clientSecret, mode);
//        if (req.getParameter("PayerID") != null) {
//            Payment payment = new Payment();
//            if (req.getParameter("guid") != null) {
//                payment.setId(map.get(req.getParameter("guid")));
//            }
//
//            PaymentExecution paymentExecution = new PaymentExecution();
//            paymentExecution.setPayerId(req.getParameter("PayerID"));
//            try {
//                createdPayment = payment.execute(apiContext, paymentExecution);
//            } catch (PayPalRESTException e) {
//            }
//        } else {
//
//        }
//        return createdPayment;
//    }

}
