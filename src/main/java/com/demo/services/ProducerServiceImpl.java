package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Category;
import com.demo.entities.Producer;
import com.demo.repositories.CategoryRepository;
import com.demo.repositories.ProducerRepository;

@Service("producerService")
public class ProducerServiceImpl implements ProducerService {
	
	@Autowired
	private ProducerRepository producerRepository;

	@Override
	public List<Producer> findAll() {
		return (List<Producer>) producerRepository.findAll();
	}

	

	
	
	

}
