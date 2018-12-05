package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Category;

@Repository("categoryRepository")
public interface CategoryRepository extends CrudRepository<Category, Integer> {
	
	@Query("select c from Category c where c.id = :id ")
	public Category findByCategoryId(@Param("id") int id);
}
