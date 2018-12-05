package com.demo.services;

import java.util.List;

import com.demo.entities.Category;
import com.demo.entities.Product;
import com.demo.entities.Roleforuser;

public interface RoleService {
	public List<Roleforuser> findAll();
	public Roleforuser findById(int id);
	
	public Roleforuser save(Roleforuser roleforuser);
}
