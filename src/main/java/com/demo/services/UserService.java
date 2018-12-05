package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.User;

//@Component
public interface UserService extends UserDetailsService {

	public User findByUsername(String username);

	public User save(User user);

	public List<User> findAll();

	public User findByToken(String token);

	public User findByEmail(String email);
	
	public void delete(int id);
	
	public User findByUserId( int id);
	
	
}
