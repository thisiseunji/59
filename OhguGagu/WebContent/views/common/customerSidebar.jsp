<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div[class=side]{
    	width: 200px;
	    height: 100%;
	    background: white;
		border-right: 1px solid lightgray;
    }
   	.side>div{
    	margin-left: 20px;
    	margin-top: 10px;
   	}
    .side>div>div{
    	font-size: 40px;
    	margin-bottom: 20px;
	}
    .side>div>a{
    	color: black;
    	text-decoration: none;
    	font-size: large;
    	margin: 20px;
    }
	.side>div>div>a{
		color: black;
		text-decoration: none;
	}
	.side>div>a:hover{
		color: red;
	}
</style>
</head>
<body>
    <div class="side">
	    <div>
		    <div><a href="<%=request.getContextPath()%>/customerForm.cu">고객센터</a></div>
		    <a href="<%=request.getContextPath()%>/list.no?currentPage=1">공지사항</a><br><br>
		    <a href="<%=request.getContextPath()%>/enrollForm.bo">1:1 문의</a><br><br>
			<a href="<%=request.getContextPath()%>/list.fa">FAQ</a><br>
	    </div>
    </div>
</body>
</html>