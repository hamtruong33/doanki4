package com.demo.services;

import java.util.List;

import com.demo.entities.Category;

public interface CategoryService {
	public List<Category> findAll();

	public Category save(Category category);

	public Category findByCategoryId(int id);

	public void delete(int id);
}
