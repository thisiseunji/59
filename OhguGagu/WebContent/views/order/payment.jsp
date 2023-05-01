<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Base64" %>
<% 
	String[] cartCheckList = request.getParameterValues("cart_check");
	String[] fileNameList = request.getParameterValues("fileName");
	String[] productNoList = request.getParameterValues("productNo");
	String[] productNameList = request.getParameterValues("productName");
	String[] pColorList = request.getParameterValues("pColor");
	String[] amountList = request.getParameterValues("amount");// 다음에는 Quantity로 할 것
	String[] priceList = request.getParameterValues("price"); // 원가
	String[] discountPriceList = request.getParameterValues("discountPrice");// 할인 금액 왜 이걸 가격이라고 썼을까?
	String[] pointList = request.getParameterValues("point"); // 상품별 적립 포인트
	String[] realPriceList = request.getParameterValues("realPrice"); // (원가 - 할인금액) = 실제 지불 금액
	int listLength = cartCheckList.length; // 상품개수	// 고정된 가격으로 넘어오면 안된다. 실제 지불금액,기준으로 여기서 계산되어야 함.
	int totalprice = 0; // 배송비는 10만원 이상이면  // 지불금액의 10% 
	int deliveryFee = 0; // 10만원 미만이면, 5000원
	int appliedPoint = 0;
	
	// 겹치지 않는 주문번호 값 생성 및 할당
	String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
	timeStamp += productNoList.toString();
	String orderName = Base64.getEncoder().encodeToString(timeStamp.getBytes());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>결제</title>
<style>
	#wrap{
		min-height: 100vh;
		position: relative;
		width: 100%;
	}

	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: relative;
		z-index: 3;
	}

	html, body{
		margin: 0;
		padding: 0;
	}

	html {
		height: 100%;
	}

	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}

	body {
		padding-top: 100px;
		position: relative;
		/* 메뉴바 침범하지 않기위함 */
		z-index:1;
	}

    .container1 {
        width: 1500px;
        height: 100%;
        margin: auto;
        font-family: "Inter", "Noto Sans KR";
    }

    table{
		width: 100%;
		height: 100%;
		text-align: center; 
	}

    .cart_list_area {
        width: 100%;
    }
    
    .cart_list_area{
        margin: auto;
        margin-top: 50px;
    }

    .cart_list, .total_price {
        width: 100%;
    }

    .cart_list thead {
        width: 100%;
        height: 48px;
        border-top: 1px solid rgb(145, 145, 145);
        border-bottom: 1px solid rgb(145, 145, 145);
        font-weight: 600;
    }

    .cart_list tbody {
        text-align: center;
        font-size: 15px;
        border-bottom: 1px solid rgb(145, 145, 145);
        vertical-align: center;
    }

    #thumbnail_img {
        width: 120px;
        height: 90px;
        margin: 5px 0px;
        padding-left: 0px;
    }

    .total_price {
        border-radius: 5px;
        height: 100px;
        border: 1px solid rgb(145, 145, 145);
    }

    table * {
        /* border: 1px solid black; */
        font-size: 20px;
    }
    
    .small_black {
        font-size: 25px;
    }

    .thic_black {
        font-weight: 700;
        font-size: 50px;
    }

    .thic_red {
        font-weight: 700;
        font-size: 40px;
        color: rgb(167,0,0);
    }

    /* 배송정보 */
    .addr_list {
        width: 50%;
        border-top: 1px solid rgb(145, 145, 145);
        margin: 10px 0px;
    }

    .outer_tb {
        margin-left: 150px;
        margin-top: 10px;
        width: 80%;
    }

    .inner_tb * {
        margin-top: 20px;
        vertical-align: bottom;
        /* border:1px solid firebrick; */
    }

    .inner_tb_tr>td:nth-child(odd) {
        text-align: right;
        font-weight: 500;
        margin-right: 15px;
    }

    .title{
        margin-left: 5px;
        font-size: 22px;
        margin-right: 15px;
    }

    .inner_tb_tr2 {
        text-align: right;
    }

    .point {
        padding-right: 0px;
    }

    .red_btn {
        border: none;
        border-radius: 5px; 
        background-color: rgb(167,0,0); 
        color: white;
    }

    .last_payment {
        border: 1px solid rgb(145, 145, 145);
        border-radius: 3px;
        width: 25%;
        display: inline-block;
        /*margin: -700px 100px 150px 2300px;*/
        margin: -700px 100px 150px 1220px;
        display: fixed;
        padding: 10px;

    }

    .payment_tb {
        height: 180px;
    }

    .payment_btn {
        border: none;
        background-color: rgb(167,0,0);
        color: white;
        width: 100%;
        height: 60px;
        margin: 20px 10px;
        border-radius: 5px;
    }

