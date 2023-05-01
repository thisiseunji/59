<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 실패</title>
<style>
	* {
		box-sizing: border-box;
	}
	
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
	}
	
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
	
	.container {
		max-width: 800px;
		margin: 200px auto;
		padding: 50px;
		text-align: center;
		//background-color: #f9e000;
	}
	
	button {
	  background-color: rgb(167,0,0);
	  color: white;
	  border-style: none;
	  border-width: 0;
	  border-radius: 10px;
	  padding: 10px 20px;
	  width : 200px;
	}
</style>

</head>
<body>
	<div class="wrap">
		<header>
			<%@ include file="../common/mainSidebar.jsp" %>
			<%@ include file="../common/menubar.jsp" %>
		</header>
		<div class=container>
			<h4>결제에 실패했습니다.</h4>
			<br><br>
			<button onclick="location.href='<%=contextPath%>/list.cart'">장바구니로 이동</button>
			<button onclick="location.href='/ohgugagu'">홈으로 이동</button>
		</div>
		<footer>
           <%@ include file="../common/footer.jsp" %>
        </footer>
	</div>
</body>
</html>