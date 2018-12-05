package com.demo.paypal;

public class PayPalConfig {

	private String authToken;
	private String posturl;
	private String business;
	private String returnurl;
	private String returnurl1;
	
	

	public String getReturnurl1() {
		return returnurl1;
	}

	public void setReturnurl1(String returnurl1) {
		this.returnurl1 = returnurl1;
	}

	public String getAuthToken() {
		return authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public String getPosturl() {
		return posturl;
	}

	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getReturnurl() {
		return returnurl;
	}

	public void setReturnurl(String returnurl) {
		this.returnurl = returnurl;
	}

}
