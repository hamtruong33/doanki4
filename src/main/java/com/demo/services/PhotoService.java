package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.entities.Photo;

public interface PhotoService {
	public List<Photo> findAll();
	public Photo save(Photo photo);
	public void delete(Photo photo);
	public List<Photo> findAllByProductId(@Param ("productId") int productId);
	
	public void deleteById(int id);
}
