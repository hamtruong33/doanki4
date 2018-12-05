package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Roleforuser;
import com.demo.repositories.RoleRepository;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public List<Roleforuser> findAll() {
		return (List<Roleforuser>) roleRepository.findAll();
	}

	@Override
	public Roleforuser findById(int id) {
		return roleRepository.findById(id).get();
	}

	@Override
	public Roleforuser save(Roleforuser roleforuser) {
		return roleRepository.save(roleforuser);
	}

	
	
	
	

}
