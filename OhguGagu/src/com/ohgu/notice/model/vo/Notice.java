package com.ohgu.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;			//	NOTICE_NO	NUMBER
	private String noticeTitle;		//	NOTICE_TITLE	VARCHAR2(50 BYTE)
	private String noticeContent;	//	NOTICE_CONTENT	VARCHAR2(500 BYTE)
	private Date createDate;			//	CREATED_AT	DATE
	private String status;			//	STATUS	CHAR(1 BYTE)
	
	
	public Notice() {}


	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.status = status;
	}
	

	public Notice(int noticeNo, String noticeTitle, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date creatDate) {
		this.createDate = creatDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	

}
