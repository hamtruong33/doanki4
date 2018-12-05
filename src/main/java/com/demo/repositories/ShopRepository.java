package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.demo.entities.Shop;

@Repository("shopRepository")
public interface ShopRepository extends CrudRepository<Shop, Integer> {
	
	@Query("select s from Shop s where s.username = :username ")
	public Shop findByUsername(@Param("username") String username);
	
	@Query("select s from Shop s where s.id = :id ")
	public Shop findByShopId(@Param("id") int id);
	
	@Query("select e from Shop e where e.email = :email")
    public Shop findByEmail(@Param("email") String email);
	
	@Query("select s from Shop s where s.token = :token")
	public Shop findByToken(@Param("token") String token);
	
}
