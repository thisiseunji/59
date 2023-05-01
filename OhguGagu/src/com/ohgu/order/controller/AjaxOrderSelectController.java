package com.ohgu.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ohgu.member.model.vo.Member;
import com.ohgu.order.model.service.CartService;
import com.ohgu.order.model.service.OrderService;
import com.ohgu.order.model.vo.CartReturn;
import com.ohgu.order.model.vo.Order;

/**
 * Servlet implementation class AjaxOrderSelectController
 */
@WebServlet("/alist.od")
public class AjaxOrderSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxOrderSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 로그인 유저 정보로 주문내역 조회*/
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Order> orderList = null;
		
		if (loginUser == null) {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
		} else {
			int memberNo = loginUser.getMemberNo();
			
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			System.out.println("1 " + startDate);
			System.out.println("2 " + endDate);
			orderList = new OrderService().getOrderList(memberNo, startDate, endDate);
		}

		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(orderList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
