<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>고객센터</title>
<style>
	.outer{
		position: relative;
		height : 1000px;
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
	.dataBox {
		width: 800px;
		height: 200px;
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px;
		margin: auto;
		margin-top: 50px;
	}
	table{
		width: 100%;
		height: 100%;
		text-align: center;
	}
	.dataBox-area>td{
		margin-top: 10px;
	}
	.faq{
		width: 800px;
		margin: auto;
	}
	.faq>a{
		margin-left: 50px;
		text-decoration: none;
		color: black;
		margin-bottom: 5px;
	}
	.faq-area tr{
		height: 50px;
		border-bottom: 1px solid #ccc;
	}
</style>
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
				<div class="dataBox">
					<table class="dataBox-area">
						<tr>
							<td><h3><b>무엇을 도와드릴까요?</b></h3></td>
							<td rowspan="2">
								<h3><b>찾으시는 질문이 없다면?</b></h3><br>
								1:1 문의로 바로 답변을 받아보세요! <br>
								<a href="<%= contextPath %>/enrollForm.bo" class="btn btn-danger" style="margin-top: 10px;">1:1 문의하기</a>
							</td>
						</tr>
						<tr>
							<td><input style="width: 250px; border-radius: 30px; border: 1px solid #ccc; color: #ccc;" type="text" value="내용을 입력해주세요"></td>
						</tr>
					</table>
				</div>
				<br><br>
				<div class="faq">
					<h3  style="margin-left: 40px;"><b>FAQ</b></h3>
					<hr>
					<a href=""><b>전체</b></a><a href=""><b>회원가입/정보</b></a><a href=""><b>주문/결제/배송</b></a><a href=""><b>교환/반품/환불</b></a><a href=""><b>기타</b></a>
					<hr style="margin-bottom: 0px;">
					<table class="faq-area">
						<tr>
							<td>회원가입/정보</td>
							<td>Q.</td>
							<td>회원가입은 어떻게 하나요?</td>
						</tr>
						<tr>
							<td>회원가입/정보</td>
							<td>Q.</td>
							<td>개인 회원과 기업 회원의 차이는 무엇인가요</td>
						</tr>
						<tr>
							<td>회원가입/정보</td>
							<td>Q.</td>
							<td>아이디와 비밀번호를 분실했습니다.</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>
</body>
</html>