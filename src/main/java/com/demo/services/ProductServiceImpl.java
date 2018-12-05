package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.views.CreateProductDomain;
import com.demo.entities.BestSeller;
import com.demo.entities.Product;
import com.demo.entities.ProductEntity;
import com.demo.repositories.CategoryRepository;
import com.demo.repositories.ProducerRepository;
import com.demo.repositories.ProductRepository;
import com.demo.repositories.ShopRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProducerRepository producerRepository;

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
    private ShopRepository shopRepository;

	//
	// find all
	@Override
	public Iterable<Product> findAll() {

		return productRepository.findAll();
	}

	//
	// find by id
	@Override
	public Product findById(int id) {

		return productRepository.findById(id).get();
	}

	//
	// find list product by id category
	@Override
	public List<Product> findListProductByCategory(int idCate) {

		return productRepository.findListProductByCategory(idCate);
	}

	// @Override
	// public List<String> search(String keyword) {
	// return productRepository.search(keyword);
	// }

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
	public void delete(int id) {
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

	@Override
	public List<BestSeller> bestseller() {
		return productRepository.bestseller();
	}

	@Override
	public List<Product> listNewProduct(int n) {
		return productRepository.listNewProduct(n);
	}

	@Override
	public List<Product> searchProduct(String keyword) {
		return productRepository.searchProduct(keyword);
	}

	@Override
	public List<Product> findByShopId(int shopId) {
		return productRepository.findByShopId(shopId);
	}

	@Override
	public void mapCreateModel(CreateProductDomain domain, Product product) {
		product.setName(domain.getName());
		product.setPrice(domain.getPrice());
		// product.setShop(shopRepository.findById(3).orElse(null));
		product.setProducer(producerRepository.findById(domain.getProducerId()).orElse(null));
		product.setCategory(categoryRepository.findById(domain.getCategoryId()).orElse(null));
		product.setDescription(domain.getDescription());
		//product.setStatus(domain.isStatus());
		product.setDiscount(domain.getDiscount());
		product.setQuantity(domain.getQuantity());

	}

}
