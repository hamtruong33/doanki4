package com.demo.entities;

public class BestSeller {
	private int productid;
	private long sum;
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public long getSum() {
		return sum;
	}
	public void setSum(long sum) {
		this.sum = sum;
	}
	public BestSeller(int productid, long sum) {
		super();
		this.productid = productid;
		this.sum = sum;
	}
	public BestSeller() {
		super();
	}
	
}
