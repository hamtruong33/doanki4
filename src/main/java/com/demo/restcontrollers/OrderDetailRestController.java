package com.demo.restcontrollers;

import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.entities.Roleforuser;
import com.demo.entities.User;
import com.demo.helper.BCrypt;
import com.demo.services.OrderDetailService;
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
@RequestMapping("api/orderdetail")
public class OrderDetailRestController {

	@Autowired
	OrderDetailService orderDetailService;

	@RequestMapping(value = "findByStatus", method = RequestMethod.GET, produces = {
			MimeTypeUtils.APPLICATION_JSON_VALUE })
	public ResponseEntity<User> findByStatus() {
		try {
				
			return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);

		} catch (Exception e) {
			return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
		}

	}

}
