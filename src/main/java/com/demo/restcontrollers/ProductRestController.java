package com.demo.restcontrollers;

import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.services.ProductService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.MimeTypeUtils;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/restproduct")
public class ProductRestController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "search/{keyword}", method = RequestMethod.GET, produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ProductEntity>> search(
			@PathVariable("keyword") String keyword
			) {
		try {
			return new ResponseEntity<List<ProductEntity>>(productService.search(keyword), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<ProductEntity>>(HttpStatus.BAD_REQUEST);
		}
	}

}
