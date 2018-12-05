package com.demo.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.entities.Roleforuser;
import com.demo.entities.User;
import com.demo.repositories.UserRepository;

@Service("userServices")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public User save(User user) {
		return userRepository.save(user);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		if(user==null) {
			throw new UsernameNotFoundException("Username not found for "+username);
		}
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		for(Roleforuser role : user.getRoleforusers()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		return  new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),grantedAuthorities);
	}

	@Override
	public List<User> findAll() {
		return (List<User>) userRepository.findAll();
	}

	@Override
	public User findByToken(String token) {
		return userRepository.findByToken(token);
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void delete(int id) {
		userRepository.deleteById(id);
		
	}

	@Override
	public User findByUserId(int id) {
		return userRepository.findByUserId(id);
	}

	

	
}
