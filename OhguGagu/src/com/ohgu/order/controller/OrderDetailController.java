package com.ohgu.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ohgu.product.model.vo.Product;
import com.ohgu.order.model.service.OrderService;
import com.ohgu.order.model.vo.Address;
import com.ohgu.order.model.vo.Order;
import com.ohgu.product.model.service.ProductService;

/**
 * Servlet implementation class OrderDetailController
 */
@WebServlet("/detail.od")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oNo = request.getQueryString();
		oNo = oNo.substring(6, oNo.length());
		
		// 넘겨야 하는 정보가, 주문, 상품리스트, 주문 배송지 총 3개 필요하다. 해당 주문과, productList 주문한 상품들?에 대한 데이터 전체?, 주문 배송지! 3개 테이블의 정보 필요
		
		int orderNo = Integer.parseInt(oNo);
		
		Order order = new OrderService().selectOrderByOrderNo(orderNo);
		
		ArrayList<Product> productList = new ProductService().selectProductByOrderNo(orderNo);
		
		Address address = new OrderService().selectAddressByOrderNo(orderNo);
		
		request.setAttribute("order", order);
		request.setAttribute("productList", productList);
		request.setAttribute("address", address); 
		
		System.out.println("o : " + order);
		System.out.println("pl : " + productList);
		System.out.println("a : " + address);
		
		System.out.println();
		
		request.getRequestDispatcher("views/order/orderDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
