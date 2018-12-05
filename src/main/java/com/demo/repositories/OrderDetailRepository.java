package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.BestSeller;
import com.demo.entities.Orderdetail;
import com.demo.entities.OrderdetailId;
import com.demo.entities.Product;

@Repository("orderDetailRepository")
public interface OrderDetailRepository extends CrudRepository<Orderdetail, Integer> {
	
	@Query("select o from Orderdetail o where o.product.shop.id = :idshop ")
	public List<Orderdetail> findByShop(@Param("idshop") int idshop);
	
	@Query("select new com.demo.entities.BestSeller(o.product.id,sum(o.quantity)) from Orderdetail o group by o.product.id order by sum(o.quantity) desc")
	public List<BestSeller> bestseller();
	
	@Query("select o from Orderdetail o where o.orders.user.id = :iduser ")
	public List<Orderdetail> findByUser(@Param("iduser") int iduser);
}
