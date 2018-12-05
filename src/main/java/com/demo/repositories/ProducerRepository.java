package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Category;
import com.demo.entities.Producer;

@Repository("producerRepository")
public interface ProducerRepository extends CrudRepository<Producer, Integer> {

}
