package com.demo.validators;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Product;
import com.demo.entities.User;
import com.demo.services.ProductService;
import com.demo.services.UserService;

//@Controller
//@Component
public class ProductValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Product.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		Product product = (Product) target;

		
		
		
	}
	
	
}
