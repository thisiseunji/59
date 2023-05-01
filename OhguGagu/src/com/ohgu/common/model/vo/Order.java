package com.ohgu.common.model.vo;

import java.sql.Date;

public class Order {
	
	private int orderNo;	//	ORDER_NO	NUMBER
	private int deliveryFee;	//	DELIVERY_FEE	NUMBER
	private String orderMsg;	//	ORDER_MSG	VARCHAR2(50 BYTE)
	private String phone;	//	PHONE	CHAR(11 BYTE)
	private Date orderedAt;	//	ORDERED_AT	DATE
	private int price;	//	PRICE	NUMBER
	private String payNo;	//	PAY_NO	VARCHAR2(200 BYTE)
	private String waybillNo;	//	WAYBILL_NO	VARCHAR2(200 BYTE)
	private String status;	//	STATUS	VARCHAR2(30 BYTE)
	private int memberNO;	//	MEMBER_NO	NUMBER
	private int addressNo;	//	ADDRESS_NO	NUMBER
	private String productName;
	private String fileName;
	
	
	public Order () {}

	public Order(int orderNo, int deliveryFee, String orderMsg, String phone, Date orderedAt, int price, String payNo,
			String waybillNo, String status, int memberNO, int addressNo) {
		super();
		this.orderNo = orderNo;
		this.deliveryFee = deliveryFee;
		this.orderMsg = orderMsg;
		this.phone = phone;
		this.orderedAt = orderedAt;
		this.price = price;
		this.payNo = payNo;
		this.waybillNo = waybillNo;
		this.status = status;
		this.memberNO = memberNO;
		this.addressNo = addressNo;
	}

	public Order(String productName, int orderNo, Date orderedAt, String fileName) {
		super();
		this.productName = productName;
		this.orderNo = orderNo;
		this.orderedAt = orderedAt;
		this.fileName = fileName;
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

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public String getOrderMsg() {
		return orderMsg;
	}

	public void setOrderMsg(String orderMsg) {
		this.orderMsg = orderMsg;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getOrderedAt() {
		return orderedAt;
	}

	public void setOrderedAt(Date orderedAt) {
		this.orderedAt = orderedAt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getWaybillNo() {
		return waybillNo;
	}

	public void setWaybillNo(String waybillNo) {
		this.waybillNo = waybillNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNO() {
		return memberNO;
	}

	public void setMemberNO(int memberNO) {
		this.memberNO = memberNO;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", deliveryFee=" + deliveryFee + ", orderMsg=" + orderMsg + ", phone="
				+ phone + ", orderedAt=" + orderedAt + ", price=" + price + ", payNo=" + payNo + ", waybillNo="
				+ waybillNo + ", status=" + status + ", memberNO=" + memberNO + ", addressNo=" + addressNo
				+ ", productName=" + productName + ", fileName=" + fileName + "]";
	}

}
