<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String phone = request.getParameter("phone");
	String address = request.getParameter("addr") + request.getParameter("addr_detail");
	String orderName = request.getParameter("orderName");
	String impName = request.getParameter("impName");
	String addressNo = request.getParameter("addressNo");
	String[] earnedPointList = request.getParameterValues("earnedPointList"); 
	String[] productNoList = request.getParameterValues("productNoList");
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice")); // 상품가격
	int deliveryFee = Integer.parseInt(request.getParameter("deliveryFee")); // 배송비
	int usedPoint = Integer.parseInt(request.getParameter("usedPoint")); // 사용한 포인트
%>

<!DOCTYPE html>
<html>
<head>

<!-- 아임포트 주문관리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<meta charset="UTF-8">
<title>카카오페이 결제하기</title>
<style>
#wrap{
		min-height: 100vh;
		position: relative;
		width: 100%;
	}

	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: relative;
		z-index: 3;
	}

	html, body{
		margin: 0;
		padding: 0;
	}

	html {
		height: 100%;
	}

	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}

	body {
		padding-top: 100px;
		position: relative;
		/* 메뉴바 침범하지 않기위함 */
		z-index:1;
	}
	
	#yellow {
		background-color: #f9e000;
		height: 1000px;
		width: 100%;
	}
</style>
</head>
<body>
    <div id="wrap">
		<header>
			<%@ include file="../common/mainSidebar.jsp" %>
			<%@ include file="../common/menubar.jsp" %>
		</header>
		<div id=yellow>
			<form id="order-insert-form" action="<%= contextPath %>/insert.od" method="post">
				<input type="hidden" name="addressNo" value="<%= addressNo %>"/>
				<input type="hidden" name="usedPoint" value="<%= usedPoint %>"/>
				<input type="hidden" name="orderName" value="<%= orderName %>"/>
				<input type="hidden" name="totalPrice" value="<%= totalPrice %>"/>
				<input type="hidden" name="deliveryFee" value="<%= deliveryFee %>"/>
				<input type="hidden" name="orderMsg" value="<%= impName %>개  품목"/>
				<input type="hidden" name="payNo" value=""/>
				

				<% for (int i=0; i < productNoList.length; i++) { %>
						<input type="hidden" name="productNoList" value="<%= productNoList[i] %>"/>
						<input type="hidden" name="earnedPointList" value="<%= earnedPointList[i] %>"/>
				<% }%>
				<button id="submit-button" type="submit" style="visibility: hidden;" disabled></button>
			</form>
		</div>
		<footer>
           <%@ include file="../common/footer.jsp" %>
        </footer>
	</div>
	<script>
		$(document).ready(function(){
		  const IMP = window.IMP; // 생략 가능
		  IMP.init("imp02576572"); // 예: imp00000000a
		  
			setTimeout(function() { 
				requestPay();
			},500);
		});

	  // 아임포트 결제 api
	  function requestPay() {
	    IMP.request_pay({
	      pg: "kakaopay.TC0ONETIME",
	      pay_method: "kakaopay",
	      merchant_uid: "<%= orderName %>",   // 주문번호(고유값으로 채번, 결제 완료이후 위변조검증시 필요하므로 디비에 저장)
	      name: "<%= impName %>개 품목",
	      amount: "<%= totalPrice + deliveryFee - usedPoint %>", // 숫자 타입
	      buyer_email: "<%= loginUser.getEmail()%>",
	      buyer_name: "<%= loginUser.getMemberName()%>",
	      buyer_tel: "<%= loginUser.getPhone()%>",
	      buyer_addr: "<%= address %>",
	      buyer_postcode: "00000"
	    }, function (rsp) { // callback
	    	if (rsp.success) {
	    	    // payNo 정보세팅
	    	    $('input[name=payNo]').val(rsp.imp_uid);
	    		
	    	    // 결제 성공시, order table에  
	    	    console.log("결제테스트 성공");

	    	    // submit 버튼 비활성화를 풀고, 폼 제출
	    	    $('#submit-button').prop('disabled', false);
	    	    $('#order-insert-form').submit(); // 후에, 주문 등 생성 후, 성공 메시지 띄우고
	    	    
	    	} else {
	    	    window.location.href = '<%= contextPath %>/fail.pm';
	    	}
	    });
	  }
	
	
	</script>
</body>
</html>