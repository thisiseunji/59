package com.ohgu.common.model.vo;

public class Product {
	
	private int productNo;	//	PRODUCT_NO	NUMBER
	private String category;	//	CATEGORY	VARCHAR2(50 BYTE)
	private String productName;	//	PRODUCT_NAME	VARCHAR2(50 BYTE)
	private int price;	//	PRICE	NUMBER
	private int stock;	//	STOCK	NUMBER
	private String pColor;	//	P_COLOR	VARCHAR2(20 BYTE)
	private String pSize;	//	P_SIZE	VARCHAR2(20 BYTE)
	private String pMaterial;	//	P_MATERIAL	VARCHAR2(20 BYTE)
	private String pDetail;	//	P_DETAIL	VARCHAR2(500 BYTE)
	private int discountRate;	//	DISCOUNT_RATE	NUMBER
	
	public Product() {}
	
	public Product(int productNo, String category, String productName, int price, int stock, String pColor,
			String pSize, String pMaterial, String pDetail, int discountRate) {
		super();
		this.productNo = productNo;
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.pColor = pColor;
		this.pSize = pSize;
		this.pMaterial = pMaterial;
		this.pDetail = pDetail;
		this.discountRate = discountRate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getpColor() {
		return pColor;
	}

	public void setpColor(String pColor) {
		this.pColor = pColor;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String getpMaterial() {
		return pMaterial;
	}

	public void setpMaterial(String pMaterial) {
		this.pMaterial = pMaterial;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", category=" + category + ", productName=" + productName
				+ ", price=" + price + ", stock=" + stock + ", pColor=" + pColor + ", pSize=" + pSize + ", pMaterial="
				+ pMaterial + ", pDetail=" + pDetail + ", discountRate=" + discountRate + "]";
	}

}
