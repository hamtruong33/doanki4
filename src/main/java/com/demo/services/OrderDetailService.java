package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.BestSeller;
import com.demo.entities.Orderdetail;
import com.demo.entities.Product;

public interface OrderDetailService {

	public Orderdetail save(Orderdetail orderdetail);

	public List<Orderdetail> findByShop(int idshop);

	public List<BestSeller> bestseller();

	public List<Orderdetail> findByUser(int iduser);

	public Orderdetail findByProductId(int productId);
	
	public List<Orderdetail> findByShopNew( int idshop);
}
