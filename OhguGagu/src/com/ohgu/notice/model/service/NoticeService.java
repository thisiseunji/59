package com.ohgu.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ohgu.common.JDBCTemplate;
import com.ohgu.common.model.vo.PageInfo;
import com.ohgu.notice.model.dao.NoticeDao;
import com.ohgu.notice.model.vo.Notice;

public class NoticeService {
	
	// 공시사항 list 불러오기 
	public ArrayList selectNoticeList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	// 공지사항 상세조회
	public Notice selectNotice(int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		JDBCTemplate.close(conn);
		
		return n;
	}
	
	// 공지사항 총 게시물
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	// 공지사항 등록
	public int insertNotice(Notice n) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	// 공지사항 수정
	public int updateNotice(Notice n) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	// 공지사항 삭제 
	public int deleteNotice(int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
