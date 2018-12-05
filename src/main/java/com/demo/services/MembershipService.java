package com.demo.services;

import com.demo.entities.Membership;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface MembershipService {

    public Iterable<Membership> findAll();

    public Membership findByMemberShipId(int id);

}
