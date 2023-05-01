<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.ohgu.notice.model.vo.Notice, com.ohgu.common.model.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>고객센터>공지사항</title>
<Style>
	.outer{
		position: relative;
		height : 1500px;
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
		width: 100%;
	}
	.noticeList{
		width: 1000px;
		margin-left: 80px;
		margin-top: 50px;
	}
	.noticeList table{
		width: 100%;
		height: 100%;
		text-align: center;
	}
	thead{
		background-color: #f2f2f2;
		height: 70px;
	}
	table tr {
		height: 50px;
		border-bottom: 1px solid #ccc;
	}
	table>tbody>tr:hover{
		background-color: #f2f2f2;
		cursor: pointer;
	}
	.paging-bar{
		width: 1000px;
		margin-left: 80px;
		margin-top: 30px;
	}
	.paging-bar button{
		border: 1px solid #ccc;
		background-color: #fff;
		padding: 5px 10px;
		margin: 0 5px;
		border-radius: 10px;
	}
	.paging-bar button:hover{
		background-color: #f2f2f2;
		cursor: pointer;
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
				<div class="noticeList">
					<h3  style="margin-left: 40px;"><b>공지사항</b></h3>
					<div align="right">
						<%if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
						<a href="<%= contextPath %>/enrollForm.no" class="btn btn-danger btn-sm">글쓰기</a>
						<%} %>
					</div>
					<hr style="margin-bottom: 0;">
					<div>
						<table>
							<thead>
								<tr>
									<td width="70">글번호</td>
									<td>제목</td>
									<td width="100">작성자</td>
									<td width="100">작성일</td>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="4">게시글이 존재하지 않습니다.</td>
									</tr>
								<%}else{ %>
									<% for(Notice n : list){ %>
										<tr>
											<td><%= n.getNoticeNo() %></td>
											<td><%= n.getNoticeTitle() %></td>
											<td>관리자</td>
											<td><%= n.getCreateDate() %></td>
										</tr>
									<%} %>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 페이징 바 -->
				
				<div align="center" class="paging-bar">
					<% for (int i = startPage; i <= endPage; i++){ %>
						<%if(i != currentPage){ %>
							<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=i%>';"><%= i %></button>
						<%}else{ %>
							<button disabled><%=i %></button>
						<%} %>
					<% } %>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>

	<script>
		$("table>tbody>tr").click(function(){
			let nno = $(this).children().eq(0).text();
			location.href = "<%=contextPath%>/detail.no?nno=" + nno;
		});
	</script>

</body>
</html>