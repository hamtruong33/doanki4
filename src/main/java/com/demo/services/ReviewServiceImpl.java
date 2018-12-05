package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Review;
import com.demo.repositories.ReviewRepository;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	@Override
	public Review save(Review review) {
		return reviewRepository.save(review);
	}
	
	@Override
	public List<Review> findallByIdProduct(int productid) {
		return reviewRepository.findallByIdProduct(productid);
	}

	@Override
	public List<Review> findallByIdUser(int userid) {
		return reviewRepository.findallByIdUser(userid);
	}

}
