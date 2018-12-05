package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Orders;
import com.demo.entities.User;

@Repository("orderRepository")
public interface OrderRepository extends CrudRepository<Orders, Integer>{
	
	@Query("select o from Orders o where o.user.id =:iduser")
	public List<Orders> findbyuser(@Param("iduser")int iduser);
}
