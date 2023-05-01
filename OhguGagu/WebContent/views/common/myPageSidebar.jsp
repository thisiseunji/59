<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ohgu.member.model.vo.Member" %>
<%
	Member login_User = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div[class=side]{
    	width: 200px;
	    height: 100%;
	    background: white;
		border-right: 1px solid lightgray;
    }
   	.side>div{
    	margin-left: 20px;
    	margin-top: 10px;
   	}
    .side>div>div{
    	font-size: 25px;
    	margin-bottom: 20px;
	}
    .side>div>a{
    	color: black;
    	text-decoration: none;
    	margin: 20px;
    }
	.side>div>a:hover{
		color: red;
	}
</style>
</head>
<body>
    <div class="side">
	    <div>
		    <div><b>쇼핑정보</b></div>
		    <a href="<%=request.getContextPath()%>/list.od">주문목록/배송조회</a><br><br>
		    <a href="<%=request.getContextPath()%>/list.cart">장바구니</a><br><br>
			<a href="">찜리스트</a><br>
	    </div>
	    <div>
		    <div><b>고객센터</b></div>
		    <a href="<%=request.getContextPath()%>/list.bo?currentPage=1&memberNo=<%=login_User.getMemberNo()%>">1:1 문의</a><br><br>
	    </div>
	    <div>
		    <div><b>회원정보</b></div>
		    <a href="">회원정보 변경</a><br><br>
		    <a href="<%=request.getContextPath() %>/deleteForm.me">회원탈퇴</a><br><br>
			<a href="">배송지 관리</a><br>
	    </div>
	    <div>
		    <div><b>나의 활동 정보</b></div>
		    <a href="">나의 상품 리뷰</a>
	    </div>
    </div>
</body>
</html>