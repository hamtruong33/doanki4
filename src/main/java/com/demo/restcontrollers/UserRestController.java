package com.demo.restcontrollers;

import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.entities.Roleforuser;
import com.demo.entities.User;
import com.demo.helper.BCrypt;
import com.demo.services.ProductService;
import com.demo.services.UserService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.MimeTypeUtils;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/user")
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET,consumes = {MimeTypeUtils.APPLICATION_JSON_VALUE}, produces = { MimeTypeUtils.APPLICATION_JSON_VALUE })
	public ResponseEntity<User> login(@RequestBody User user
			) {
		try {
			if(userService.findByUsername(user.getUsername())!=null) {
				User user2 = userService.findByUsername(user.getUsername());
				String hashedPw = user2.getPassword();
				String pw = user.getPassword();
				if (BCrypt.checkpw(pw, hashedPw)) {
					for (Roleforuser role : user2.getRoleforusers()) {
						if(role.getName().equals("ROLE_Shipper")) {
							return new ResponseEntity<User>(user2, HttpStatus.OK);
						}else {
							return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
						}
					}
					//if(user2.getRoleforusers())
				}else {
					return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
				}
				
				
			}else {
				return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
			}
			
			
			
		} catch (Exception e) {
			return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
	}

}
