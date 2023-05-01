package com.ohgu.order.model.dao;

import static com.ohgu.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.ohgu.common.model.vo.PageInfo;
import com.ohgu.member.model.dao.MemberDao;
import com.ohgu.order.model.vo.Address;
import com.ohgu.order.model.vo.Cart;
import com.ohgu.order.model.vo.Order;

public class OrderDao {
	private Properties prop = new Properties();
	
	public OrderDao() {
		
		String filename = OrderDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Address> selectAddress(Connection conn, int memberNo) {
		ArrayList<Address> addrList = new ArrayList<>();
		
		PreparedStatement pstmt = null;		
		ResultSet rset = null;

		String sql = prop.getProperty("selectAddress");

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Address addr = new Address(
					rset.getInt("ADDRESS_NO"),
					rset.getString("ADDR"),
					rset.getString("ADDR_DETAIL"),
					rset.getString("PHONE"),
					rset.getString("RECEIVER"),
					rset.getInt("MEMBER_NO"));

				addrList.add(addr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return addrList;

	}
	
	/*
	 * 1. 주문 생성
	 * 2. 주문-상품 중간테이블 생성
	 * 3. 장바구니 삭제
	 * 4. 회원정보 업데이트 - 총 구매액, 포인트
	 * */
	public int insertOrder(Connection conn, Order order, ArrayList<Integer> productNoList, ArrayList<Cart> cartList) {
		int result = 1;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		
		String sql1 = prop.getProperty("insertOrder");
		String sql2 = prop.getProperty("insertOrderProduct");

		Properties prop1 = new Properties();
		Properties prop2 = new Properties();
		
		try {
			prop1.loadFromXML(new FileInputStream(CartDao.class.getResource("/sql/order/order-mapper.xml").getPath()));
			prop2.loadFromXML(new FileInputStream(MemberDao.class.getResource("/sql/xml/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String sql3 = prop1.getProperty("deleteCart");
		String sql4 = prop2.getProperty("updateMemberAfterOrder");
		
		try {
			// 1. 주문생성
			pstmt1 = conn.prepareStatement(sql1);
		    pstmt1.setString(1, order.getOrderName());
		    pstmt1.setInt(2, order.getDeliveryFee());
		    pstmt1.setString(3, order.getOrderMsg());
		    pstmt1.setInt(4, order.getPrice());
		    pstmt1.setString(5, order.getPayNo());
		    pstmt1.setInt(6, order.getUsedPoint());
		    pstmt1.setInt(7, order.getEarnedPoint());
		    pstmt1.setInt(8, order.getMemberNo());
		    pstmt1.setInt(9, order.getAddressNo());
		    result *= pstmt1.executeUpdate();
		    
		    // 2. 중간테이블 생성
		    pstmt2 = conn.prepareStatement(sql2);
		    
		    for(int i=0; i < productNoList.size(); i++) {
		    	pstmt2.setInt(1, productNoList.get(i));
		    	result *= pstmt2.executeUpdate();
		    }
		    
		    // 3. 카트 삭제
		    pstmt3 = conn.prepareStatement(sql3);
		    for(Cart cart : cartList) {
		    	System.out.println(cart);
		    	pstmt3.setInt(1, cart.getMemberNo());
		    	pstmt3.setInt(2, cart.getProductNo());
		    	
	    	    result *= pstmt3.executeUpdate();
		    }
		    
		   // 4. 회원정보 업데이트
		    pstmt4 = conn.prepareStatement(sql4);
		    int totalPrice = order.getPrice() + order.getDeliveryFee() - order.getUsedPoint();
		    
		    pstmt4.setInt(1, totalPrice);
		    pstmt4.setInt(2, order.getUsedPoint());
		    pstmt4.setInt(3, order.getEarnedPoint());
		    pstmt4.setInt(4, order.getMemberNo());
		    
		    result *= pstmt4.executeUpdate();
		    
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt4);
			close(pstmt3);
			close(pstmt2);
			close(pstmt1);
		}

		return result;
	}

	// 주문 목록
	public ArrayList<Order> selectOrder(Connection conn, int memberNo, String startDate, String endDate) {
		ArrayList<Order> orderList = new ArrayList<>();
		
		PreparedStatement pstmt = null;		
		ResultSet rset = null;
		String sqlName = "";
		if(endDate.equals("")) {
			sqlName = "selectOrder";
		} else {
			sqlName = "selectOrderByOrderedAt";
		}
		
		String sql = prop.getProperty(sqlName);
			
		try {
			pstmt = conn.prepareStatement(sql);
			//여기가 다르겠네 if문 필요
			pstmt.setInt(1, memberNo);
			
			// 2023-04-24 이런형식으로 온다. 제대로 조회가 안되네...?
			if (sqlName.equals("selectOrderByOrderedAt")) {
				
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				java.util.Date sDate = format.parse(startDate);
				java.util.Date eDate = format.parse(endDate);
				java.sql.Date sqlsDate = new java.sql.Date(sDate.getTime());
				java.sql.Date sqleDate = new java.sql.Date(eDate.getTime());
				
				pstmt.setDate(2, sqlsDate);
				pstmt.setDate(3, sqleDate);
				
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order order = new Order(
					rset.getInt("ORDER_NO"),
					rset.getString("ORDER_NAME"),
					rset.getInt("DELIVERY_FEE"),
					rset.getString("ORDER_MSG"),
					rset.getDate("ORDERED_AT"),
					rset.getInt("PRICE"),
					rset.getString("PAY_NO"),
					rset.getString("WAYBILL_NO"),
					rset.getString("STATUS"),
					rset.getInt("USED_POINT"),
					rset.getInt("EARNED_POINT"),
					rset.getInt("MEMBER_NO"),
					rset.getInt("ADDRESS_NO"));
				orderList.add(order);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return orderList;
	}

	public Order selectOrderByOrderNo(Connection conn, int orderNo) {
		Order order = null;
		
		PreparedStatement pstmt = null;		
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderByOrderNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				order = new Order(
						rset.getInt("ORDER_NO"),
						rset.getString("ORDER_NAME"),
						rset.getInt("DELIVERY_FEE"),
						rset.getString("ORDER_MSG"),
						rset.getDate("ORDERED_AT"),
						rset.getInt("PRICE"),
						rset.getString("PAY_NO"),
						rset.getString("WAYBILL_NO"),
						rset.getString("STATUS"),
						rset.getInt("USED_POINT"),
						rset.getInt("EARNED_POINT"),
						rset.getInt("MEMBER_NO"),
						rset.getInt("ADDRESS_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return order;
	}

	public Address selectAddressByOrderNo(Connection conn, int orderNo) {
		Address address = null;
		
		PreparedStatement pstmt = null;		
		ResultSet rset = null;
		String sql = prop.getProperty("selectAddressByOrderNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				address = new Address(
					rset.getInt("ADDRESS_NO"),
					rset.getString("ADDR"),
					rset.getString("ADDR_DETAIL"),
					rset.getString("PHONE"),
					rset.getString("RECEIVER"),
					rset.getInt("MEMBER_NO"));
			}
			System.out.println("dao"+ address);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return address;
	}

	public int orderUpdateRefund(Connection conn, int orderNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderUpdateRefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int adminSelectListCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Order> adminSelectOrderList(Connection conn, PageInfo pi) {
		
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectOrderList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Order(
							rset.getInt("ORDER_NO"),
							rset.getString("ORDER_NAME"),
							rset.getInt("DELIVERY_FEE"),
							rset.getString("ORDER_MSG"),
							rset.getDate("ORDERED_AT"),
							rset.getInt("PRICE"),
							rset.getString("PAY_NO"),
							rset.getString("WAYBILL_NO"),
							rset.getString("STATUS"),
							rset.getInt("USED_POINT"),
							rset.getInt("EARNED_POINT"),
							rset.getInt("MEMBER_NO"),
							rset.getInt("ADDRESS_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public int orderUpdate(Connection conn, int orderNo, String status, String wayBillNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, wayBillNo);
			pstmt.setInt(3, orderNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}
