<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		text-align: center;
		border: none;
		border-collapse:collapse;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/myPageSidebar.jsp" %>
	<div class="outer">
		<form id="address-form" action="<%= contextPath %>/addressForm.me" method="post">
			<br>
			<b>배송지</b>
			<br><br>
			<table border="1">
				<tr>
					<td width="80">번호</td>
					<td width="400">주소</td>
				</tr>
				<tr>
					<td><%= getAddressNo() %></td>
					<td><%= getAddr() %> <%= getAddrDetail() %></td>
				</tr>
			</table>
		</form>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>