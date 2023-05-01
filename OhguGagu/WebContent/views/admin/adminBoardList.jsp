<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.ohgu.board.model.vo.Board, com.ohgu.common.model.vo.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<title>관리자 페이지>문의글</title>
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
	.box{
		display: grid;
		grid-template-columns: 200px auto;
		margin: 0;
	}
	#boardTable{
		width: 1000px;
		margin-left: 80px;
		margin-top: 50px;
	}
	#boardTable>thead{
		background-color: #f2f2f2;
		height: 70px;
		text-align: center;
	}
	#boardTable>tbody{
		text-align: center;
	}
	#boardTable tr {
		height: 50px;
		border-bottom: 1px solid #ccc;
	}
	#boardTable>tbody>tr:hover{
		background-color: #f2f2f2;
		cursor: pointer;
	}
	.paging-bar{
		width: 1000px;
		margin-left: 80px;
		margin-top: 30px;
		margin-bottom: 30px;
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
</style>
</head>
<body>
    <div class="outer">
        <div class="header">
			<%@ include file="../common/menubar.jsp" %>
		</div>
		<div class="box">
			<div class="left">
				<%@ include file="../common/adminPageSidebar.jsp" %>
			</div>
			<div>
				<div style="margin-left: 80px; margin-top: 30px;">
					<h1>전체 문의글</h1>
				</div>
				<div>
					<table id="boardTable">
						<thead>
							<tr>
								<td>문의번호</td>
								<td>제목</td>
								<td>작성날짜</td>
								<td>삭제여부</td>
								<td>주문번호</td>
								<td>주문자명</td>
								<td>제품명</td>
							</tr>
						</thead>
						<tbody>
							<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="7">게시글이 존재하지 않습니다.</td>
									</tr>
							<%}else{ %>
								<% for(Board b : list){ %>
								<tr>
									<td><%=b.getBoardNo()%></td>
									<td><%=b.getBoardTitle()%></td>
									<td><%=b.getCreatedAt()%></td>
									<td><%=b.getStatus()%></td>
									<td><%=b.getOrderNo()%></td>
									<td><%=b.getMemberName()%></td>
									<td><%=b.getProductName()%></td>
								</tr>
								<%}%>
							<%} %>
						</tbody>
					</table>
				</div>

				<div align="center" class="paging-bar">
					<%if(currentPage != 1){ %>
                		<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage - 1%>';">&lt;</button>
                	<%} %>
					<% for (int i = startPage; i <= endPage; i++){ %>
						<%if(i != currentPage){ %>
							<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=i%>';"><%= i %></button>
						<%}else{ %>
							<button disabled><%=i %></button>
						<%} %>
					<% } %>
					<%if(currentPage != maxPage){%>
						<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage + 1%>';">&gt;</button>
					<%} %>
            	</div>

			</div>
		</div>      
    </div>
    <div class="footer" style="width: 100%;">
    	<%@ include file="../common/footer.jsp" %>
    </div>

	<script>
		$("table>tbody>tr").click(function(){
			let bno = $(this).children().eq(0).text();
			location.href = "<%=contextPath%>/adminDetail.bo?bno=" + bno;
		});
	</script>

</body>
</html>