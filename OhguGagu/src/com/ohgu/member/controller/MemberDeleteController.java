package com.ohgu.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ohgu.member.model.service.MemberService;
import com.ohgu.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		String memberPwd = request.getParameter("memberPwd");

		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPwd(memberPwd);
		
		int result = new MemberService().deleteMember(m);
		System.out.println(result);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		}else {
			request.getSession().setAttribute("alertMsg", "회원탈퇴 실패");
			response.sendRedirect(request.getContextPath() + "/deleteForm.me");
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
