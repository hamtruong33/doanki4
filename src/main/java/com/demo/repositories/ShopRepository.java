package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.demo.entities.Shop;
import com.demo.entities.User;

@Repository("shopRepository")
public interface ShopRepository extends CrudRepository<Shop, Integer> {
	
	@Query("select s from Shop s where s.username = :username ")
	public Shop findByUsername(@Param("username") String username);
}
