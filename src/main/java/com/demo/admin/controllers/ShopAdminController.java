package com.demo.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Shop;
import com.demo.services.ShopService;

@Controller
@RequestMapping("admin/shop")
public class ShopAdminController {

	@Autowired
	private ShopService shopService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		List<Shop> shops = shopService.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(shops);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "adminshop.index";
	}

	//
	// delete
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		shopService.delete(id);
		return "redirect:../../shop";
	}

	// disable
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id) {
		Shop shop = shopService.findByShopId(id);
		if (shop.isStatus()) {
			shop.setStatus(false);
			shopService.save(shop);
			return "redirect:../../shop";
		}else {
			shop.setStatus(true);
			shopService.save(shop);
			return "redirect:../../shop";
		}
		
	}

}
