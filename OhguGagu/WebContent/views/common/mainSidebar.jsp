<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath_msb = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
   	.sidebar>div{
    	margin-left: 20px;
    	margin-top: 100px;
   	}
    .sidebar>div>div{
    	font-size: 40px;
	}
    .sidebar>div>a{
    	color: black;
    	text-decoration: none;
    	font-size: large;
    	margin: 20px;
    }


</style>
</head>
<body>
	<input type="checkbox" id="menuicon">
    <label for="menuicon">
	    <span></span>
	    <span></span>
	    <span></span>
    </label>
    <div class="sidebar">
	    <div>
		    <div>카테고리</div>
		    <a href="<%= contextPath_msb %>/list.pr">전체상품</a><br>
		    <a href="">할인상품</a><br>
		    <a href="">침대</a><a href="">책상</a><a href="">의자</a><br>
		    <a href="">소파</a><a href="">선반</a><a href="">진열장</a>
	    </div>
    </div>
</body>
</html>