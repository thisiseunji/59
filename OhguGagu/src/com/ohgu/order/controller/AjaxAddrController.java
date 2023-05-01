package com.ohgu.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ohgu.order.model.service.OrderService;
import com.google.gson.Gson;
import com.ohgu.member.model.vo.Member;
import com.ohgu.order.model.vo.Address;

/**
 * Servlet implementation class AjaxAddrController
 */
@WebServlet("/alist.addr")
public class AjaxAddrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddrController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
		} else {
			ArrayList<Address> addrList = new OrderService().selectAddress(loginUser.getMemberNo());
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(addrList, response.getWriter());
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
