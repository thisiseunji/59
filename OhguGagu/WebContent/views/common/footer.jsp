<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context_Path = request.getContextPath(); // contextPath 뽑는 변수 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        /*border: 1px solid black;*/
    }
    .footerWrapper{
        display: flex;
        background-color: lightgray;
        margin: auto;
    }
    .footerLogo{
    	width: 150px;
        margin: auto;
    }
    .footerWrapper>div{
        margin: auto;
    }
    .footer1{
        width: 40%;
        padding: 40px;
    }
    .footer2{
        width: 30%;
        padding: 40px;
    }
    .footer3{
        width: 20%;
        padding: 40px;
    }
    .footer4{
        width: 20%;
        padding: 40px;
    }
</style>
</head>
<body>
	<div class="footerWrapper">
        <div class="footer1">
            <img class="footerLogo" src="<%=contextPath%>/resources/image/logo.png">
            <p>
                <b>(주)오구가구 | 대표 김은지</b><br>
                                    주소 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F | 사업자등록번호.234-34-11234 <br>
               	이메일. ohgugagu@naver.com | 팩스. 02-234-3341 <br>
                                    개인정보관리책임. 최인수 | 통신판매없자. 제 2017-서울강남-00045호 <br>
            </p>
        </div>
        <div class="footer2"> 
        	<div>
	        	<p>
	            	<h4>고객센터</h4>
	            	<h2>1855-9234</h2>
	                * 평일 오전 9시 - 오후 6시 <br>
	                * 토요일 및 공유일 오전 9시 - 오후 5시 <br>
	                * 일요일 휴무
	            </p>
        	</div>
            <div align="center">
           		<a href="<%= context_Path %>/customerForm.cu" class="btn btn-danger">고객센터</a>
            </div>
        </div>
        <div class="footer3">
            <p>
                <b>논현동 본사 쇼룸</b> <br>
                <table>
                    <tr>
                        <td>평일</td>
                        <td>오전 9시 - 오후 6시</td>
                    </tr>
                    <tr>
                        <td>토요일 및 공휴일</td>
                        <td>오전 9시 - 오후 5시</td>
                    </tr>
                    <tr>
                        <td>일요일</td>
                        <td>휴무</td>
                    </tr>
                </table>
            </p>
        </div>
        <div class="footer4">
            <p>
                <b>경기 광주 물류센터</b> <br>
                <table>
                    <tr>
                        <td>평일</td>
                        <td>오전 9시 - 오후 5시</td>
                    </tr>
                    <tr>
                        <td>토요일 및 공휴일</td>
                        <td>오전 9시 - 오후 2시</td>
                    </tr>
                    <tr>
                        <td>일요일</td>
                        <td>휴무</td>
                    </tr>
                </table>
            </p>
        </div>
    </div>
</body>
</html>