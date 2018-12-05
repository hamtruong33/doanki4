package com.demo.seller.controllers;

import com.demo.domain.views.CreateShopDomain;
import com.demo.entities.Membership;
import com.demo.entities.Orderdetail;
import com.demo.entities.Shop;
import com.demo.helper.BCrypt;
import com.demo.services.EmailService;
import com.demo.services.MembershipService;
import com.demo.services.OrderDetailService;
import com.demo.services.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("seller/home")
public class SellerHomeController implements ServletContextAware {

	private ServletContext servletContext;
	
	@Autowired
	private EmailService emailService;

	@Autowired
	private ShopService shopService;

	@Autowired
	private MembershipService membershipService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		List<Orderdetail> orderdetails =orderDetailService.findByShopNew(3);
		for (Orderdetail orderdetail : orderdetails) {
			System.out.println(orderdetail.getId());
		}
		
		return "seller.login";
	}

	 @RequestMapping(value = "login", method = RequestMethod.POST)
	    public String login(ModelMap modelMap, HttpSession session, @ModelAttribute("shop") Shop shop) {
	        if (shopService.findByEmail(shop.getEmail()) != null) {
	            Shop shop1 = shopService.findByEmail(shop.getEmail());
	            String hashedPw = shop1.getPassword();
	            String pw = shop.getPassword();
	            // new Date Check DateEnd
	            Date dateNow = new Date();
	            Date dateEnd = shop1.getDateEnd();
	            // check pass
	            if (BCrypt.checkpw(pw, hashedPw)) {
	                if (dateEnd.after(dateNow) || dateEnd.equals(dateNow)) {
	                    session.setAttribute("shop", shop1);
	                    modelMap.put("shop", shop1);
	                    return "seller.home";
	                } else if (dateEnd.before(dateNow)) {
	                    modelMap.put("msg","Your store has expired, please renew to continue using");
	                    session.setAttribute("shopBuyMemberShip", shop1);
	                    return "redirect:../../seller/membership";
	                } else {
	                    return "seller.login";
	                }

	            } else {
	                modelMap.put("msg", "Email or Password is wrong");
	                return "seller.login";
	            }
	        } else {
	            modelMap.put("msg", "Account does not exist ");
	            return "seller.login";

	        }
	    }

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		return "seller.register";
	}

	/* Save New Shop */
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(CreateShopDomain domain, ModelMap modelMap,
			@RequestParam(value = "profile") MultipartFile profile) {

		if (shopService.findByEmail(domain.getEmail()) != null) {
			modelMap.put("msg", "Shop already exists");
			return "seller.register";
		} else {
			Shop shopMap = new Shop();
			shopService.mapCreateModel(domain, shopMap);
			String fileName = saveImage(profile);
			shopMap.setProfile(fileName);
			shopService.save(shopMap);
			return "redirect:/seller/home";
		}

	}
	
	@RequestMapping(value = "updateProfile",method = RequestMethod.POST)
    public String updateProfile(HttpSession session, @RequestParam(value = "profile") MultipartFile profile){

        Shop shop = (Shop) session.getAttribute("shop");
        String fileName = saveImage(profile);
        shop.setProfile(fileName);
        shopService.save(shop);

        return "redirect:/seller/profile";
    }
	
	@RequestMapping(value = "updateInformation",method = RequestMethod.POST)
    public String updateInformation(HttpSession session, CreateShopDomain domain, ModelMap modelMap){

        Shop shop = (Shop) session.getAttribute("shop");
        modelMap.put("shop",shop);
        shopService.mapCreateModel(domain,shop);
        shopService.save(shop);

        return "redirect:/seller/profile";
    }


	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();

			Path path = Paths.get(servletContext
					.getRealPath("/resources/profileSellerUpload/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("shop");
		return "redirect:/seller/home";
	}

	public String checkMemberShip(Date dateNow, Date dateEnd) {
		if (dateEnd.after(dateNow)) {
			return "seller.home";
		} else if (dateEnd.equals(dateNow)) {
			return "seller.home";
		} else {
			return "seller.memberShip";
		}

	}
	
	//Fogot Password

    @RequestMapping(value = "forgot-Password", method = RequestMethod.GET)
    public String forgotPass() {
        return "seller.forgotPassword";
    }

    @RequestMapping(value = "resetPassword", method = RequestMethod.GET)
    public String resetpassword(ModelMap modelMap, @RequestParam(value = "token", required = false) String token) {
        modelMap.put("token", token);
        return "seller.resetPassword";
    }

    // forgot password

    @RequestMapping(value = "forgot", method = RequestMethod.POST)
    public String forgot(HttpServletRequest request, ModelMap modelMap) {
        // Lookup user in database by e-mail
        String email = request.getParameter("email");
        Shop shop = shopService.findByEmail(email);

        if (shop == null) {
            modelMap.put("msg", "We didn't find an account for that e-mail address.");
            return "seller.forgotPassword";
        } else {
            // Generate random 36-character string token for reset password
            shop.setToken(UUID.randomUUID().toString());

            // Save token to database
            shopService.save(shop);

            String appUrl = request.getScheme() + "://" + request.getServerName() + ":9596";

            // Email message
            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            // passwordResetEmail.setFrom("Spring boot");
            passwordResetEmail.setTo(shop.getEmail());
            passwordResetEmail.setSubject("Password Reset Request");
            passwordResetEmail.setText("To reset your password, click the link below:\n" + appUrl
                    + "/seller/home/resetPassword?token=" + shop.getToken());

            emailService.sendEmail(passwordResetEmail);

            modelMap.put("msg", "A password reset link has been sent to " + email +" Please move to the submitted link ");
            return "seller.successSendMail";
        }
    }

    @RequestMapping(value = "setNewPassword", method = RequestMethod.POST)
    public String setNewPassword(ModelMap modelMap, @RequestParam(value = "token", required = false) String token,
                                 @ModelAttribute("shop") Shop shop, HttpServletRequest request) {

        // Find the user associated with the reset token
        shop = shopService.findByToken(token);
        if (shop != null) {

            // Set new password

            String password = request.getParameter("newpassword");
            String confirmpass = request.getParameter("confirmpassword");

            if (password.equalsIgnoreCase(confirmpass)) {
                shop.setPassword(BCrypt.hashpw(password,BCrypt.gensalt(12)));
            } else {
                modelMap.put("msg", "Oops! Passwords do not match");
                return "seller.resetPassword";
            }

            // Set the reset token to null so it cannot be used again
            shop.setToken(null);

            // Save user
            shopService.save(shop);

            modelMap.put("msg", "You have successfully reset your password.  You may now login.");
            return "redirect:/seller/home";
        } else {

            modelMap.put("mmsg", "Oops!  This is an invalid password reset link.");
            return "seller.resetPassword";
        }

    }

	// @RequestMapping(value = "home", method = RequestMethod.GET)
	// public String login() {
	// return "seller.home";
	// }

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
