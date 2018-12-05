package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.repositories.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	//
	//find all
	@Override
	public Iterable<Product> findAll() {
		
		return  productRepository.findAll();
	}

	//
	//find by id
	@Override
	public Product findById(int id) {
		
		return productRepository.findById(id).get();
	}

	
	//
	//find list product by id category
	@Override
	public List<Product> findListProductByCategory(int idCate) {
		
		return productRepository.findListProductByCategory(idCate);
	}

//	@Override
//	public List<String> search(String keyword) {
//		return productRepository.search(keyword);
//	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	

	@Override
	public List<ProductEntity> search(String keyword) {
		return productRepository.search(keyword);
	}

	@Override
	public List<Product> findAllByStatusAndQuantity() {
		return productRepository.findAllByStatusAndQuantity();
	}

	@Override
	public void delete(int  id) {
		productRepository.deleteById(id);
		
	}

	@Override
	public List<String> searchautocomple(String keyword) {
		return productRepository.searchautocomple(keyword);
	}

	@Override
	public List<Product> findAllByStatus() {
		return productRepository.findAllByStatus();
	}
	
	
}
