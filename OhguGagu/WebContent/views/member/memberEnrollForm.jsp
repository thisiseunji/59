<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>회원가입</title>
<style>
	.outer{
		width: 1000px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 100px;
	}
	#enroll-form table{margin: auto;}
	#enroll-form input{margin: 10px;}
	#enroll-form button{margin: 10px;}
</style>
</head>
<script>
	function check_pw(){
		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
		var check = document.getElementById("check");
		
		if(pw == pw2){
			check.innerHTML = "비밀번호가 일치합니다.";
			check.style.color = "blue";
		}else{
			check.innerHTML = "비밀번호가 일치하지 않습니다.";
			check.style.color = "red";
		}
	}
	
	function idCheck(){
		let $memberId = $("#enroll-form input[name=memberId]");
		
		$.ajax({
			
		});
	}
</script>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">
		<br>
		<h1 align="center">회원가입</h1>
		<br>
		<form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
			<table>
				<tr>
					<th>*아이디</th>
					<td><input type="text" name="memberId" maxlength="12" required></td>
					<td>
						<button type="button" onclick="idCheck();">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>*비밀번호</th>
					<td><input type="password" name="memberPwd" id="pw" onchange="check_pw()"></td>
					<td></td>
				</tr>
				<tr>
					<th>*비밀번호 확인</th>
					<td><input type="password" name="memberPwd2" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span></td>
					<td></td>
				</tr>
				<tr>
					<th>*이름</th>
					<td><input type="text" name="memberName" required></td>
					<td></td>
				</tr>
				<tr>
					<th>*이메일</th>
					<td><input type="email" name="email" required></td>
					<td></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gender" value="M">남<input type="radio" name="gender" value="F">여</td>
					<td></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone"></td>
					<td></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="bDate"></td>
					<td></td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn btn-danger">회원가입</button>
				<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>'">취소</button>
			</div>
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>