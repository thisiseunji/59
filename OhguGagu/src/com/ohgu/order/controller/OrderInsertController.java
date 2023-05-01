package com.ohgu.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ohgu.order.model.service.OrderService;
import com.ohgu.order.model.vo.Cart;
import com.ohgu.order.model.vo.Order;
import com.ohgu.member.model.vo.Member;

/**
 * Servlet implementation class OrderInsertController
 */
@WebServlet("/insert.od")
public class OrderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 주문정보 생성에 필요한 정보
		String orderName = request.getParameter("orderName");
		int deliveryFee =  Integer.parseInt(request.getParameter("deliveryFee"));
		int price = Integer.parseInt(request.getParameter("totalPrice")); //실제 지불가격 x, 지불가격은 다음과 같이 계산 totalPrice + deliveryFee - usedPoint
		String payNo = request.getParameter("payNo");
		int usedPoint = Integer.parseInt(request.getParameter("usedPoint"));
		Member loginUser = ((Member)request.getSession().getAttribute("loginUser"));
		int memberNo = loginUser.getMemberNo();
		int addressNo = Integer.parseInt(request.getParameter("addressNo"));
		String orderMsg = request.getParameter("orderMsg");
		
		String[] productNoValues = request.getParameterValues("productNoList");
		String[] earnedPointValues = request.getParameterValues("earnedPointList");
		int earnedPoint = 0;
	
		ArrayList<Integer> productNoList = new ArrayList<>();
		
		// 장바구니 삭제용
	    ArrayList<Cart> cartList = new ArrayList<>();
		
		for(int i =0;i<productNoValues.length; i++) {
			productNoList.add(Integer.parseInt(productNoValues[i]));
			earnedPoint += Integer.parseInt(earnedPointValues[i]);
			cartList.add(new Cart(Integer.parseInt(productNoValues[i]), memberNo));
		}

	    Order order = new Order(orderName, deliveryFee, price, payNo, usedPoint, earnedPoint, orderMsg, memberNo, addressNo);
	    
	    int result = new OrderService().insertOrder(order, productNoList, cartList);
	    
	    HttpSession session = request.getSession();
	    
	    // 결제에 대한 확인이 필요하지만 생략
	    if(result > 0) {
	    	request.getSession().setAttribute("alertMsg", "주문 성공");
	    	int pointBefore = loginUser.getPoint();
	    	int pointAfter = pointBefore - usedPoint + earnedPoint;
	    	loginUser.setPoint(pointAfter);
	    	session.setAttribute("loginUser", loginUser);
	    	response.sendRedirect(request.getContextPath());
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
