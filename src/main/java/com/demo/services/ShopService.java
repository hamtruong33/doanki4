package com.demo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.Shop;

public interface ShopService {
	
	public List<Shop> findAll();
	public Shop save(Shop shop);
	
	public Shop findByUsername( String username);
}
