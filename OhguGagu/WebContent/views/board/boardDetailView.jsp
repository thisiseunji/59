<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ohgu.board.model.vo.Board" %>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 100%;
        height: auto;
		min-height: 100%;
    }
	.left{
		width: 200px;
	}
	.footer{
		height: 100%;
		position: relative;
	}
	.dox{
		display: grid;
		grid-template-columns: 200px auto;
		margin: 0;
	}
	.detailView{
		width: 1000px;
		margin-left: 80px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
    <div class="outer">
        <div class="header">
			<%@ include file="../common/menubar.jsp" %>
		</div>

        <div class="dox">
            <div class="left">
				<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
			<div class="detailView">
				<h2>1:1 문의</h2>
				<div style="display: flex; margin: 20px">
					<h1 style="width: 80%;"><%= b.getBoardTitle() %></h1>
					<div style="width: 18;">작성일 : <%= b.getCreatedAt() %></div>
				</div>
				<hr style="margin-top: 0">
				<div style="height: 200px; margin: 20px; display: flex;">
					<div>
						<img src="<%=b.getProductName() %>" style="width: 150px; height: 150px;">
						<div align="center" style="margin-top: 20px;"><%=b.getMemberName() %></div>
					</div>
					<div><p style="margin-left: 50px;"><%= b.getBoardContent() %></p></div>
				</div>
				<%if(b.getAnswer() != null){ %>
				<div style="height: 400px; padding: 20px; border-top: 1px solid lightgray;">
					<p><%=b.getAnswer()%></p>
				</div>
				<%} %>
				<div align="center">
					<a href="<%=contextPath%>/list.bo?currentPage=1&memberNo=<%=loginUser.getMemberNo()%>" class="btn btn-outline-danger">목록으로</a>
					<a href="<%=contextPath%>/delete.bo?bno=<%=b.getBoardNo() %>&memberNo=<%=loginUser.getMemberNo() %>" class="btn btn-outline-danger">삭제하기</a>
				</div>
			</div>
        </div>
    </div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>