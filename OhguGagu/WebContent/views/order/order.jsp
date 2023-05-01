<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ohgu.order.model.vo.Order" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>주문정보조회</title>
<style>
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
    
    .order_info_area {
		width: 100%;
    }

    .member_info_box {
        width: 800px;
		height: 140px;
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px;
		margin: auto;
		margin-top: 50px;
    }
    
    table{
		width: 100%;
		height: 100%;
		text-align: center; 
	}

    .tr1td>div {
        font-size: 15px;
        padding-top:10px;
        margin-bottom: 11px;
    }

    #name {
        font-size: 35px;
        letter-spacing: 1px;
    }
    .thic_red {
        color: rgb(167, 0, 0);
        display: inline-block;
        font-weight: 700;
    }
    
	.period {
		width: 800px;
		margin: auto;
	}

    .period_set{
        height: 90px;
        margin-top: 2px;
        border: none;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        border-radius: 0px;
    }

    .period_set button{
        border: none;
        background-color: rgb(244, 244, 244);
        width: 50px;
        height: 25px;
        font-size: 13px;
    }

    .period_set button[type="submit"] {
        border: 1px solid rgb(167, 0, 0);
        color: rgb(167, 0, 0);
    }

    .order_list_box{
        width: 800px;
        margin: auto;
    }

    .order_list thead {
        height: 48px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        font-weight: 600;
    }

    .order_list tbody {
        text-align: center;
        font-size: 13px;
        border-bottom: 1px solid black;
        vertical-align: center;
    }

    .overflow {
    	min-height:600px;
    	overflow: auto;
    }
    
    body {	
    	height: 100%;
    }
    
