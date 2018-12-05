package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.User;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Integer> {

	@Query("select u from User u where u.username = :username ")
	public User findByUsername(@Param("username") String username);
	
	@Query("select u from User u where u.id = :id ")
	public User findByUserId(@Param("id") int id);
	
	

	@Query("select u from User u where u.token like :token")
	public User findByToken(@Param("token") String token);

	@Query("select u from User u where u.email like :email")
	public User findByEmail(@Param("email") String email);
}
