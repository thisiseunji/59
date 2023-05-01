package com.ohgu.order.model.vo;

public class Cart {
	private int cartNo;
	private int productNo;
	private int memberNo;
	private int amount;
	
	public Cart() {}
	
	public Cart(int productNo, int memberNo) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
	}
	
	public Cart(int productNo, int memberNo, int amount) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.amount = amount;
	}

	public Cart(int cartNo, int productNo, int memberNo, int amount) {
		super();
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.amount = amount;
	}
	

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", productNo=" + productNo + ", memberNo=" + memberNo + ", amount=" + amount
				+ "]";
	}
	
}
