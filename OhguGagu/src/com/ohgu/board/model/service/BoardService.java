package com.ohgu.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ohgu.board.model.dao.BoardDao;
import com.ohgu.board.model.vo.Board;
import com.ohgu.common.JDBCTemplate;
import com.ohgu.common.model.vo.PageInfo;
import com.ohgu.notice.model.dao.NoticeDao;
import com.ohgu.notice.model.vo.Notice;

public class BoardService {
	
	public int insertBoard(Board b) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	public int selectListCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().selectListCount(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public ArrayList<Board> selectBoardList(PageInfo pi, int memberNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi, memberNo);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

}
