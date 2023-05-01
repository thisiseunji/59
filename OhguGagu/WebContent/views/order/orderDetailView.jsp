<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ohgu.product.model.vo.Product"%>
<%@ page import="com.ohgu.order.model.vo.Order"%>
<%@ page import="com.ohgu.order.model.vo.Address"%>
<%@ page import="java.util.ArrayList"%>
<%
	// 해당 주문과, productList 주문한 상품들?에 대한 데이터 전체?, 주문 배송지! 3개 테이블의 정보 필요
	Order o = (Order)request.getAttribute("order");
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
	Address a = (Address)request.getAttribute("address");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 > 주문 상세 </title>
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
		width: 700px;
		margin-left: 80px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	#boardTable div{
		width: 100%;
		height: 100%;
		border: 1px solid #ccc;
	}
	table {
		text-align : center;
	}
	td {
		border : 1px solid black;
	}
	input[name='refund'] {
		display : inline-block;
		margin-left : 700px;
		width : 200pxs
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
				<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
			<div>
				<div style="margin-left: 80px; margin-top: 30px;">
					<h1>주문 상세</h1>
				</div>
				<div id="tableArea">
					<% if(o.getStatus().equals("환불요청")) { %>
						<input name="refund" type="button" value="요청완료" disabled>
					<% } else {%>
						<input name="refund" type="button" value="환불요청">
					<% } %>
				 	
					<table name="overallTable" id="boardTable">
                        <tr>
                            <td>주문번호</td>
                            <td><%= o.getOrderNo() %></td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>주문자명</td>
                            <td><%= loginUser.getMemberName()%></td>
                            <td>주문일</td>
                            <td><%=o.getOrderedAt()%></td>
                            <td>주문상태</td>
                            <td><%=o.getStatus()%></td>
                            <td>운송장</td>
                            <td><%=o.getWaybillNo()%></td>
                        </tr>
                        <tr>
                            <td>수령인</td>
                            <td><%= a.getReceiver() %></td>
                            <td>연락처</td>
                            <td><%= a.getPhone() %></td>
                            <td colspan="3">주소</td>
                            <td><%= a.getAddr() %> &nbsp; <%= a.getAddrDetail() %></td>
                        </tr>
					</table>
					
					
                    <table name="detailTable"  id="boardTable">
                        <thead>
                            <tr>
                                <td>상품명</td>
                                <td>가격</td>
                                <td>color</td>
                                <td>size</td>
                                <td>material</td>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Product p : productList){ %>
                            <tr>
                                <td><%= p.getProductName() %></td>
                                <td><%= p.getPrice() %></td>
                                <td><%= p.getpColor() %></td>
                                <td><%= p.getpSize() %></td>
                                <td><%= p.getpMaterial() %></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    
                    <table name="orderPaymentTable" id="boardTable">
                        <tr>
                            <td>총액</td>
                            <td><%= o.getPrice() + o.getDeliveryFee() - o.getUsedPoint() %></td> <!-- 주문에서 가져올 수 있음 -->
                            <td>배송비</td>
                            <td><%= o.getDeliveryFee() %></td> <!-- 주문에서 가져올 수 있음 -->
                            <td>사용 포인트</td>
                            <td><%= o.getUsedPoint() %></td> <!-- 주문에서 가져올 수 있음 -->
                            <td>적립 포인트</td>
                            <td><%= o.getEarnedPoint() %></td> <!-- 주문에서 가져올 수 있음 -->
                        </tr>
                    </table>
                    
				</div>
			</div>	
		</div>      
    </div>
    <div class="footer" style="width: 100%;">
    	<%@ include file="../common/footer.jsp" %>
    </div>

	<script>
		// 환불요청 버튼 클릭시 주문 상태 업데이트
		$(document).ready(function() {
			$(document).on("click", "input[name='refund']", function() {
				orderUpdate(<%= o.getOrderNo() %>);
			});
			
		});
		
		// 환불요청 성공시, 버튼 비활성화
		function orderUpdate(orderNo) {
			 $.ajax({
	             url : "refund.od",
	             type : "post",
	             data : {
	            	 orderNo : orderNo
	             },
	             success : function(orderNo) {
	                 if(result > 0) { // 환불요청 성공
	                	 $("input[name='refund']").attr("disabled", true);
	                	 $("input[name='refund']").val("완료");
	                 } else { 
	                     alert("환불 요청 실패");
	                 }
	             },
	             error : function() {
	                 console.log("환불 ajax 통신 실패");
	             }
			 });
		}
	</script>

</body>
</html>