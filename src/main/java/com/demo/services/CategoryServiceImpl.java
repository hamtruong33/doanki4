package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Category;
import com.demo.repositories.CategoryRepository;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<Category> findAll() {
		
		return (List<Category>) categoryRepository.findAll();
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void delete(int id) {
		categoryRepository.deleteById(id);
		
	}

	@Override
	public Category findByCategoryId(int id) {
		return categoryRepository.findByCategoryId(id);
	}

	
	
	

}
