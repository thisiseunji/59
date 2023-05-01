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
		    <div><b>회원 관리</b></div>
		    <a href="">회원 전체조회</a><br><br>
	    </div>
	    <div>
		    <div><b>상품 관리</b></div>
		    <a href="">상품 전체조회</a><br><br>
		    <a href="">상품 추가</a><br><br>
	    </div>
	    <div>
		    <div><b>주문 관리</b></div>
		    <a href="<%=request.getContextPath()%>/adminList.od?currentPage=1">주문 전체조회</a><br><br>
	    </div>
	    <div>
		    <div><b>1:1 문의 관리</b></div>
		    <a href="<%=request.getContextPath()%>/adminList.bo?currentPage=1">문의글 전체조회</a><br><br>
	    </div>
    </div>
</body>
</html>