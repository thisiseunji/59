
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ohgu.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath(); // contextPath 뽑는 변수 
	String alertMsg = (String)session.getAttribute("alertMsg"); // 일회성 알람메세지 변수
	Member loginUser = (Member)session.getAttribute("loginUser"); // 로그인한 회원의 객체 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">


	<style>
        div{
            /*border: 1px solid black;*/
        }
        .menuWrapper{
            display: flex;
            height: 100px;
            border-bottom: 1px solid lightgray;
        }
        .menu{
            width:295px;
        }
        .logo{
            width: 100%;
            text-align: center;
        }
        .login{
            width: 230px;
            display: flex;
            justify-content: flex-end;
            padding-top: 20px;
            padding-right: 15px;
        }
        .mainLogo{
            width: 150px;
            margin: auto;
        }
        .login>div>a{
            margin: 5px;
            color: black;
            text-decoration: none;
        }
        input[id="menuicon"]{
            display: none;
        }
        input[id="menuicon"]+label{
            display: block;
            width: 25px;
            height: 25px;
            position: fixed;
            left: 0;
            top:calc(50% -25px);
            transition: all .35s;
            cursor: pointer;
            margin-top: 50px;
            margin-left: 30px;
        }
        input[id="menuicon"]+label span{
            display: block;
            position: absolute;
            width: 100%;
            height: 5px;
            border-radius: 30px;
            background: #000;
            transition: all .35s;
        }
        input[id="menuicon"] + label span:nth-child(1){
            top:0;
        } 
        input[id="menuicon"] + label span:nth-child(2){
            top:50%;
            transform: translateY(-50%);
        } 
        input[id="menuicon"] + label span:nth-child(3){
            bottom: 0;
        }
        input[id="menuicon"]:checked + label span:nth-child(1){
            top:50%;
            transform:translateY(-50%) rotate(45deg);
        }
        input[id="menuicon"]:checked + label span:nth-child(2){
            opacity:0;
        }
        input[id="menuicon"]:checked + label span:nth-child(3){
            bottom:50%;
            transform: translateY(50%) rotate(-45deg);
        }
        div[class="sidebar"]{
            width: 300px;
            height: 100%;
            background: lightgray;
            position: fixed;
            top: 0;
            left: -300px;
            z-index:1;
            transition: all .35s;
        }
        input[id="menuicon"]:checked + label + div {
            left:0;
        }
        input[id="menuicon"]:checked + label {
            z-index: 2;
            left: 300px;
        }
    </style>
</head>
<body>

	<script>
        let msg = "<%= alertMsg %>";

        if(msg != "null"){
            alert(msg);
            <% 
                session.removeAttribute("alertMsg");
            %>
        }
    </script>

	<div class="menuWrapper">
        <div class="menu">
            
        </div>
        <div class="logo"><a href="<%= contextPath %>"><img class="mainLogo" src="<%= contextPath %>/resources/image/logo.png"></a></div>
        <div>
        	<% if(loginUser == null){ %>
        		<!-- 로그인 전 -->
        		<div class="login">
        			<div><a href="<%= contextPath %>/loginform.me">Login</a></div>
		        	<div><a href="<%= contextPath%>/enrollForm.me">Sign up</a></div>
		        	<div><a href="">Search</a></div>
        		</div>
	        <% } else{ %>	
	        	<!-- 로그인 후 -->
	        	<br>
	        	<div><b><%= loginUser.getMemberName() %>님</b> 환영합니다.</div>
                <div class="login">
                	<%if(loginUser.getMemberId().equals("admin")){ %>
                		<div><a href="<%= contextPath %>/adminPage.me">adminPage</a></div>
                		<div><a href="<%= contextPath %>/logout.me">logout</a></div>
                		<div style="margin-right: 30px;"><a href="">Search</a></div>
                	<%}else{ %>
                    	<div><a href="<%= contextPath %>/myPage.me?mno=<%=loginUser.getMemberNo()%>">MyPage</a></div>
                    	<div><a href="<%= contextPath %>/logout.me">logout</a></div>
                    	<div><a href="<%= contextPath%>/list.cart">Cart</a></div>
                    	<div><a href="">Search</a></div>
                    <%} %>

                </div>
	        <% } %>
        </div>
    </div>
</body>
</html>