package com.ohgu.order.model.service;


import static com.ohgu.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ohgu.board.model.dao.BoardDao;
import com.ohgu.board.model.vo.Board;
import com.ohgu.common.JDBCTemplate;
import com.ohgu.common.model.vo.PageInfo;
import com.ohgu.order.model.dao.OrderDao;
import com.ohgu.order.model.vo.Order;
import com.ohgu.order.model.vo.Address;
import com.ohgu.order.model.vo.Cart;

public class OrderService {

	public ArrayList<Address> selectAddress(int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Address> addrList = new OrderDao().selectAddress(conn, memberNo);
		
		close(conn);
		
		return addrList;
	}

	public int insertOrder(Order order, ArrayList<Integer> productNoList, ArrayList<Cart> cartList) {
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn, order, productNoList, cartList);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> getOrderList(int memberNo, String startDate, String endDate) {
		Connection conn = getConnection();
		
		ArrayList<Order> orderList = new OrderDao().selectOrder(conn, memberNo, startDate, endDate);
		
		close(conn);
		
		return orderList;
	}
	
	public Order selectOrderByOrderNo(int orderNo) {
		Connection conn = getConnection();
		
		Order order = new OrderDao().selectOrderByOrderNo(conn, orderNo);
		
		close(conn);
		
		return order;
	}

	public Address selectAddressByOrderNo(int orderNo) {
		Connection conn = getConnection();
		
		Address address = new OrderDao().selectAddressByOrderNo(conn, orderNo);
		
		close(conn);
		
		return address;
		
	}

	public int orderUpdateRefund(int orderNo) {
		Connection conn = getConnection();
		
		int result = new OrderDao().orderUpdateRefund(conn, orderNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int adminSelectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new OrderDao().adminSelectListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Order> adminSelectOrderList(PageInfo pi){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Order> list = new OrderDao().adminSelectOrderList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int orderUpdate(int orderNo, String status, String wayBillNo) {
		Connection conn = getConnection();
		
		int result = new OrderDao().orderUpdate(conn, orderNo, status, wayBillNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
