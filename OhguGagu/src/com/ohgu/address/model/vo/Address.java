package com.ohgu.address.model.vo;

public class Address {

	private int addressNo;					//	ADDRESS_NO	NUMBER
	private String addr;					//	ADDR	VARCHAR2(200 BYTE)
	private String addrDetail;				//	ADDR_DETAIL	VARCHAR2(100 BYTE)
	private String phone;					//	PHONE	CHAR(11 BYTE)
	private String receiver;				//	RECEIVER	VARCHAR2(1000 BYTE)
	private int memberNo;					//	MEMBER_NO	NUMBER
	
	public Address() { }

	public Address(int addressNo, String addr, String addrDetail, String phone, String receiver, int memberNo) {
		super();
		this.addressNo = addressNo;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.phone = phone;
		this.receiver = receiver;
		this.memberNo = memberNo;
	}
	
	// 리스트 조회용 생성자
	public Address(int addressNo, String addr, String addrDetail) {
		super();
		this.addressNo = addressNo;
		this.addr = addr;
		this.addrDetail = addrDetail;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", addr=" + addr + ", addrDetail=" + addrDetail + ", phone=" + phone
				+ ", receiver=" + receiver + ", memberNo=" + memberNo + "]";
	}
	
}
