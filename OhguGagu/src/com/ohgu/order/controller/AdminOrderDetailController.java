package com.ohgu.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ohgu.order.model.service.OrderService;
import com.ohgu.order.model.vo.Address;
import com.ohgu.order.model.vo.Order;
import com.ohgu.product.model.service.ProductService;
import com.ohgu.product.model.vo.Product;

/**
 * Servlet implementation class AdminOrderDetailController
 */
@WebServlet("/adminDetail.od")
public class AdminOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oNo = request.getQueryString();
		oNo = oNo.substring(6, oNo.length());
		
		int orderNo = Integer.parseInt(oNo);
		
		Order order = new OrderService().selectOrderByOrderNo(orderNo);
		
		ArrayList<Product> productList = new ProductService().selectProductByOrderNo(orderNo);
		
		Address address = new OrderService().selectAddressByOrderNo(orderNo);
		
		request.setAttribute("order", order);
		request.setAttribute("productList", productList);
		request.setAttribute("address", address); 
		
		request.getRequestDispatcher("views/order/adminOrderDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
