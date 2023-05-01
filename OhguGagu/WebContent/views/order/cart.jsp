<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ohgu.product.model.vo.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>장바구니</title>
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

    .cart_info_area {
		width: 100%;
    }
    .total_price {
        width: 800px;
		height: 100px;
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

    .thic_black {
        font-weight: 800;
        font-size: 25px;
    }

    .thic_red {
        font-weight: 700;
        font-size: 25px;
        color: rgb(167,0,0);
    }

    .cart_list_box{
        width: 800px;
        margin: auto;
        margin-top: 50px;
    }

    .cart_list thead {
        height: 48px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        font-weight: 600;
    }

    .cart_list tbody {
        text-align: center;
        font-size: 15px;
        border-bottom: 1px solid black;
        vertical-align: center;
    }

    #thumbnail_img {
        width: 120px;
        height: 90px;
        margin: 5px 0px;
        padding-left: 0px;
    }

    .button {
        text-align: center;
        margin-top: 40px;
    }

    .button * {
        border: none;
        border-radius: 3px;
        background-color: rgb(167,0,0);
        color:white;
        width: 150px;
        height: 35px;
    }

    .close_icon>img {
        width: 12px;
        height: 12px;
        cursor:pointer;
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
       <div class="mainview">
           <div class="cart_info_area">
               <div class=my_page_sidebar>
                   <%@ include file="../common/myPageSidebar.jsp" %>
               </div>
               <div class="overflow">
                <form id="cart-form" action="<%= contextPath %>/start.od" method="post">
	                <div class="cart_list_box">
	                    <b style="margin-left: 5px; font-size:20px">장바구니</b>
	                    <div class="cart_list_area">
	                        <table class="cart_list">
	                            <thead>
	                                <tr>
	                                    <td><input type="checkbox" name="cart_check_all" id="cart_check_all" checked></td>
	                                    <td colspan="2">상품명/옵션</td>
	                                    <td>수량</td>
	                                    <td>상품 가격</td>
	                                    <td>할인/적립</td>
	                                    <td>합계 금액</td>
	                                    <td><div>삭제</div></td>
	                                </tr>
	                            </thead>
	                            <tbody> 
	                            	<!-- ajax -->
	                            </tbody>
	                        </table>
	                    </div> 
	                </div>
	                <div class="total_price">
	                    <table>
	  						<!-- ajax -->
	                    </table>
	                </div>
	                <div class="button">
	                    <button style="margin-right:5px;">계속 쇼핑하기</button>
	                    <button style="margin-left:5px;" type="submit" id="order" >선택상품 주문하기</button>
	                </div>
                </form>
                <br>
                <br>
                <br>
                <br>
			</div>
	      	<footer>
				<%@ include file="../common/footer.jsp" %>
			</footer>
        </div>
    </div>
</div>
    <script>
        $(function() {
            selectCart();

            // 체크박스 선택 관련
            $(document).on("click", "#cart_check_all", function() {
                if($("#cart_check_all").is(":checked")) 
                    $("input[name=cart_check]").prop("checked", true);
                else 
                    $("input[name=cart_check]").prop("checked", false);
            });
            $(document).on("click", "input[name=cart_check]", function() {
                var total = $("input[name=cart_check]").length;
                var checked = $("input[name=cart_check]:checked").length;

                if(total != checked) $("#cart_check_all").prop("checked", false);
                else $("#cart_check_all").prop("checked", true); 
            });

            // 카트 삭제
            $(document).on("click", ".close_icon", function() {
            	let str = $(this).attr("id");
                deleteCart(str.substring(str.lastIndexOf("n") + 1));
            });
			
            // 카트 수량 업데이트
           	$(document).on("click", ".setAmount_btn", function() {
           		let str = $(this).attr("id");
           		let i = str.substring(str.lastIndexOf("n") + 1);
           		if ($("#amount"+i).val()==0) {
           			deleteCart(i);
           		} else {
           			setAmountCart(i);
           		}
            });
			
            // 장바구니가 비어있을 경우 이벤트 취소, 주문 제출 방지
           	$("#cart-form").submit(function(e) {
           	  if ($("input[name='listLength']").val() == 0) {
           	    e.preventDefault();
           	  }
           	});
        });

        // 장바구니 목록 가져오기 
        function selectCart() {
					$.ajax({
						url : "alist.cart",
						type : "get",
						success : function(list) {
							
							let result = '';
							if (list.length == 0) {
								$("#order").prop("disabled", true).css("opacity", "0.5");
								$("#cart_check_all").prop("checked", false);
								result = '<tr><td style="height:50px" align="center" colspan=8>장바구니에 담긴 상품이 없습니다.<td><tr>';
							}
							let totalPrice = 0;

							// 모든 장바구니 객체
							for(let i in list) {
                                let price = list[i].price*list[i].amount;
                                let discountPrice = (list[i].discountRate/100)*price;
                                let point = (list[i].pointRate/100)*(price-discountPrice);
								
                                result += '<tr>'
                                        + '<td rowspan="2"><input type="checkbox" name="cart_check" id="cart_check" checked></td>'
                                        + '<td rowspan="2" align="right" style="width:160px"><img id="thumbnail_img" src="' + list[i].fileName + '"></td>'
                                        + '<td align="left" style="padding-left:5px; vertical-align:bottom;">'+ list[i].productName +'</td>'
                                        + '<td style="vertical-align:bottom;"><input style="width:25px; vertical-align:bottom;" type="text" value='+ list[i].amount +' maxlength="2" id="amount'+i+'"> 개</td>'
                                        + '<td rowspan="2">'+ list[i].price +'원</td>'
                                        + '<td style="vertical-align:bottom; color: rgb(167,0,0)"><b>-'+ discountPrice +'원</b></td>'
                                        + '<td rowspan="2" class="price_td">'+ (price-discountPrice) +'원</td>'
                                        + '<td rowspan="2"><div class="close_icon" id="close_icon'+ i +'" onClick="delete('+i+');"><img src="https://static.thenounproject.com/png/102781-200.png" alt=""></div></td>'
                                        + '</tr>'
                                        + '<tr>'
                                        + '<td align="left" style="padding-left:5px; vertical-align:top;">'+ list[i].pColor +'</td>'
                                        + '<td><button class="setAmount_btn" id="setAmount_btn' + i + '" type="button" style="vertical-align:top; background-color:#ccc; border:none; font-size: 12px; border-radius: 3px;">수량변경</button></td>'
                                        + '<td style="vertical-align:top; font-size: 12px;"><b>적립 : '+ point +'원</b></td>'
                                        + '</tr>'
                                   
                               totalPrice += (price-discountPrice);
                                        
                                result += '<input type="hidden" name="fileName" value='+ list[i].fileName +'>'
                                	+ '<input type="hidden" id="productNo'+ i +'" name=productNo value='+ list[i].productNo +'>'
                                    + '<input type="hidden" name="productName" value='+ list[i].productName +'>'
                                    + '<input type="hidden" name="pColor" value='+ list[i].pColor +'>'
                                    + '<input type="hidden" name="amount" value='+ list[i].amount +'>'
                                    + '<input type="hidden" name="price" value='+ price +'>'
                                    + '<input type="hidden" name="discountPrice" value='+ discountPrice +'>' // 할인 금액
                                    + '<input type="hidden" name="point" value='+ point +'>'//적립금
                                    + '<input type="hidden" name="realPrice" value='+ (price-discountPrice) +'>';//할인된 가격 
							}
                            
                            let result1 = '<tr>'
                            		   + '<td class="small_black"><b>총 0개의 상품금액</b></td>'
                            		   + '<td rowspan=2 class="thic_black">+</td>'
                            		   + '<td class="small_black" ><b>배송비</b></td>'
                            		   + '<td rowspan=2 class="thic_black">=</td>'
                            		   + '<td rowspan=2><b class="thic_red">0</b><b style="font-size: 15px;">&nbsp&nbsp원&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></td>'
									   + '</tr>'
									   + '<tr>'
									   + '<td>0 원</td>'
									   + '<td>0 원</td>'
									   + '</tr>';
							// 배송비		   
							if (list.length > 0) { //반환된 객체가 있을 때,
								
								let deliveryFee = 5000;
								// 총 가격이 100000원을 초과할 경우 총 주문 금액의 10%
								if(totalPrice >= 100000) {
									deliveryFee = totalPrice*0.1;
								}
								
								result1 = '<tr>'
	                         		   + '<td class="small_black"><b>총 '+list.length+'개의 상품금액</b></td>'
	                        		   + '<td rowspan=2 class="thic_black">+</td>'
	                        		   + '<td class="small_black" ><b>배송비</b></td>'
	                        		   + '<td rowspan=2 class="thic_black">=</td>'
	                        		   + '<td rowspan=2><b class="thic_red">'+ (totalPrice + deliveryFee) +'</b><b style="font-size: 15px;">원</b></td>'
									   + '</tr>'
									   + '<tr>'
									   + '<td>'+ totalPrice +' 원</td>'
									   + '<td>'+ deliveryFee +' 원</td>'
									   + '</tr>';
							}				
	                            
						
						$(".cart_list tbody").html(result);
						$(".total_price>table").html(result1);
						},
						
						error : function() {
							console.log("장바구니  조회용 ajax 통신 실패!");
						}
					});
            }
        
        	// 수량 변경
            function setAmountCart(i) {
                $.ajax({
                    url : "setAmount.cart",
                    type : "post",
                    data : {
                        amount : $("#amount"+i).val(),
                        productNo : $("#productNo"+i).val()
                    },
                    success : function(result) {
                        if(result > 0) { // 수량 업데이트 성공
                            selectCart();
                        } else { // 수량 업데이트 실패
                            alert("수량 변경 실패");
                        }
                    },
                    error : function() {
                        console.log("장바구니 update ajax 통신 실패");
                    }
                });
            }
			
        	
        	// 카트 아이템 삭제
            function deleteCart(i) {
                $.ajax({
                    url : "delete.cart",
                    type : "post",
                    data : {
                        productNo : $("#productNo"+i).val()
                    },
                    success : function(result) {
                        if(result > 0) { // 삭제 성공
                            selectCart();
                        } else { 
                            alert("삭제 실패");
                        }
                    },
                    error : function() {
                        console.log("장바구니 update ajax 통신 실패");
                    }
                });
            }

        	// 체크박스 선택 상태가 변할 때 마다 총 주문가격 및 주문상품 개수, 배송비 업데이트
            $(document).on('change', "input[name='cart_check_all'], input[name='cart_check']", function() {
            	  // 전체 상품의 수 
            	  let listLength = $("input[name='cart_check']").length;

            	  // 총 n개의 상품의 구문의 n 
            	  let checkedCount = $("input[name='cart_check']:checked").length;
	           	  
            	  if (checkedCount == 0) {
            		  $("#order").prop("disabled", true).css("opacity", "0.5");
            	  } else {
            		  $("#order").prop("disabled", false).css("opacity", "1");
            	  }
            	 
	           	  // check로 선택된 상품의 누적 가격
	           	  let totalPrice = 0;
	           	  
	           	  for (let i = 0; i < listLength; i++) {
		           	  if ($("input[name='cart_check']").eq(i).is(":checked")) {
		           		totalPrice +=  parseInt($("input[name='price']").eq(i).val());
		          		  	$(".price_td").eq(i).val();
		          		  } else {
		          		    continue;
		          		  }
	           	  }
	           	  
	           	  let result = ''
	           	  
				  let deliveryFee = 5000;
				
	           	  if (checkedCount == 0) {
	           		  deliveryFee = 0;
	           	  } else if ( totalPrice >= 100000) {
					deliveryFee = totalPrice*0.1;
				  } 
					
				  result = '<tr>'
	              		   + '<td class="small_black"><b>총 '+ checkedCount +'개의 상품금액</b></td>'
	             		   + '<td rowspan=2 class="thic_black">+</td>'
	             		   + '<td class="small_black" ><b>배송비</b></td>'
	             		   + '<td rowspan=2 class="thic_black">=</td>'
	             		   + '<td rowspan=2><b class="thic_red">'+ (totalPrice + deliveryFee) +'</b><b style="font-size: 15px;">원</b></td>'
						   + '</tr>'
						   + '<tr>'
						   + '<td>'+ totalPrice +' 원</td>'
						   + '<td>'+ deliveryFee +' 원</td>'
						   + '</tr>';
						   
				  $(".total_price>table").html(result);

            });

    </script>
</body>
</html>