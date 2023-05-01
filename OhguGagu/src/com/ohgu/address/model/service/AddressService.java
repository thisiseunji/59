package com.ohgu.address.model.service;

import static com.ohgu.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ohgu.address.model.dao.AddressDao;
import com.ohgu.address.model.vo.Address;

public class AddressService {
	
	// 배송지 리스트 조회용 서비스
	public ArrayList<Address> selectAddressList() {
		
		Connection conn = getConnection();
		
		ArrayList<Address> list = new AddressDao().selectAddressList(conn);
		
		close(conn);
		
		return list;
	}

	
	
}
