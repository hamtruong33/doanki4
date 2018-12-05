package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Photo;
import com.demo.repositories.PhotoRepository;



@Service("photoService")
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	private PhotoRepository photoRepository;

	@Override
	public List<Photo> findAll() {
		return (List<Photo>) photoRepository.findAll();
	}

	@Override
	public Photo save(Photo photo) {
		return photoRepository.save(photo);
	}

	@Override
	public void delete(Photo photo) {
		photoRepository.delete(photo);
		
	}

	@Override
	public List<Photo> findAllByProductId(int productId) {
		return photoRepository.findAllByProductId(productId);
	}

	@Override
	public void deleteById(int id) {
		 photoRepository.deleteById(id);
		
	}

	
	
	

}
