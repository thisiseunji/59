<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ohgu.order.model.vo.Order"%>
<%@ page import="com.ohgu.order.model.vo.Address"%>
<%@ page import="com.ohgu.product.model.vo.Product"%>
<%
	Order o = (Order)request.getAttribute("order");
	Address a = (Address)request.getAttribute("address");
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
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
	td {
		border : 1px solid black;
	}
	div input[type="button"] {
	  	margin-left: 735px;
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
					<h1>주문 상세</h1>
					
				</div>
				<div>
				    <input type="button" value="저장"> <!-- 상태 및 운송장 업데이트 -->
					<table name="overallTable" id="boardTable">
                        <tr>
                            <td>주문번호</td>
                            <td><%=o.getOrderNo()%></td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>주문자명</td>
                            <td><%=o.getMemberNo()%></td>
                            <td>주문일</td>
                            <td><%=o.getOrderedAt()%></td>
                            <td>주문상태</td>
                            <td> <!-- stat 결과에 따라 option select 하는 로직 필요 -->
								<select name="orderStatus" class="select">
								    <%
								    String status = o.getStatus();
								    %>
								    <option value="결제완료" <% if (status.equals("결제완료")) { %>selected="selected"<% } %>>결제완료</option>
								    <option value="배송중" <% if (status.equals("배송중")) { %>selected="selected"<% } %>>배송중</option>
								    <option value="배송완료" <% if (status.equals("배송완료")) { %>selected="selected"<% } %>>배송완료</option>
								    <option value="구매확정" <% if (status.equals("구매확정")) { %>selected="selected"<% } %>>구매확정</option>
								    <option value="환불요청" <% if (status.equals("환불요청")) { %>selected="selected"<% } %>>환불요청</option>
								</select>
                            </td>
                            <td>운송장</td>
                            <td><input name="waybillNo" value="<%=o.getWaybillNo()%>"></td>
                        </tr>
                        <tr>
                            <td>수령인</td>
                            <td><%=a.getReceiver()%></td>
                            <td>연락처</td>
                            <td><%=a.getPhone()%></td>
                            <td>주소</td>
                            <td colspan="3"><%=a.getAddr()%> &nbsp; <%=a.getAddrDetail()%></td>
                        </tr>
					</table>
					
					
                    <table name="detailTable"  id="boardTable">
                        <thead>
                            <tr>
                                <td>상품번호</td>
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
                                <td><%=p.getProductNo()%></td>
                                <td><%=p.getProductName()%></td>
                                <td><%=p.getPrice()%></td>
                                <td><%=p.getpColor()%></td>
                                <td><%=p.getpSize()%></td>
                                <td><%=p.getpMaterial()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    
                    <table name="orderPaymentTable" id="boardTable">
                        <tr>
                            <td>총액</td>
                            <td><%=o.getPrice()%></td>
                            <td>배송비</td>
                            <td><%=o.getDeliveryFee()%></td>
                            <td>사용 포인트</td>
                            <td><%=o.getUsedPoint()%></td>
                            <td>적립 포인트</td>
                            <td><%=o.getEarnedPoint()%></td>
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
		$("input[type='button']").on("click", function() {
			updateOrderDetail();
		});
	
		function updateOrderDetail() {
			$.ajax({
				url : "adminUpdate.od",
				type : "post",
				data : {
					orderNo : <%=o.getOrderNo()%>,
					status : $("select > option:selected").val(),
					waybillNo : $(".waybillNo").val()
				},
				success : function(result) {
					if(result > 0) alert('주문정보 업데이트에 성공했습니다.');
					else alert('주문정보 업데이트에 실패했습니다.');
					
				},
				error : function() {
					console.log("관리자 주문정보 업데이트 ajax 통신 실패!");
				}
			});
		}
	</script>

</body>
</html>