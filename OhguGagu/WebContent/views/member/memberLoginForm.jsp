<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>로그인</title>
<style>
    .loginWrapper{
        display: flex;
        justify-content: space-evenly
    }
    .login-area{
        width: 50%;
    }
    .signUp-area{
        width: 50%;
    }
    .login-area>form{
    	display: block;
    	width: 120px;
    	margin: 0 auto;
    }
    .signUp-area>div{
    	width: 470px;
    	margin: 0 auto;
    }
	.outer input, .outer button{
		margin-top: 10px;
	}
	.integrated-login{
		width: 1500px;
		margin: auto;
		margin-top: 50px;
	}
	.signUp-area *{
		margin: 10px;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h1 align="center">로그인</h1>
		<br>
		<div class="integrated-login" style="height: 500px">
			<div class="loginWrapper">
				<div class="login-area">
					<form action="<%=contextPath%>/login.me" method="post">
						<h4>회원로그인</h4><br>
						<input type="text" name="memberId" required><br>
						<input type="password" name="memberPwd" required><br>
						<input type="checkbox">아이디 저장<br>
						<button type="submit" class="btn btn-danger">로그인</button>
					</form>
				</div>
				<div class="signUp-area">
					<div>
						<h4>오구가구 신규 회원가입</h4>
						<br>
						오구가구 온라인몰 회원가입 후 다양한 혜택과 소식을 만나보세요.<br>
						<a href="<%= contextPath %>/enrollForm.me" class="btn btn-outline-danger btn-block">회원가입</a>
						<br>
						<h4>아이디/비밀번호 찾기</h4>
						<br>
						간단한 정보를 입력 후 정보를 찾을 수 있습니다.<br>
						<a href="" class="btn btn-outline-danger" style="width: 200px">아이디찾기</a>
						<a href="" class="btn btn-outline-danger" style="width: 200px">비밀번호 찾기</a>	    
					</div>
				</div>
			</div>
		</div>
	</div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>