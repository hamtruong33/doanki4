package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product , Integer>{
	
	@Query("select p from Product p where p.category.id =:idCate")
	public List<Product> findListProductByCategory(@Param("idCate") int idCate);
	
	@Query("select p from Product p where p.status  = true and p.quantity > 0")
	public List<Product> findAllByStatusAndQuantity();
	
	@Query("select p from Product p where p.status  = false ")
	public List<Product> findAllByStatus();
	
	@Query("select name from Product where name like %:keyword%")
	public List<String> searchautocomple(@Param("keyword") String keyword);
	
	@Query("select new com.demo.entities.ProductEntity(id,name,price) from Product where name like %:keyword%  ")
	public List<ProductEntity> search(@Param("keyword") String keyword);
}
