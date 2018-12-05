package com.demo.domain.views;

import java.util.Date;

public class CreateShopDomain {

    private int membershipId;
    private String name;
    private String description;
    private Double vote;
    private String email;
    private String password;
    private Date dateEnd;
    private String address;
    private Date dateCreate;
    private int identityCard;
    private int bankNumber;
    private boolean status;

    public int getMembershipId() {
        return membershipId;
    }

    public void setMembershipId(int membershipId) {
        this.membershipId = membershipId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getVote() {
        return vote;
    }

    public void setVote(Double vote) {
        this.vote = vote;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public int getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(int identityCard) {
        this.identityCard = identityCard;
    }

    public int getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(int bankNumber) {
        this.bankNumber = bankNumber;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
