package com.ohgu.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ohgu.member.model.service.MemberService;
import com.ohgu.member.model.vo.Member;
import com.ohgu.member.model.vo.MemberGrade;
import com.ohgu.order.model.service.OrderService;

/**
 * Servlet implementation class MemberGradeSelectController
 */
@WebServlet("/agrade.me")
public class MemberGradeSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGradeSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 사용자 정보로 등급을 가져온다.*/
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");

		MemberGrade memberGrade = null;

		if (loginUser == null) {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
		} else {
			int totalPay = loginUser.getTotalPay();
			
			memberGrade = new MemberService().getMemberGrade(totalPay);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(memberGrade, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
