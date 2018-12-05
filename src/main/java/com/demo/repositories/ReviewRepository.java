package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Review;

@Repository("reviewRepository")
public interface ReviewRepository extends CrudRepository<Review, Integer> {
	
	@Query("select r from Review r where r.product.id =:productid")
	public List<Review> findallByIdProduct(@Param("productid") int productid);
	
	@Query("select r from Review r where r.user.id =:userid order by r.dateCreated desc")
	public List<Review> findallByIdUser(@Param("userid") int userid);
}
