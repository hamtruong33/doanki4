package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Orders;
import com.demo.repositories.OrderRepository;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public Orders save(Orders orders) {
		return orderRepository.save(orders);
	}

	@Override
	public List<Orders> findAll() {
		return (List<Orders>) orderRepository.findAll();
	}

	@Override
	public Orders create(Orders orders) {
		return orderRepository.save(orders);
	}

	@Override
	public List<Orders> findbyuser(int iduser) {
		return orderRepository.findbyuser(iduser);
	}

	@Override
	public Orders findById(int id) {
		return orderRepository.findById(id).get();
	}

	@Override
	public List<Orders> findAllorderby() {
		return orderRepository.findAllorderby();
	}

}
