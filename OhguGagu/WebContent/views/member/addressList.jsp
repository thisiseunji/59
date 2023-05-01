<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ohgu.address.model.vo.*" %>
<%
	ArrayList<Address> list = (ArrayList<Address>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		position: relative;
		height : 1500px;
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
	.addressList{
		width: 1000px;
		margin-left: 80px;
		margin-top: 50px;
	}
	.addressList table{
		width: 100%;
		height: 100%;
		text-align: center;
	}
	thead{
		background-color: #f2f2f2;
		height: 70px;
	}
	table tr {
		height: 50px;
		border-bottom: 1px solid #ccc;
	}
	table>tbody>tr:hover{
		background-color: #f2f2f2;
		cursor: pointer;
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
				<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
			<div class="box">
				<div class="addressList">
					<h3  style="margin-left: 40px;"><b>배송지</b></h3>
					<div align="right" style="width: 850px">
						<% if(loginUser != null) { %>
						<a href="<%= contextPath %>/insert.ad" class="btn btn-danger" style="margin-top: 10px;">배송지 등록</a>
						<% } %>
					</div>
					<hr style="margin-bottom: 0;">
					<div>
						<table>
							<thead>
								<tr>
									<td width="80">번호</td>
					                <td width="400">주소</td>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()) { %>
									<tr>
										<td colspan="2">
                                            	조회된 리스트가 없습니다.
                                        </td>
									</tr>
								<% } else { %>
                                    <% for(Address a : list) { %>
                                <tr>
                                    <td><%= a.getAddressNo() %></td>
                                    <td><%= a.getAddr() %> <%= a.getAddrDetail() %></td>
                                </tr>
                                    <% } %>
								<%} %>
							</tbody>
						</table>
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