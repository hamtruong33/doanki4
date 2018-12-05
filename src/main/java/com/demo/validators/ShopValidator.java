package com.demo.validators;



import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Shop;


//@Controller
//@Component
public class ShopValidator implements Validator {
//	@Autowired
//	private UserService userService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Shop.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
	
	}
	
	
}
