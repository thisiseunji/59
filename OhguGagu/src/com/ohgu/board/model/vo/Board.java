package com.ohgu.board.model.vo;

import java.sql.Date;

public class Board {
	
	public int boardNo;	//	BOARD_NO	NUMBER
	public String boardTitle;	//	BOARD_TITLE	VARCHAR2(200 BYTE)
	public String boardContent;	//	BOARD_CONTENT	VARCHAR2(2000 BYTE)
	public Date createdAt;	//	CREATED_AT	DATE
	public String answer;	//	ANSWER	VARCHAR2(1000 BYTE)
	public Date updatedAt;	//	UPDATED_AT	DATE
	public int memberNo;	//	MEMBER_NO	NUMBER
	public int orderNo;	//	ORDER_NO	NUMBER
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, Date createdAt, String answer, Date updatedAt,
			int memberNo, int orderNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createdAt = createdAt;
		this.answer = answer;
		this.updatedAt = updatedAt;
		this.memberNo = memberNo;
		this.orderNo = orderNo;
	}
	
	

	public Board(int orderNo, String boardTitle, Date createdAt) {
		super();
		this.orderNo = orderNo;
		this.boardTitle = boardTitle;
		this.createdAt = createdAt;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createdAt=" + createdAt + ", answer=" + answer + ", updatedAt=" + updatedAt + ", memberNo="
				+ memberNo + ", orderNo=" + orderNo + "]";
	}

}
