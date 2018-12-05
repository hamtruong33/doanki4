package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Membership;
import com.demo.repositories.MembershipRepository;

import java.util.Optional;


@Service("membershipService")
public class MembershipServiceImpl implements MembershipService {

    @Autowired
    private MembershipRepository membershipRepository;

    @Override
    public Iterable<Membership> findAll() {
        // TODO Auto-generated method stub
        return membershipRepository.findAll();
    }

    @Override
    public Membership findByMemberShipId(int id) {
        return membershipRepository.findByMemberShipId(id);
    }


}
