package com.ohgu.order.model.dao;

import static com.ohgu.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ohgu.order.model.vo.Cart;
import com.ohgu.order.model.vo.CartReturn;

public class CartDao {
	
	private Properties prop = new Properties();
	
	public CartDao() {
		String filename = CartDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertCart(Connection conn, Cart cart){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getMemberNo());
			pstmt.setInt(3, cart.getProductNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	// 넘어온 카트를 삭제
	public int deleteCart(Connection conn, Cart cart) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cart.getMemberNo());
			pstmt.setInt(2, cart.getProductNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int updateCart(Connection conn, Cart cart) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 수량이 현재 수량에 누적되도록
			pstmt.setInt(1, cart.getMemberNo());
			pstmt.setInt(2, cart.getProductNo());
			pstmt.setInt(3, cart.getAmount());
			pstmt.setInt(4, cart.getMemberNo());
			pstmt.setInt(5, cart.getProductNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int setAmountCart(Connection conn, Cart cart) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("setAmountCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 수량 누적없이 변경되도돍
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getMemberNo());
			pstmt.setInt(3, cart.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	

	public ArrayList<CartReturn> selectCart(Connection conn, int memberNo) {
		
		ArrayList<CartReturn> cartList = new ArrayList<>();
		
		PreparedStatement pstmt1 = null;		
		ResultSet rset1 = null;
		
		PreparedStatement pstmt2 = null;		
		ResultSet rset2 = null;
		
		String sql1 = prop.getProperty("selectCart");
		String sql2 = prop.getProperty("selectMemberGrade");
		
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, memberNo);
			
			rset1 = pstmt1.executeQuery();
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, memberNo);
			
			// 리턴값이 1개
			rset2 = pstmt2.executeQuery();
			int pointRate = 0;
			if(rset2.next()) {
				pointRate = rset2.getInt("POINT_RATE");
			}
			
			while(rset1.next()) {
				CartReturn cartReturn = new CartReturn();
				cartReturn.setCartNo(rset1.getInt("CART_NO"));
				cartReturn.setProductNo(rset1.getInt("PRODUCT_NO"));
				cartReturn.setFileName(rset1.getString("FILE_NAME"));
				cartReturn.setProductName(rset1.getString("PRODUCT_NAME"));
				cartReturn.setpColor(rset1.getString("P_COLOR"));
				cartReturn.setAmount(rset1.getInt("AMOUNT"));
				cartReturn.setPrice(rset1.getInt("PRICE"));
				cartReturn.setDiscountRate(rset1.getInt("DISCOUNT_RATE"));
				cartReturn.setPointRate(pointRate);

				cartList.add(cartReturn);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset2);
			close(pstmt2);
			close(rset1);
			close(pstmt1);
		}

		return cartList;
	}



}
