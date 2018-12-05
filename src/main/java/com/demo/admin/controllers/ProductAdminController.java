package com.demo.admin.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Photo;
import com.demo.entities.Product;
import com.demo.services.CategoryService;
import com.demo.services.PhotoService;
import com.demo.services.ProducerService;
import com.demo.services.ProductService;
import com.demo.services.ShopService;
import com.demo.validators.ProductValidator;

@Controller
@RequestMapping("admin/product")
public class ProductAdminController implements ServletConfigAware {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProducerService producerService;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private PhotoService photoService;

	@Autowired
	private ShopService shopService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		List<Product> products = (List<Product>) productService.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "productadmin.index";
	}
	@RequestMapping(value="checkproduct",method=RequestMethod.GET)
	public String checkproduct(ModelMap modelMap, HttpServletRequest request) {
		List<Product> products =  productService.findAllByStatus();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		modelMap.put("pagedListHolder", pagedListHolder);
		return "productadmin.checkproduct";
	}
	@RequestMapping(value="search",method=RequestMethod.GET)
	@ResponseBody//bao rang ham nay chi tra ve du lieu chu ko load cai view len (search trong thu muc views de load view len nhung o day thi ko )
	public List<String> search(HttpServletRequest request) {
		String keyword = request.getParameter("term");
		return productService.searchautocomple(keyword);
	}

	@RequestMapping(method = RequestMethod.GET, value = "edit/{id}")
	public String editproduct( @PathVariable("id") int id,ModelMap modelMap) {
		Product product = productService.findById(id);
		List<Photo> photos = photoService.findAllByProductId(id);
		modelMap.put("photos", photos);
		modelMap.put("product", product);
		modelMap.put("categories", categoryService.findAll());
		modelMap.put("producers", producerService.findAll());
		modelMap.put("shops", shopService.findAll());
		return "productadmin.edit";
	}
	@RequestMapping(method = RequestMethod.GET, value = "editphoto/{id}")
	public String editphoto( @PathVariable("id") int id,ModelMap modelMap) {
		Product product = productService.findById(id);
		List<Photo> photos = photoService.findAllByProductId(id);
		modelMap.put("photos", photos);
		modelMap.put("product", product);
		return "productadmin.editphoto";
	}

	@RequestMapping(method = RequestMethod.GET, value = "delete/{id}")
	public String deleteproduct(@PathVariable("id") int id) {
		for (Photo photo : photoService.findAllByProductId(id)) {
			photoService.delete(photo);
		}
		productService.delete(id);
		return "redirect:../";
	}

	@RequestMapping(method = RequestMethod.GET, value = "addproduct")
	public String addproduct(@ModelAttribute("product") Product product, ModelMap modelMap) {
		modelMap.put("categories", categoryService.findAll());
		modelMap.put("producers", producerService.findAll());
		modelMap.put("shops", shopService.findAll());
		return "productadmin.add";
	}
	@RequestMapping(method = RequestMethod.POST, value = "editsave")
	public String editsave(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
			@RequestParam(value = "file") MultipartFile[] files, ModelMap modelMap

	) {
		System.out.println("AAA");
		ProductValidator productValidator = new ProductValidator();
		productValidator.validate(product, bindingResult);
		if (bindingResult.hasErrors()) {
			return "productadmin.edit";
		} else {
			
			if (productService.save(product) != null) {
//				for (MultipartFile file : files) {
//					String fileName = saveFile(file);
//					photoService.save(new Photo(product, fileName));
//
//				}
				return "redirect:../product";
			} else {
				return "productadmin.edit";
			}
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "save")
	public String save(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
			@RequestParam(value = "file") MultipartFile[] files, ModelMap modelMap

	) {
		System.out.println("AAA");
		ProductValidator productValidator = new ProductValidator();
		productValidator.validate(product, bindingResult);
		if (bindingResult.hasErrors()) {
			//return "redirect:../product/addproduct";
			return "productadmin.add";
		} else {
			product.setDateCreated(new Date());
			if (productService.save(product) != null) {
				for (MultipartFile file : files) {
					String fileName = saveFile(file);
					photoService.save(new Photo(product, fileName));

				}
				return "redirect:../admin/product";
			} else {
				return "productadmin.add";
			}
		}
	}
	@RequestMapping(method =RequestMethod.GET,value = "deletephoto/{id}/{productid}")
	public String deletephoto(@PathVariable("id") int id,@PathVariable("productid") int productid) {
		
		photoService.deleteById(id);
		return "redirect:../../editphoto/"+productid;
	}
	@RequestMapping(method =RequestMethod.POST,value = "savephoto/{id}")
	public String savephoto(@RequestParam(value = "file") MultipartFile[] files,@PathVariable("id") int id) {
		Product product = productService.findById(id);
		if(files.length==1 && files[0].getSize()==0) {
			return "redirect:../editphoto/"+id;
		}else {
			for (MultipartFile file : files) {
				String fileName = saveFile(file);
				photoService.save(new Photo(product, fileName));

			}
			return "redirect:../editphoto/"+id;
		}
		
	}
	private String saveFile(MultipartFile file) {
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(this.servletContext.getRealPath("/resources/images/" + file.getOriginalFilename()));
			Files.write(path, bytes);
			return file.getOriginalFilename();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void setServletConfig(ServletConfig servletConfig) {
		this.servletContext = servletContext;

	}

}
