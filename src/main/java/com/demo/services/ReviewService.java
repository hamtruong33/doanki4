package com.demo.services;

import java.util.List;


import com.demo.entities.Review;

public interface ReviewService {
	public Review save(Review review);
	public List<Review> findallByIdProduct(int productid);
	public List<Review> findallByIdUser( int userid);
}
