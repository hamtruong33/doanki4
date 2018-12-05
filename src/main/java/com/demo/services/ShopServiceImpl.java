package com.demo.services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.views.CreateShopDomain;
import com.demo.entities.Shop;
import com.demo.helper.BCrypt;
import com.demo.repositories.ShopRepository;

@Service("shopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopRepository shopRepository;
	
	@Autowired
	private MembershipService membershipService;
	
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

	@Override
	public void delete(int id) {
		shopRepository.deleteById(id);

	}

	@Override
	public Shop findByShopId(int id) {
		return shopRepository.findByShopId(id);
	}

	@Override
	public void mapCreateModel(CreateShopDomain domain, Shop shop) {
		Calendar c1 = Calendar.getInstance();
		c1.setTime(new Date());
		c1.add(Calendar.DATE, 10);

		shop.setName(domain.getName());
		shop.setEmail(domain.getEmail());
		shop.setPassword(BCrypt.hashpw(domain.getPassword(), BCrypt.gensalt(12)));
		shop.setAddress(domain.getAddress());
		shop.setDescription(domain.getDescription());
		shop.setMembership(membershipService.findByMemberShipId(4));
		shop.setDateCreated(new Date());
		shop.setDateEnd(c1.getTime());
		shop.setBankNumber(domain.getBankNumber());
		shop.setIdentityCard(domain.getIdentityCard());
		shop.setVote(domain.getVote());
		//shop.setStatus(domain.isStatus());

	}

	@Override
	public Shop findByEmail(String email) {
		return shopRepository.findByEmail(email);
	}

	@Override
	public Shop findByToken(String token) {
		// TODO Auto-generated method stub
		return shopRepository.findByToken(token);
	}

	// @Override
	// public UserDetails loadUserByUsername(String username) throws
	// UsernameNotFoundException {
	// Shop shop = shopRepository.findByUsername(username);
	// if(shop==null) {
	// throw new UsernameNotFoundException("Username not found for "+username);
	// }
	//// List<GrantedAuthority> grantedAuthorities = new
	// ArrayList<GrantedAuthority>();
	//// for(Roleforuser role : shop.getRoleforusers()) {
	//// grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
	//// }
	// return new ShopUserdetail(shop);
	// }

}
