<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
    .error-box {
        border: 1px solid lightgray;
        width: 600px;
        margin: auto;
        margin-top: 100px;
        padding: 50px;
    }
    .error-box img {
        width: 100px;
    }
    .error-box h2 {
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .error-box .btn {
        margin: 10px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="error-box" align="center">
        <img src="resources/image/error.png">
        <h2><%= errorMsg %></h2>
        <div>
            <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>'">홈으로</button>
        </div>
    </div>
</body>
</html>