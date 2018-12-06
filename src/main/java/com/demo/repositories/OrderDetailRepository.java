package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.BestSeller;
import com.demo.entities.Orderdetail;


@Repository("orderDetailRepository")
public interface OrderDetailRepository extends CrudRepository<Orderdetail, Integer> {
	
	@Query("select o from Orderdetail o where o.product.shop.id = :idshop ")
	public List<Orderdetail> findByShop(@Param("idshop") int idshop);
	
	@Query(value="select o from Orderdetail o where o.product.shop.id = :idshop order by o.orders.dateCreated desc  ")
	public List<Orderdetail> findByShopNew(@Param("idshop") int idshop);
	
	@Query("select new com.demo.entities.BestSeller(o.product.id,sum(o.quantity)) from Orderdetail o group by o.product.id order by sum(o.quantity) desc")
	public List<BestSeller> bestseller();
	
	@Query("select o from Orderdetail o where o.orders.user.id = :iduser ")
	public List<Orderdetail> findByUser(@Param("iduser") int iduser);

	@Query("select o from Orderdetail o where o.status = :status and o.product.shop.id = :idshop  ")
	public List<Orderdetail> findByStatusAndShop(@Param("status") String status,@Param("idshop") int idshop);
	
	@Query("select o from Orderdetail  o where o.product.id = :productId and o.orders.id = :ordersid ")
    public Orderdetail findByProductIdAndOrderID(@Param("productId") int productId,@Param("ordersid") int ordersid);
}
