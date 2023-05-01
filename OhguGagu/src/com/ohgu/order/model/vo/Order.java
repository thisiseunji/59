package com.ohgu.order.model.vo;

import java.sql.Date;

public class Order {
    private int orderNo;
    private String orderName;
    private int deliveryFee = 5000;
    private String orderMsg;
    private Date orderedAt;
    private int price;
    private String payNo;
    private String waybillNo;
    private String status = "결제완료";
    private int usedPoint;
    private int earnedPoint;
    private int memberNo;
    private int addressNo;
    
    public Order() {}
    
    public Order(String orderName, int deliveryFee, int price, String payNo, int usedPoint, int earnedPoint, String orderMsg, int memberNo, int addressNo) {
		super();
		this.orderName = orderName;
		this.deliveryFee = deliveryFee;
		this.price = price;
		this.payNo = payNo;
		this.usedPoint = usedPoint;
		this.earnedPoint = earnedPoint;
		this.orderMsg = orderMsg;
		this.memberNo = memberNo;
		this.addressNo = addressNo;
	}


	public Order(int orderNo, String orderName, int deliveryFee, String orderMsg, Date orderedAt, int price,
			String payNo, String waybillNo, String status, int usedPoint, int earnedPoint, int memberNo,
			int addressNo) {
		super();
		this.orderNo = orderNo;
		this.orderName = orderName;
		this.deliveryFee = deliveryFee;
		this.orderMsg = orderMsg;
		this.orderedAt = orderedAt;
		this.price = price;
		this.payNo = payNo;
		this.waybillNo = waybillNo;
		this.status = status;
		this.usedPoint = usedPoint;
		this.earnedPoint = earnedPoint;
		this.memberNo = memberNo;
		this.addressNo = addressNo;
	}



	public int getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public String getOrderName() {
		return orderName;
	}



	public void setOrderName(String orderName) {
		this.orderName = orderName;
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



	public int getUsedPoint() {
		return usedPoint;
	}



	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}



	public int getEarnedPoint() {
		return earnedPoint;
	}



	public void setEarnedPoint(int earnedPoint) {
		this.earnedPoint = earnedPoint;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getAddressNo() {
		return addressNo;
	}



	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}



	@Override
    public String toString() {
        return "Order [orderNo=" + orderNo + ", orderName=" + orderName + ", deliveryFee=" + deliveryFee
                + ", orderMsg=" + orderMsg + ", orderedAt=" + orderedAt + ", price=" + price + ", payNo=" + payNo
                + ", waybillNo=" + waybillNo + ", status=" + status + ", usedPoint=" + usedPoint + ", earnedPoint="
                + earnedPoint + ", memberNo=" + memberNo + ", addressNo=" + addressNo + "]";

	}
}