</style>
</head>
<body>
    <div id="wrap">
		<header>
			<%@ include file="../common/mainSidebar.jsp" %>
			<%@ include file="../common/menubar.jsp" %>
		</header>
		<form id="payment-form" action="<%= contextPath %>/request.pm" method="post">
        <div class="container1">
	        <div class="cart_list_area">
	            <b class="thic_black title">주문서 작성/결제</b>
	            <table class="cart_list">
	                <thead>
	                    <tr>
	                        <td colspan="2">상품명/옵션</td>
	                        <td>수량</td>
	                        <td>상품금액</td>
	                        <td>할인/적립</td>
	                        <td>합계금액</td>
	                    </tr>
	                </thead>
	                <tbody>
	                    <!-- 변수로 대체되어야 하는 부분 / 빈 리스트는 넘어오지 않는다. -->
	                   <% for(int i=0 ; i < listLength ; i++) {
	                   		// checked인지 확인 => 체크되지 않았으면 다음으로 넘어간다.
	                   		// checked 됐으면, 해당 productNo의 값을 text로 저장한다.
	                   		if (Boolean.parseBoolean(cartCheckList[i])) {
	                   			continue;
	                   		} else {
	                   %>
	                    	<tr>
	                    		<!-- 파일이름 경로를 통일할 것, -->
	                    		<td rowspan="2" align="right" style="width:200px"><img id="thumbnail_img" src="<%= fileNameList[i]%>"></td>
	                    		<td align="left" style="width:200px; padding-left:5px; vertical-align:bottom;"><%= productNameList[i]%></td>
	                    		<td rowspan="2"><%= amountList[i] %>개</td>
	                    		<td rowspan="2"><%= priceList[i] %>원</td>
	                    		<td style="vertical-align:bottom; color: rgb(167,0,0)"><b>-<%= discountPriceList[i] %>원</b></td>
	                    		<td rowspan="2"><%= realPriceList[i] %>원</td>
	                    	</tr>
	                    	<tr>
	                     	<td align="left" style="padding-left:5px; vertical-align:top;"><%= pColorList[i] %></td>
	                         <td style="vertical-align:top; font-size: 12px; " rowspan=""><b>적립 : <%= pointList[i] %>원</b></td>
	                         <input type="hidden" name="productNoList" value="<%=productNoList[i]%>"/>
	                         <input type="hidden" name="earnedPointList" value="<%= pointList[i] %>"/>
	                     </tr>
	                   <%		totalprice += (Integer.parseInt(priceList[i])-Integer.parseInt(discountPriceList[i]));
	                   		} 
	                   	} //반복문 끝	
	                    	if (totalprice < 100000) {
	                    		deliveryFee = 5000;
	                    	} else {
	                    		deliveryFee = (int)Math.round(totalprice*0.1);
	                    	}
	                    %>
	                    
	                </tbody>
	            </table>
	        </div> 
	        <br>
	        <br>
	        <div class="total_price">
	            <table>
	                <tr>
	                    <td class="small_black"><b>총 <%= listLength %>개의 상품금액</b></td>
	                    <td rowspan=2 class="thic_black">+</td>
	                    <td class="small_black" ><b>배송비</b></td>
	                    <td rowspan=2 class="thic_black">=</td>
	                    <td rowspan=2><b class="thic_red"><%= totalprice + deliveryFee %></b><b style="font-size: 15px;">원</b></td> 
	                    <!-- 지불 가격 -->
	                </tr>
	                <tr>
	                    <td><%= totalprice %>원</td>
	                    <td><%= deliveryFee %>원</td>
	                </tr>
	            </table>
	        </div>
	        <br>
	        <br>
	        <br>
	        <br>
	        <div class="addr_area">
	        	<div id="warning" style="color: rgb(167,0,0); font-size: 14px; font-weight: bold;">* 필수 입력</div>
	            <b class="thic_black title">배송 정보</b>
	            <select name="address" id="address" onchange="changeAddr();" style="width:150px;">
	                <!-- 옵션 : 고객이 등록한 배송지 목록 -->
	            </select>
	            <div class="addr_list">
	                <table class="outer_tb">
	                    <tr>
	                        <td>
	                            <table class="inner_tb">
	                                <tr class="inner_tb_tr">
	                                    <td>수령인</td>
	                                    <td><input name="receiver" type="text" required readonly disabled/><td>
	                                </tr>
	                                <tr class="inner_tb_tr">
	                                    <td>연락처</td>
	                                    <td><input name="phone" type="text" required readonly disabled></td>
	                                </tr>
	                                <tr class="inner_tb_tr">
	                                    <td>주소</td>
	                                    <td><input name="addr" type="text" required readonly disabled></td>
	                                </tr>
	                                <tr class="inner_tb_tr">
	                                    <td>상세주소</td>
	                                    <td><input name="addr_detail" type="text" required readonly disabled></td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	        <br>
	        <br>
	        <br>
	        <br>
	        <div class="payment_area">
	        	<div id="warning" style="color: rgb(167,0,0); font-size: 14px; font-weight: bold;">* 필수 입력</div>
	            <b class="thic_black title">포인트적용</b>
	            <div class="addr_list point">
	                <table class="outer_tb">
	                    <tr>
	                        <td>
	                            <table class="inner_tb about_point" style="width:500px;">
	                                <tr class="inner_tb_tr inner_tb_tr2">
	                                    <td>보유</td>
	                                    <td><%= loginUser.getPoint() %>원</td>
	                                    <td style="text-align:left; padding-left:15px;"><button type="button" class="red_btn" id="allpoint_btn">전액사용</button></td>
	                                </tr>
	                                <tr class="inner_tb_tr inner_tb_tr2 using_point">
	                                    <td>사용</td>
	                                    <!-- 사용자가 사용할 포인트를 입력 -->
	                                    <td><input name="usedPoint" type="number" required style="width: 100px;" min="0" max="<%=loginUser.getPoint()%>" value=0 onchange="checkPoint()">원</td>
	                                    <td style="text-align:left; padding-left:15px;"><button type="button" class="red_btn" id="point_btn">포인트 적용</button></td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
         </div> <!-- container1의 닫힘 태그 -->
            <div class="last_payment">
                <div class="thic_black title"> 결제정보
                    <div style="border-top:1px solid rgb(145, 145, 145); margin-top:10px; padding: 10px 0px;">
                        <table class="outer_tb" style="margin-left: 100px;">
                            <tr>
                                <td>
                                    <table class="inner_tb payment_tb">
                                        <tr class="inner_tb_tr inner_tb_tr2">
                                            <td>구매 금액</td>
                                            <td><%= totalprice %>원</td>
                                        </tr>
                                        <tr class="inner_tb_tr inner_tb_tr2">
                                            <td>배송비</td>
                                            <td><%= deliveryFee %>원</td>
                                        </tr>
                                        <tr class="inner_tb_tr inner_tb_tr2" style="margin-bottom: 100px;">
                                            <td>포인트 적용</td>
                                            <td>-<div style="display:inline-block;"; id="applyPoint">0</div>원</td>
                                        </tr>
                                        <tr class="inner_tb_tr inner_tb_tr2" style="margin-top: 10px; border-top: 1px solid rgb(145, 145, 145);">
                                            <td class="thic_black" style="font-size: 27px;">합계</td>
                                            <td class="thic_red" style="font-size: 27px;"><div style="display:inline-block;"; id="lastPrice"><%= totalprice + deliveryFee %></div>원</td>
                                            <input type="hidden" name="orderName" value="<%=orderName%>"/>
                                            <input type="hidden" name="impName" value="<%=productNameList[0]%> 등 <%= listLength%>"/>
                                            <input type="hidden" name="totalPrice" value="<%=totalprice%>"/>
                                            <input type="hidden" name="deliveryFee" value="<%=deliveryFee%>"/>
                                            <input type="hidden" name="addressNo" value="-1"/>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <button class="payment_btn" type="submit" disabled>결제하기</button>
                    <!-- <button class="payment_btn" onclick="requestPay()">결제하기</button> -->
                </div>
            </div>
         </form>
         <footer>
            <%@ include file="../common/footer.jsp" %>
         </footer>
    </div>

	<script>
		$(document).ready(function() {
			  selectAddr();
		});
	  
	   //배송지 조회용
   	   function selectAddr() {
   		   $.ajax({
	   			url : "alist.addr",
				type : "get",
				success : function(list) {
					let result = '<option value="-1" selected>배송지 선택</option>';
					for (let i in list) {
						
						result += '<option class="" value="'+ list[i].receiver + '">'+ list[i].receiver +'</option>'
					}
					$(".addr_area select").html(result);				
				},
				error : function() {
					console.log("배송지 조회용 ajax 통신 실패!");	
				}
   		   });
   	   }
   	   
	   // 주소지 선택시 해당 태그에 데이터  값 입력
   	   function changeAddr() {
	   		$.ajax({
	   			url : "alist.addr",
				type : "get",
				success : function(list) {
		  			if ($("select[name=address] > option:selected").val() == -1) { // select의 옵 value를 꺼내서 
		  				$("input[name=receiver]").attr("value", "");
		   				$("input[name=phone]").attr("value", "");
		   				$("input[name=addr]").attr("value", "");
		   				$("input[name=addr_detail]").attr("value","");
		   				$('.payment_btn').prop('disabled', true);
		   				return;
		   			} else {
		   				for(let i in list) { // 주소값이 전부 있음
		   					if($("select[name=address] > option:selected").val() == list[i].receiver){
		   						$("input[name=receiver]").attr("value", list[i].receiver);
				   				$("input[name=phone]").attr("value", list[i].phone);
				   				$("input[name=addr]").attr("value",list[i].addr);
				   				$("input[name=addr_detail]").attr("value",list[i].addrDetail);
				   				$("input[name=addressNo]").val(list[i].addressNo);
				   				$('.payment_btn').prop('disabled', false);
		   					}
		   				}
		   			}
				},
				error : function() {
					console.log("배송지 변경용 ajax 통신 실패!");	
				}
   			});
   	   }
   	   
	   	$(document).on('click', '.payment_btn:disabled', function(e) {
	   	    e.preventDefault();
	   	    alert('주소나 포인트 값은 필수 입력사항입니다.');
	   	});
   	   
   	   // 포인트 전액적용 버튼 클릭시 
   	   $("#allpoint_btn").click(function () {
   			// 주문금액 > 포인트 전액 : 포인트를 전부 적용해도 결제할 금액이 있을 때, 
			if (<%=totalprice + deliveryFee%> > <%=loginUser.getPoint()%>) {
				$("input[name=usedPoint]").val(<%=loginUser.getPoint()%>);
				$("div[id='applyPoint']").text(<%=loginUser.getPoint()%>);
   				$("div[id='lastPrice']").text(<%=totalprice + deliveryFee - loginUser.getPoint()%>);	
			} else {
				$("input[name=usedPoint]").val(lastPrice);
   	   			$("div[id='applyPoint']").text(<%=totalprice + deliveryFee%>);
   	   			$("div[id='lastPrice']").text(0);
			}
   		 
   	   });
   	   
   	$("#point_btn").click(function() {
   	    if ($("input[name=usedPoint]").val() < 0) {
   	        alert("0보다 큰 값만 입력 가능합니다.");
   	        $("input[name=usedPoint]").val(0);
   	        $("div[id='applyPoint']").text(0);
   	        $("div[id='lastPrice']").text(<%= totalprice + deliveryFee%>);
   	    } else if ($("input[name=usedPoint]").val() > <%=loginUser.getPoint()%> || <%=loginUser.getPoint()%> > <%=totalprice + deliveryFee%>) {
   	        alert("사용 가능 금액을 초과했습니다.");
   	        console.log(<%= totalprice + deliveryFee %>);
   	        if (<%=totalprice + deliveryFee%> > <%=loginUser.getPoint()%>) {
   	            $("input[name=usedPoint]").val(<%=loginUser.getPoint()%>);
   	            $("div[id='applyPoint']").text(<%=loginUser.getPoint()%>);
   	            $("div[id='lastPrice']").text(<%=totalprice + deliveryFee - loginUser.getPoint()%>);
   	        } else {
   	            $("input[name=usedPoint]").val(lastPrice);
   	            $("div[id='applyPoint']").text(<%=totalprice + deliveryFee%>);
   	            $("div[id='lastPrice']").text(0);
   	        }
   	    } else {
   	        $("div[id='applyPoint']").text($("input[name=usedPoint]").val());
   	        $("div[id='lastPrice']").text(<%=totalprice + deliveryFee%>-$("input[name=usedPoint]").val());
   	    } 
   	});

   	   
   	   function checkPoint() {
   		   if ($(this).val() < 0) {
   			   alert("0원 이상만 입력 가능합니다.");
   		   }
   	   }
   	   
	</script>
	
</body>
</html>