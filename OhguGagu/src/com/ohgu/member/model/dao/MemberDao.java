package com.ohgu.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.ohgu.common.JDBCTemplate;
import com.ohgu.member.model.vo.Member;
import com.ohgu.member.model.vo.MemberGrade;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/xml/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 로그인 기능 
	public Member loginMember(Connection conn, Member m) {
		
		Member loginUser = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("MEMBER_NO")
									 , rset.getString("MEMBER_ID")
									 , rset.getString("MEMBER_PWD")
									 , rset.getString("MEMBER_NAME")
									 , rset.getString("EMAIL")
									 , rset.getString("GENDER")
									 , rset.getString("PHONE")
									 , rset.getString("BIRTH_DATE")
									 , rset.getInt("POINT")
									 , rset.getDate("CREATED_AT")
									 , rset.getString("IS_DELETED")
									 , rset.getInt("TOTAL_PAYMENT")
									 , rset.getString("SOCIAL_PLATFORM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return loginUser;
	}
	
	// 회원가입
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getbDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	// 회원탈퇴
	public int deleteMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// order.jsp에서 사용함
	public MemberGrade getMemberGrade(Connection conn, int totalPay) {
		
		MemberGrade memberGrade = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMemberGrade");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, totalPay);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(true);
				memberGrade = new MemberGrade(rset.getString("GRADE_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return memberGrade;
	}

}
