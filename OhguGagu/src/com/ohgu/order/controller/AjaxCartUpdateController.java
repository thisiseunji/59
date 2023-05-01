package com.ohgu.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ohgu.member.model.vo.Member;
import com.ohgu.order.model.service.CartService;
import com.ohgu.order.model.vo.Cart;

/**
 * Servlet implementation class AjaxCartUpdateController
 */
@WebServlet("/update.cart")
public class AjaxCartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCartUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 상품 상세 페이지에서 -> 상품 no, memberId 가져오기 */
		int result = 0;
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if (loginUser == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
			
		} else {
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			Cart cart = new Cart(productNo, loginUser.getMemberNo(), Integer.parseInt(request.getParameter("amount")));
			result = new CartService().updateCart(cart);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
