package com.demo.repositories;

import com.demo.entities.Shop;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Membership;

@Repository("membershipRepository")
public interface MembershipRepository extends CrudRepository<Membership, Integer> {

    @Query("select m from Membership m where m.id = :id")
    public Membership findByMemberShipId(@Param("id") int id);

}
