package com.demo.validators;



import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.User;


//@Controller
//@Component
public class UserValidator implements Validator {
//	@Autowired
//	private UserService userService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(User.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//User user = (User) target;
//		System.out.println(user.getUsername());
//		userService.findAll();
//		if(userService.findByUsername(user.getUsername())==null) {
//			System.out.println("AAAA");
//		}else {
//			System.out.println("BBBB");
//		}
//		System.out.println(userService.findByUsername("user1"));
//		if(userService.findByUsername(user.getUsername())!= null) {
//			User user1 = userService.findByUsername(user.getUsername());
//			if(user.getUsername().equals(user1.getUsername())) {
//				errors.rejectValue("username", "user.username.exists");
//			}
//		}
		
		
		
	}
	
	
}
