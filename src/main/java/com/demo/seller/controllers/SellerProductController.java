package com.demo.seller.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.demo.entities.*;
import com.demo.services.CategoryService;
import com.demo.services.PhotoService;
import com.demo.services.ProducerService;
import com.demo.services.ProductService;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.views.CreateProductDomain;


@Controller
@RequestMapping("seller/product")
public class SellerProductController implements ServletContextAware {

    private ServletContext servletContext;
    
    @Autowired
    private PhotoService photoService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProducerService producerService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpSession session, HttpServletRequest request) {

        List<Product> products = new ArrayList<Product>();
        Shop shop = (Shop) session.getAttribute("shop");
        int id = shop.getId();

        products = productService.findByShopId(id);
        modelMap.put("products",products);

        return "seller.product.index";
    }

    // Add product in from

    @RequestMapping(method = RequestMethod.GET, value = "add-product")
    public String addProduct(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {
        List<Category> categories = (List<Category>) categoryService.findAll();
        modelMap.put("categories", categories);
        List<Producer> producers = (List<Producer>) producerService.findAll();
        modelMap.put("producers", producers);
        return "seller.addproduct";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(HttpSession session, CreateProductDomain createProductDomain, ModelMap modelMap,
                       @RequestParam(value = "images") MultipartFile[] images) {
        Shop shop = (Shop) session.getAttribute("shop");

        Product product = new Product();
        product.setShop(shop);
        productService.mapCreateModel(createProductDomain, product);

        Product savedProduct = productService.save(product);

        // Continues set photo after saved product to database successful
        for (MultipartFile image : images) {
            String imageName = saveImage(image);
            Photo photo = new Photo();
            photo.setName(imageName);
            photo.setProduct(savedProduct);
            photoService.save(photo);
        }

        // Binding product to View for displaying result
        modelMap.put("newProduct", product);
        return "redirect:/seller/product";
    }

    private String saveImage(MultipartFile multipartFile) {
        try {
            byte[] bytes = multipartFile.getBytes();
            Path path = Paths
                    .get(servletContext.getRealPath("/resources/imageProductUpload/" + multipartFile.getOriginalFilename()));
            Files.write(path, bytes);
            return multipartFile.getOriginalFilename();
        } catch (IOException e) {
            return null;
        }
    }
    // delete product

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        productService.delete(id);
        return "redirect:/seller/product";
    }

    // update product
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") int id, ModelMap modelMap, Product product) {

        product = productService.findById(id);
        modelMap.put("product", product);
        List<Category> categories = (List<Category>) categoryService.findAll();
        modelMap.put("categories", categories);
        List<Producer> producers = (List<Producer>) producerService.findAll();
        modelMap.put("producers", producers);

        return "seller.editproduct";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.POST)
    public String saveupdate(@PathVariable("id") int id, CreateProductDomain createProductDomain, ModelMap modelMap,
                             @RequestParam(value = "images") MultipartFile[] images) {

        Product product = productService.findById(id);
        productService.mapCreateModel(createProductDomain, product);
        Product savedProduct = productService.save(product);

        // Continues set photo after saved product to database successful
        for (MultipartFile image : images) {
            if (!image.isEmpty()) {
                String imageName = saveImage(image);
                imageName = FilenameUtils.getBaseName(imageName) + "-" + System.nanoTime() + "." + FilenameUtils.getExtension(imageName);
                Photo photo = new Photo();
                photo.setName(imageName);
                photo.setProduct(savedProduct);
                photoService.save(photo);
            }
        }

        // Binding product to View for displaying result
        modelMap.put("product", savedProduct);
        return "redirect:/seller/product";
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

}
