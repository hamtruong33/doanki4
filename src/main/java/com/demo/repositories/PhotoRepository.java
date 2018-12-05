package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Photo;

@Repository("photoRepository")
public interface PhotoRepository extends CrudRepository<Photo, Integer> {
	
	@Query("select ph from Photo ph where ph.product.id = :productId")
	public List<Photo> findAllByProductId(@Param ("productId") int productId);
}
