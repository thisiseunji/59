package com.ohgu.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ohgu.common.JDBCTemplate;
import com.ohgu.common.model.dao.OrderDao;
import com.ohgu.common.model.vo.Order;

public class OrderService {
	
	// 특정회원의 주문번호 조회 
	public ArrayList<Order> orderNoSearch(int memberNo){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Order> list = new OrderDao().orderNoSearch(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//
	public int selectListCount(int memberNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().selectListCount(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
