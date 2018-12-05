package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.domain.views.CreateShopDomain;
import com.demo.entities.Shop;

public interface ShopService {

	public List<Shop> findAll();

	public Shop save(Shop shop);

	public Shop findByUsername(String username);

	public void delete(int id);

	public Shop findByShopId(int id);

	public void mapCreateModel(CreateShopDomain domain, Shop shop);

	public Shop findByEmail(String email);
	
	public Shop findByToken(String token);
}