</style>
</head>
<body>	
    <div class="outer">
        <header>
			<%@ include file="../common/menubar.jsp" %>
		</header>

        <div class="mainview overflow">
        		<div >
                   <%@ include file="../common/myPageSidebar.jsp" %>
                </div>
            <div class="order_info_area">

                <div class="member_info_box">
                <!-- ajax 대체 부분 -->
                    <table class="member_info">
                        <tr>
                            <td colspan="2">
                                <b id="name"><%=loginUser.getMemberName() %></b> 님 안녕하세요.
                                <br>
                                <!-- 회원등급 조회를 그냥 프론트에서 하자. total price를 가지고 아니면 그냥 모아서 쓸 수 있게 하던지 -->
								당신은 <span id="grade">일반회원</span> 등급입니다.
                            </td>
                            <td class="tr1td">
                                <div>주문</div>
                                <h2 class="thic_red">3</h2> 건
                            </td>
                            <td class="tr1td">
                                <div>적립금</div>
                                <h2 class="thic_red">2000</h2> 원
                            </td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <div class="period">
                    <b style="margin-left: 5px; font-size:20px">주문목록 조회</b>
                    <div class="member_info_box period_set" style="background-color:#ccc;">
                        <table>
                            <tr>
                                <td>  
                                                                                조회기간&nbsp;&nbsp;
                                    <!-- 
                                    	버튼이 눌릴 때 input값을 셋팅 하면 된다.
                                    	셋팅 한 후에 바로 submit을 누른 것 처럼 동작하면 됨.
                                    -->                                      	    
                                    <button class=period_btn value="0">오늘</button>
                                    <button class=period_btn value="7">7일</button>
                                    <button class=period_btn value="15">15일</button>
                                    <button class=period_btn value="30">30일</button>
                                    <button class=period_btn value="90">90일</button>
                                    <button class=period_btn value="365">365일</button>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;  
                                </td>
                                <td>
                                <!-- 달력이다 ! 데이터 어떻게 오는지 봐바 -->
                                    <input type="date" name="period_input"> - 
                                    <input type="date" name="period_input"> &nbsp;&nbsp; 
                                    <button id="period_select" >조회</button>
                                </td>
                            </tr>
                        </table>
                    </div> 
                </div>
                <br><br>
                <div class="order_list_box">
                    <b style="margin-left: 5px; font-size:20px">주문목록 조회 내역 총 0 건</b>
                    <div class="order_list_area">
                        <table class="order_list">
                            <thead>
                                <tr>
                                    <td>날짜/주문번호</td>
                                    <td>주문명</td>
                                    <td>주문금액</td>
                                    <td>주문상태</td>
                                </tr>
                            </thead>
                            <tbody>
								<!-- ajax요청 -->
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
	        </div>
        </div>
       	<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
    </div>

    <script>
	    $(document).ready(function() {

	    	selectGradeByMemberNo();

	    	selectOrder();
	    	
	    	//$('input[name="period_input"]').eq(1).val(new Date().toISOString().slice(0,10));
	    	
	        $('.period_btn').on('click', function() {
	            let period = Number($(this).val()); // 클릭된 버튼의 value값 가져오기
	            let today = new Date();
	            let todayString = today.toISOString().slice(0,10);
	            let startDate = new Date(today.getTime()+ - (period * 24 * 60 * 60 * 1000)); // 시작일 계산하기
	            let startDateString = startDate.toISOString().slice(0,10); // yyyy-mm-dd 형식으로 변경하기
	            $('input[name="period_input"]').eq(0).val(startDateString);
	            $('input[name="period_input"]').eq(1).val(todayString); // 종료일 인풋태그에 값을 설정하기
	        });
	        
		    // 주문 내역 조회
		    $('#period_select').on('click', function() {
		    	selectOrder();
		    });
	    });
		
	    // 사용자 등급 가져옴
		function selectGradeByMemberNo() {
			
			$.ajax({
	    		url : "agrade.me",
	    		type : "get",
	    		success : function(memberGrade) {
	    			
	    			console.log(memberGrade.gradeName);
	    			result = '<tr>'
	    				+ '<td colspan="2"><b id="name"><%= loginUser.getMemberName() %></b> 님 안녕하세요.<br>'
	    	        	+ '당신은 <span id="grade">'+ memberGrade.gradeName + '</span> 등급입니다.'
	    	        	+ '<td class="tr1td"><div>주문</div><h2 class="thic_red cnt_order"></h2> 건</td>'
	    	            + '<td class="tr1td"><div>적립금</div><h2 class="thic_red"><%= loginUser.getPoint() %></h2> 원</td>';
	
	    			$(".member_info").html(result);
	    		},
	    		error : function() {
	                console.log("회원 등급 select ajax 통신 실패");
	            }
	    	});
			
		}
		
	    // 주문정보 받아오기
        function selectOrder() {

        	$.ajax({
        		url : "alist.od",
        		type : "get",
                data : {
                    startDate : $('input[name="period_input"]').eq(0).val(),
                    endDate : $('input[name="period_input"]').eq(1).val()
                },
        		success : function(list) {
        			<%
        			  // 날짜 포맷 변경을 위한 SimpleDateFormat 클래스 인스턴스 생성
        			  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        			%>

        			let result = '';
        			
        			if(list.length == 0) {
        				result = '<tr><td style="height:50px" align="center" colspan=8>주문 내역이 없습니다.<td><tr>';
        			} 
					
        			for(let i in list) {
        				// 추가
        				let orderedAt = list[i].orderedAt;
        				let formattedDate = orderedAt.replace(/-/g, '/');
        				
        				// JavaScript의 Date.parse() 메소드를 사용하여 문자열 형식의 날짜를 밀리초 단위의 숫자로 변환
        				let milliseconds = Date.parse(formattedDate);

        				// 변환된 밀리초 값을 사용하여 JavaScript의 Date 객체 생성
        				let date = new Date(milliseconds);
        				let totalPayment = (list[i].price + list[i].deliveryFee) - list[i].usedPoint;
        				let orderName = list[i].orderName.substr(-30)
        				result += '<tr>'
        						+ '<td>'+ orderedAt +'</td>'	
        					    + '<td rowspan="2">' + list[i].orderMsg + '</td>'
        					    + '<td rowspan="2">' + totalPayment + '</td>'
        					    + '<td rowspan="2">'+ list[i].status +'</td>'
        					    + '</tr>'
        					    + '<tr>'
        					    + '<td><a href="<%=contextPath%>/detail.od?order='
        					    + list[i].orderNo 
        					    + '">' 
        					    + orderName
        					    + '</a>'
        					    + '</td>'
        					    + '</tr>';
        			}
        			$(".order_list_box>b").text('주문목록 조회 내역 : '+ list.length + ' 건');
        			$(".cnt_order").text(list.length);
        			$(".order_list>tbody").html(result);
        		},
        		error : function() {
                    console.log("주문목록 select ajax 통신 실패");
                }
        	});
	    }
    </script>
</body>
</html>