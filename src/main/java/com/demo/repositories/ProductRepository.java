package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.BestSeller;
import com.demo.entities.Product;
import com.demo.entities.ProductEntity;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {

	@Query("select p from Product p where p.category.id =:idCate")
	public List<Product> findListProductByCategory(@Param("idCate") int idCate);

	@Query("select p from Product p where p.status  = true and p.quantity > 0 and p.shop.status = true")
	public List<Product> findAllByStatusAndQuantity();

	@Query("select p from Product p where p.status  = false order by dateCreated desc")
	public List<Product> findAllByStatus();

	@Query("select name from Product where name like %:keyword%")
	public List<String> searchautocomple(@Param("keyword") String keyword);

	@Query("select new com.demo.entities.ProductEntity(id,name,price) from Product where name like %:keyword%  ")
	public List<ProductEntity> search(@Param("keyword") String keyword);

	@Query("select p from Product p where p.name like %:keyword%  ")
	public List<Product> searchProduct(@Param("keyword") String keyword);

	@Query("select new com.demo.entities.BestSeller(o.product.id,sum(o.quantity)) from Orderdetail o group by o.product.id order by sum(o.quantity) desc")
	public List<BestSeller> bestseller();

	// find product new
	@Query(value = "select * from Product where status = true order by id desc limit :n", nativeQuery = true)
	public List<Product> listNewProduct(@Param("n") int n);

	@Query("select p from Product p where p.shop.id = :shopId")
	public List<Product> findByShopId(@Param("shopId") int shopId);
}
