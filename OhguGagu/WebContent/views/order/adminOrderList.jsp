<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.ohgu.order.model.vo.Order, com.ohgu.common.model.vo.PageInfo" %>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
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
<title>관리자 >주문 관리 </title>
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

	.toggleSwitch {
    	width: 100px;
    	height: 50px;
    	display: block;
    	position: relative;
    	border-radius: 30px;
    	background-color: #fff;
    	box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
    	cursor: pointer;
    	margin: 30px;
	}
	
	.list-a {
	    color: gray;
	    text-decoration: underline;
	    font-size: 0.7em;
	}
	#select_status {
		float:right;
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
					<h1>전체 주문 목록</h1>
				</div>
				<div id=select_status>
					<select name="orderStatus" class="select">
						<option value="전체" selected>전체</option>
					    <option value="결제완료">결제완료</option>
					    <option value="배송중">배송중</option>
					    <option value="배송완료">배송완료</option>
					    <option value="구매확정">구매확정</option>
					    <option value="환불요청">환불요청</option>
					</select>
				</div>
				
				<div>

					<table id="boardTable">
						<thead>
							<tr>
								<td>주문번호</td>
								<td>주문고객</td>
								<td>주문명</td>
								<td>총 금액</td>
								<td>주문날짜</td>
								<td>운송장</td>
								<td>주문상태</td>
							</tr>
						</thead>
						<tbody>
							<% if (list.isEmpty()) { %>
							<tr>
								<td colspan="8">주문내역이 존재하지 않습니다.</td>
							</tr>
							<%} %>
							<% for(Order o : list){ %>
							
								<% int namelen = o.getOrderName().length();
								String orderName = o.getOrderName().substring(namelen-6, namelen);%>
							<tr> <!-- 관리자용 디테일 페이지 주소로 바꿔줘야함 -->
								<td><%=o.getOrderNo()%></td>
								<td><%=o.getMemberNo()%></td>
								<td><%=orderName%></td>
								<td><%=o.getPrice()%></td>
								<td><%=o.getOrderedAt()%></td>
								<td><%=o.getWaybillNo()%></td>
								<td> <!-- status 결과에 따라 option select 하는 로직 필요 -->
									<%=o.getStatus() %>
								</td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>

				<div align="center" class="paging-bar">
					<% for (int i = startPage; i <= endPage; i++){ %>
						<%if(i != currentPage){ %>
							<button onclick="location.href='<%=contextPath%>/list.od?currentPage=<%=i%>';"><%= i %></button>
						<%}else{ %>
							<button disabled><%=i %></button>
						<%} %>
					<% } %>
            	</div>

			</div>
		</div>      
    </div>
    <div class="footer" style="width: 100%;">
    	<%@ include file="../common/footer.jsp" %>
    </div>

	<script>
		// 상세페이지로 이동
		$("table>tbody>tr").click(function(){
			let orderNo = $(this).children().eq(0).text();
			location.href = "<%=contextPath%>/adminDetail.od?order=" + orderNo;
		});
	</script>

</body>
</html>