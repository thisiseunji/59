package com.ohgu.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo;			//	MEMBER_NO	NUMBER
	private String memberId;		//	MEMBER_ID	VARCHAR2(200 BYTE)
	private String memberPwd;		//	MEMBER_PWD	VARCHAR2(30 BYTE)
	private String memberName;		//	MEMBER_NAME	VARCHAR2(20 BYTE)
	private String email;			//	EMAIL	VARCHAR2(20 BYTE)
	private String gender;			//	GENDER	CHAR(1 BYTE)
	private String phone;			//	PHONE	CHAR(11 BYTE)
	private String bDate;				//	BIRTH_DATE	DATE
	private int point;				//	POINT	NUMBER
	private Date cDate;				//	CREATED_AT	DATE
	private String status;			//	IS_DELETED	CHAR(1 BYTE)
	private int totalPay;			//	TOTAL_PAYMENT	NUMBER
	private String socialForm;		//	SOCIAL_PLATFORM	VARCHAR2(20 BYTE)
	
	public Member() {}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String email, String gender,
			String phone, String bDate, int point, Date cDate, String status, int totalPay, String socialForm) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.bDate = bDate;
		this.point = point;
		this.cDate = cDate;
		this.status = status;
		this.totalPay = totalPay;
		this.socialForm = socialForm;
	}

	public Member(String memberId, String memberPwd, String memberName, String email, String phone, String gender,
			String bDate) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.bDate = bDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}

	public String getSocialForm() {
		return socialForm;
	}

	public void setSocialForm(String socialForm) {
		this.socialForm = socialForm;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", email="
				+ email + ", gender=" + gender + ", phone=" + phone + ", bDate=" + bDate + ", point=" + point
				+ ", cDate=" + cDate + ", status=" + status + ", totalPay=" + totalPay + ", socialForm=" + socialForm
				+ "]";
	}

}
