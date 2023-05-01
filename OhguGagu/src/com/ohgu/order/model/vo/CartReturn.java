package com.ohgu.order.model.vo;

public class CartReturn {
	private int cartNo;
	private int productNo;
	private String fileName;
	private String productName;
	private String pColor;
	private int amount;
	private int price;
	private int discountRate; // %단위로 저장 20% 할인 => 20
	private int pointRate; // %단위로 저장 2% 적립 => 2
	
	public CartReturn() {}
	
	public CartReturn(int cartNo, int productNo, String fileName, String productName, String pColor, int amount, int price,
			int discountRate, int pointRate) {
		super();
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.fileName = fileName;
		this.productName = productName;
		this.pColor = pColor;
		this.amount = amount;
		this.price = price;
		this.discountRate = discountRate;
		this.pointRate = pointRate;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getpColor() {
		return pColor;
	}
	public void setpColor(String pColor) {
		this.pColor = pColor;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	
	public int getPointRate() {
		return pointRate;
	}

	public void setPointRate(int pointRate) {
		this.pointRate = pointRate;
	}

	@Override
	public String toString() {
		return "CartReturn [cartNo=" + cartNo + ", productNo=" + productNo + ", fileName=" + fileName + ", productName="
				+ productName + ", pColor=" + pColor + ", amount=" + amount + ", price=" + price + ", discountRate="
				+ discountRate + ", pointRate=" + pointRate + "]";
	}

}
