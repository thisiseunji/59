<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>오구가구>마이페이지</title>
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

    .thic_black {
        width: 61px;
        font-size: 40px;
        font-weight: 700;
        font-family: "Inter", "Noto Sans KR";
    }
    .small_black {
        font-size: 13px;
    }

	.latest_order_area {
		width: 800px;
		margin: auto;
	}

    .latest_order_box {
        height: 110px;
        margin-top: 2px;
        border: none;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        border-radius: 0px;
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
    /* 취소주문건 등*/
    .order_count {
        padding-left: 60px;
        padding-right: 0px;
        width: 150px;
    }
</style>
</head>

<body>	
    <div class="outer">
        <header>
			<%@ include file="../common/menubar.jsp" %>
		</header>

        <div class="mainview">

        
            <div class="order_info_area">
                <div>
                    <%@ include file="../common/myPageSidebar.jsp" %>
                </div>
                <div class="member_info_box">
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
                <div class="latest_order_area">
                    <b style="margin-left: 3px; font-size:20px">진행 중인 주문</b>
                    <div style="font-size: 13px">최근 30일 내에 진행중인 주문정보입니다.</div>
                    <div class="member_info_box latest_order_box">
                        <table>
                            <tr>
                                <td class="thic_black" rowspan="2" id="s_pay_fin" >0</td>
                                <td class="thic_black" rowspan="2">&gt</td>
                                <td class="thic_black" rowspan="2" id="s_deli">0</td>
                                <td class="thic_black" rowspan="2">&gt</td>
                                <td class="thic_black" rowspan="2" id="s_deli_fin">0</td>
                                <td class="thic_black" rowspan="2">&gt</td>
                                <td class="thic_black" rowspan="2" id="s_confirm">1</td>
                                <td class="thic_black" rowspan="2">&gt</td>
                                <td class="thic_black" rowspan="2" id="s_ref_req">0</td>
                                <td class="order_count">취소 주문건</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td class="order_count">교환 주문건</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td class="small_black">결제완료</td>
                                <td></td>
                                <td class="small_black">배송중</td>
                                <td></td>
                                <td class="small_black">배송완료</td>
                                <td></td>
                                <td class="small_black">구매확정</td>
                                <td></td>
                                <td class="small_black">환불요청</td>
                                <td class="order_count">반품 주문건</td>
                                <td>0</td>
                            </tr>
                        </table>
                    </div> 
                </div>
                <br><br>
                <div class="order_list_box">
                    <b style="margin-left: 5px; font-size:20px">최근 주문 정보</b>
                    <div class="order_list_area">
                        <table class="order_list">
                            <thead>
                                <tr>
                                    <td>날짜/주문번호</td>
                                    <td>주문 내용</td>
                                    <td>지불 금액</td>
                                    <td>주문상태</td>
                                    <td>리뷰작성</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        2023.04.13
                                    </td>
                                    <td rowspan="2">
                                        1인용 쿠션의자 / 검정 
                                     </td>
                                     <td rowspan="2">
                                        120,000 원 / 1개
                                     </td>
                                     <td rowspan="2">
                                        결제 완료
                                     </td>
                                     <td rowspan="2">
                                        <a>리뷰작성</a>
                                     </td>
                                </tr>
                                <tr>
                                    <td>
                                        a1239043
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <br>
                        
                    </div> 
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
	    	
    	});
    	
		function selectGradeByMemberNo() {
					
					$.ajax({
			    		url : "agrade.me",
			    		type : "get",
			    		success : function(memberGrade) {
			    			
			    			result = '<tr>'
			    				+ '<td colspan="2"><b id="name"><%= loginUser.getMemberName() %></b> 님 안녕하세요.<br>'
			    	        	+ '당신은 <span id="grade">'+ memberGrade.gradeName + '</span> 등급입니다.'
			    	        	+ '<td class="tr1td"><div>총 주문건</div><h2 class="thic_red cnt_order"></h2> 건</td>'
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
                    startDate : '',
                    endDate : '' // 날짜는 필요 없지만 안 쓰면 애러남
                },
        		success : function(list) {

        			let s_pay_fin = 0;
        			let s_deli = 0;
        			let s_deli_fin = 0;
        			let s_confirm = 0;
        			let s_ref_req = 0;
        			
        			let result = '';
        			
        			if(list.length == 0) {
        				result = '<tr><td style="height:50px" align="center" colspan=8>주문 내역이 없습니다.<td><tr>';
        			} else {
        				
            			for (let i = 0; i < list.length; i++) {
            				switch (list[i].status) {
            				  case '환불요청':
            					s_ref_req++;
            				    break;
            				  case '배송중':
            					s_deli++;
            				    break;
            				  case '배송완료':
            					s_deli_fin++;
            				    break;
            				  case '구매확정':
            					s_confirm++;
            				    break;
            				  default:
            					s_pay_fin++;
            				    break;
            				}
            			}
        				
        				let orderedAt = list[0].orderedAt;
        				let formattedDate = orderedAt.replace(/-/g, '/');

        				// JavaScript의 Date.parse() 메소드를 사용하여 문자열 형식의 날짜를 밀리초 단위의 숫자로 변환
        				let milliseconds = Date.parse(formattedDate);

        				// 변환된 밀리초 값을 사용하여 JavaScript의 Date 객체 생성
        				let date = new Date(milliseconds);
        				let totalPayment = (list[0].price + list[0].deliveryFee) - list[0].usedPoint;
        				let orderName = list[0].orderName.substr(-15)
        				result += '<tr>'
        						+ '<td>'+ orderedAt +'</td>'	
        					    + '<td rowspan="2">' + list[0].orderMsg + '</td>'
        					    + '<td rowspan="2">' + totalPayment + '</td>'
        					    + '<td rowspan="2">'+ list[0].status +'</td>'
        					    + '<td rowspan="2">리뷰작성</td>'
        					    + '</tr>'
        					    + '<tr>'
        					    + '<td><a href="<%=contextPath%>/detail.od?order='
        					    + list[0].orderNo 
        					    + '">' 
        					    + orderName
        					    + '</a>'
           					    + '</td>'
        					    + '</tr>';
        			}
        			
        			$("#s_pay_fin").text(s_pay_fin);
        			$("#s_deli").text(s_deli);
        			$("#s_deli_fin").text(s_deli_fin);
        			$("#s_confirm").text(s_confirm);
        			$("#s_ref_req").text(s_ref_req);
        			
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