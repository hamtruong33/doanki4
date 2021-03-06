package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.BestSeller;
import com.demo.entities.Orderdetail;
import com.demo.entities.Product;
import com.demo.repositories.OrderDetailRepository;

@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService{
	
	@Autowired
	private OrderDetailRepository detailRepository;
	
	public Orderdetail save(Orderdetail orderdetail) {
		return detailRepository.save(orderdetail);
	}

	@Override
	public List<Orderdetail> findByShop(int idshop) {
		return detailRepository.findByShop(idshop);
	}

	@Override
	public List<BestSeller> bestseller() {
		return detailRepository.bestseller();
	}

	@Override
	public List<Orderdetail> findByUser(int iduser) {
		return detailRepository.findByUser(iduser);
	}



	@Override
	public List<Orderdetail> findByShopNew(int idshop) {
		return detailRepository.findByShopNew(idshop);
	}

	@Override
	public Orderdetail findByProductIdAndOrderID(int productId, int ordersid) {
		return detailRepository.findByProductIdAndOrderID(productId, ordersid);
	}

	@Override
	public List<Orderdetail> findByStatusAndShop(String status, int idshop) {
		return detailRepository.findByStatusAndShop(status, idshop);
	}

	
	

	
}
