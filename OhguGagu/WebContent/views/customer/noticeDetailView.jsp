<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ohgu.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>고객센터>공지사항</title>
<Style>
	.outer{
		position: relative;
		height : 1800px;
	}
	footer{
		z-index: 1;
	}
	header{
		z-index: 2;
	}
	.mainview {
		position: relative; 
		height : 60%;
	}
	
	.mainview>div {
		float : left;
		height : 100%;
	}
	
	div[class="side"]{position: absolute;}
	
	.qbox {
		padding-left: 200px;
		height: 100%;
		width: 100%;
	}
	.detailView{
		width: 1000px;
		height: 100%;
		margin-left: 40px;
		margin-top: 50px;
	}
	.detailView h2{
		margin-bottom: 50px;
	}
</Style>
</head>
<body>
	<div class="outer">
		<header>
			<%@ include file="../common/menubar.jsp" %>
		</header>
		<div class="mainview">
			<div>
				<%@ include file="../common/customerSidebar.jsp" %>
			</div>
			<div class="qbox">
				<div class="detailView">
					<h2>Notice</h2>
					<div style="display: flex; margin: 20px">
						<h1 style="width: 70%;"><%= n.getNoticeTitle() %></h1>
						<div style="width: 15%;">작성자 : 관리자 </div>
						<div style="width: 15%;">작성일 : <%= n.getCreateDate() %></div>
					</div>
					<hr style="margin-top: 0">
					<div style="height: 800px; margin: 20px">
						<p><%= n.getNoticeContent() %></p>
					</div>
					<div align="center">
						<a href="<%=contextPath%>/list.no?currentPage=1" class="btn btn-outline-danger">목록으로</a>
						<% if (loginUser != null && loginUser.getMemberId().equals("admin")){ %>
						<a href="<%=contextPath%>/updateForm.no?nno=<%=n.getNoticeNo() %>" class="btn btn-outline-danger">수정하기</a>
						<a href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo() %>" class="btn btn-outline-danger">삭제하기</a>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>
</body>
</html>