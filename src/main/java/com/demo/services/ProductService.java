package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;

public interface ProductService {
	//
	//find all
	public Iterable<Product> findAll();
	//
	//find by id
	public Product findById(int id);
	//
	//find list product by id category
	public List<Product> findListProductByCategory(int idCate);
	
	public List<String> searchautocomple( String keyword);
	
	public Product save(Product product);
	
	public void delete(int id);
	
	public List<ProductEntity> search( String keyword);
	
	public List<Product> findAllByStatusAndQuantity();
	
	public List<Product> findAllByStatus();
	
}
