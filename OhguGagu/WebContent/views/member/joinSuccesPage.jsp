<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .signup-complete-box{
        border: 1px solid lightgray;
        width: 600px;
        margin: auto;
        margin-top: 100px;
        padding: 50px;
    }
    .signup-complete-box img{
        width: 100px;
    }
    .signup-complete-box h2{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .signup-complete-box .btn{
        margin: 10px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="signup-complete-box" align="center">
        <img src="resources/image/succes.png">
        <h2>회원가입이 완료되었습니다.</h2>
        <div>
            <a href="<%= contextPath %>/loginform.me" class="btn btn-danger">로그인</a>
            <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>'">홈으로</button>
        </div>
    </div>
</body>
</html>