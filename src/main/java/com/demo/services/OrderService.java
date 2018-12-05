package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.Orders;

public interface OrderService {

	public Orders save(Orders orders);

	public List<Orders> findAll();

	public Orders create(Orders orders);

	public List<Orders> findbyuser(int iduser);

	public Orders findById(int id);
	
	public List<Orders> findAllorderby();

}
