package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Shop;
import com.demo.repositories.ShopRepository;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopRepository shopRepository;

	@Override
	public List<Shop> findAll() {
		return (List<Shop>) shopRepository.findAll();
	}

	@Override
	public Shop save(Shop shop) {
		return shopRepository.save(shop);
	}

	@Override
	public Shop findByUsername(String username) {
		return shopRepository.findByUsername(username);
	}

//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		Shop shop = shopRepository.findByUsername(username);
//		if(shop==null) {
//			throw new UsernameNotFoundException("Username not found for "+username);
//		}
////		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
////		for(Roleforuser role : shop.getRoleforusers()) {
////			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
////		}
//		return new ShopUserdetail(shop);
//	}

	

	
	
	

}
