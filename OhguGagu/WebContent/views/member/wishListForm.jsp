<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>찜목록</title>
<style>
	table {
		font-size: 12px;
		text-align: center;
		border-style: none;
		border-right: none;
		border-left: none;
		border-top:none;
		border-bottom:none;
		border-collapse:collapse;
	}
	a {
		font-size: 10px;
		color: crimson;
		text-decoration: none;
	}
	table button {
		border: solid 1px black;
		font-size: 12px;
		background-color: white;
		border-radius: 5px;
	}
	.btn {
		text-align: center;
		margin: 0 auto;
		width: 180px;
		height: 25px;
		border: solid 1px;
		border-radius: 5px;
		font-size: 12px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	
	<div class="outer">
		<br>
		<b>찜리스트</b>
		<br>
		<form id="wishList-form" action="" method="">
			<br>
			<table border="1">
				<tr>
					<td><input type="radio" ></td>
					<td width="400">상품명/옵션</td>
					<td width="150">상품금액/수량</td>
					<td width="150">혜택</td>
				</tr>
				<tr>
					<td><input type="radio" ></td>
					<td width="400">
						<img src="resources/">
						<a href="">구매 이용 조건 안내 전체보기 ></a>
						<br>
						<%= productName %>
						<br>
						<%= price() %>원
					</td>
					<td width="150">
						<%= price %>원 / <%= amount %>BOX <br>
						<button type="submit">옵션/수량변경</button>
					</td>
					<td width="150">
						<input type="checkbox">할인
					</td>
				</tr>
			</table>
			<br>
			<div id="buttons" style="text-align: center;">
				<button class="btn" style="color: crimson; background-color: white;">선택 상품 삭제</button>
				<input type="button" class="btn" value="선택 상품 장바구니" style="color: white; background-color: crimson;">
			</div>
		</form>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>