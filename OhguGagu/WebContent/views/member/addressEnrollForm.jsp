<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ohgu.address.model.vo.*" %>
<%
	ArrayList<Address> list = (ArrayList<Address>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>배송지 관리>배송지 등록</title>
<Style>
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
	
	.box {
		padding-left: 200px;
		width: 100%;
	}
	.addressEnrollForm {
		width: 1000px;
		height: 100%;
		margin-left: 40px;
		margin-top: 50px;
	}
	.addressEnrollForm h2 {
		margin-bottom: 50px;
	}
	.addressEnrollForm table tr, td {
		padding: 10px;
	}
	form{
		width: 600px;
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
				<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
			<div class="box">
				<div class="addressEnrollForm">
					<h2>배송지 등록</h2>
					<form action="<%= contextPath %>/insert.ad" method="post" align="center">
                        <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
						<table>
							<tr>
								<td>번호</td>
								<td><input type="text" name="title" style="width: 500px;"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><textarea name="content" cols="30" rows="10" style="resize: none; width: 500px;"></textarea></td>
							</tr>
						</table>
						<div>
							<button type="submit" class="btn btn-danger">작성</button>
							<button type="button" class="btn btn-outline-danger" onclick="history.back();">취소</button>
						</div>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>

</body>
</html>