package com.ohgu.address.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ohgu.address.model.vo.Address;
import com.ohgu.common.JDBCTemplate;

public class AddressDao {
	
	// 공통 코드
	private Properties prop = new Properties();
	
	public AddressDao() {
		
		String fileName = AddressDao.class.getResource("/sql/member/address-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 배송지 리스트 조회용 서비스
	public ArrayList<Address> selectAddressList(Connection conn) {
		
		ArrayList<Address> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddressList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Address(rset.getInt("ADDRESS_NO")
								   , rset.getString("ADDR")
								   , rset.getString("ADDR_DETAIL")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
}
