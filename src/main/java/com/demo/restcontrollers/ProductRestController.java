package com.demo.restcontrollers;

import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Item;
import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.services.ProductService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.MimeTypeUtils;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("api/restproduct")
public class ProductRestController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "search/{keyword}", method = RequestMethod.GET, produces = {
			MimeTypeUtils.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ProductEntity>> search(@PathVariable("keyword") String keyword) {
		try {
			return new ResponseEntity<List<ProductEntity>>(productService.search(keyword), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<ProductEntity>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public ResponseEntity<Void> buy(@PathVariable("id") int id, HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		try {
			if (httpSession.getAttribute("cart") == null) {
				List<Item> cart = new ArrayList<Item>();
				cart.add(new Item(productService.findById(id), 1));
				httpSession.setAttribute("cart", cart);
			} else {
				List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
				int index = exists(id, cart);
				if (index == -1) {
					cart.add(new Item(productService.findById(id), 1));
				} else {
					int quantity = cart.get(index).getQuantity() + 1;
					cart.get(index).setQuantity(quantity);
				}
			}
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}

	// check trung
	private int exists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

}
