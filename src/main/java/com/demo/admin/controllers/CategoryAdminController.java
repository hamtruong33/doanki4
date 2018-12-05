package com.demo.admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Category;
import com.demo.services.CategoryService;

@Controller
@RequestMapping("admin/category")
public class CategoryAdminController {
	
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap modelMap , HttpServletRequest request) {
		List<Category>  categories = categoryService.findAll();
		PagedListHolder  pagedListHolder = new PagedListHolder(categories);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "category.index";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addcategory")
	public String addcategory(ModelMap modelMap) {
		modelMap.put("category", new Category());
		return "category.add";
	}
	
	//
	//add button
	@RequestMapping(method=RequestMethod.POST,value="addcategory")
	public String addcategory(@ModelAttribute("category") Category category) {
		categoryService.save(category);
		return "redirect:../category";
	}
	
	//delete
	@RequestMapping(value= "delete/{id}" ,method = RequestMethod.GET )
	public String delete(@PathVariable("id") int id) {
		categoryService.delete(id);
		return "redirect:../../category";
	}
	//
	//go to page edit
	@RequestMapping(value ="edit/{id}" , method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id ,ModelMap modelMap) {
		Category category = categoryService.findByCategoryId(id);
		modelMap.put("category", category);
		category.setTier(category.getTier());
		return "category.edit";
	}
	//
	//edit button
	@RequestMapping(value="edit" , method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category) {
		categoryService.save(category);
		return "redirect:../category";
	}
	
	
}
