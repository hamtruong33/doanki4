package com.demo.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Product;
import com.demo.entities.Review;
import com.demo.entities.User;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;
import com.demo.services.ReviewService;
import com.demo.services.UserService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {
		List<Product> products = (List<Product>) productService.findAllByStatusAndQuantity();
		// modelMap.put("products", products);
		modelMap.put("listcategory", categoryService.findAll());
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		// pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "product.category";
	}

	@RequestMapping(value = "gotoCategory/{idCate}", method = RequestMethod.GET)
	public String gotoCategory(@PathVariable("idCate") int idCate, ModelMap modelMap, HttpServletRequest request) {
		List<Product> products = (List<Product>) productService.findListProductByCategory(idCate);
		// modelMap.put("products", products);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		// pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		modelMap.put("listcategory", categoryService.findAll());

		return "product.category";
	}

	//
	// go to product info
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String gotoProductInfo(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.findById(id));
		modelMap.put("listReview", reviewService.findallByIdProduct(id));
		return "product.detail";
	}

	// review
	@RequestMapping(value = "review/{productid}", method = RequestMethod.POST)
	public String review(HttpSession httpSession, @ModelAttribute("user") User user,
			@PathVariable("productid") int productid, HttpServletRequest request, Authentication authentication) {

		if (authentication == null) {
			return "redirect:../home/login";
		} else {
			String comment = request.getParameter("comment");
			Review review = new Review();
			review.setContent(comment);
			review.setDateCreated(new Date());
			review.setProduct(productService.findById(productid));
			review.setUser(userService.findByUsername(authentication.getName()));
			reviewService.save(review);
			return "redirect:../../product/detail/{productid}";

		}

	}
	//search
	@RequestMapping(value="search",method= RequestMethod.GET)
	public String search(HttpServletRequest request,ModelMap modelMap ) {
		String keyword = request.getParameter("keywordsearch");
		modelMap.put("listcategory", categoryService.findAll());
		List<Product> products= productService.searchProduct(keyword);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		// pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "product.search";
	}
	// @RequestMapping(value="search",method = RequestMethod.GET)
	// @ResponseBody
	// public List<String> search(HttpServletRequest request) {
	// String keyword = request.getParameter("term");
	// return productService.search(keyword);
	// }
}
