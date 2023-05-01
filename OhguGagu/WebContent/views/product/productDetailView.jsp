<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ohgu.product.model.vo.Product"%>
<%
	Product p = new Product(
			 4
		     , "침대"
		     , "흰색철제침대"
		     , 200000
		     , 30
		     , "WHITE"
		     , "100*1000*100"
		     , "STEEL"
		     , null
		     , 10
		     );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매하는 상품 상세페이지</title>
    <style>
        /* reset.css 파일 : 속성 초기화 */
        * {box-sizing: border-box;}
        html, body, div,h1,h2,h3,h4,h5,h6, 
        p,div,em,sup,sub,code,hr,strong,span,q,blockquote,
        header,footer,aside,nav,article,section,figure,main,
        img,a,table,tr,td,th,thead,tbody,tfoot,
        ul,ol,li,dl,dt,dd,address,
        form,fieldset,legend,input,button,select,option,textarea {
            margin: 0; padding: 0;
            font-size: 1.0rem; font-weight: normal; font-style: normal;
            line-height: 1.0; font-family: 'Noto Sans KR' sans-serif;
        }
        /* legend {display: none;} 숨김 */
        /* select {border: 0;} */
        ul, ol, li {list-style: none;}
        table,tr,th,td {border-collapse:collapse;}
        th {text-align: left;}
        a {color: #000; text-decoration: none;}
        textarea {resize: none;}
        fieldset {border: 0;}
        input, button {border: 0; background: none; cursor: pointer;}
        .skip {display: none;}


        /* design.css 파일 */
        #order_wrap {
            width: 1000px; margin: 0 auto;
            display: flex; flex-flow: row nowrap; /* 수평, 줄바꿈안함 */
            justify-content: space-around; /* 양쪽끝이 떨어진 상태로 좌우로 배치 */
            /* justify-content: space-between; */
        }
        #order_wrap .left {width: 500px;}
        #order_wrap .left img {width: 100%; padding: 15px 0;}
        #order_wrap .right {width: calc(100% - 550px);}
        #order_wrap .right .top {}
        #order_wrap .right .top h1 {font-size: 1.3rem; padding: 20px 0;}
        #order_wrap .right .top > p:nth-child(2) {
            color: #aaa; margin-bottom: 10px; padding-bottom: 10px;
            border-bottom: 1px solid #dadada;
        }
        #order_wrap .right .top dl {
            display: flex; flex-flow:row wrap;
        }
        #order_wrap .right .top dl dt {width: 30%;}
        #order_wrap .right .top dl dd {width: 70%;}
        #order_wrap .right .top dl dt, #order_wrap .right .top dl dd {padding: 10px 0;}
        #order_wrap .right .top dl dd.price {font-weight: 700;}
        #order_wrap .right .top .number {
            display: flex; flex-flow: row nowrap;
            justify-content: space-between;  /* 양쪽 끝으로 배치 */
            align-items: center; padding: 10px 0; margin: 10px 0; 
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
        }
        #order_wrap .right .top .number .order_name {}
        #order_wrap .right .top .number .order_number {}
        #order_wrap .right .top .number .order_number input[name=num] {
            background: #fff; width: 50px; padding: 5px;
            border: 1px solid #ddd;
        }
        #order_wrap .right .top .number .order_number .number_price {}
        #order_wrap .right .top .total_price {
            display: flex; flex-flow:row nowrap;
            justify-content: space-between; /* 양쪽 끝으로 배치 */
            padding: 20px 0;
        }
        #order_wrap .right .top .total_price p {}
        #order_wrap .right .top .total_price p:nth-child(1) {}
        #order_wrap .right .top .total_price .result_price {color: #cc0202; font-size: 1.2rem;}
        #order_wrap .right .bottom {
            
            text-align: right; padding: 20px 0;
        }
        #order_wrap .right .bottom button {
            padding: 15px 0;
        }
        #order_wrap .right .bottom #order_btn {width: 150px; background: #cc0202; color: #fff}
        #order_wrap .right .bottom #cart_btn {width: 120px; background: #a9a9a9; color: #fff;}
        #order_wrap .right .bottom #like_btn {width: 100px; background: #ddd;}




        /* css 속성 추가한부분 - 수정하면서 완성하기 */

         * {
            /* margin: 0; */
            /* padding: 0; */
        }
        body {
            color: #444444; 
        }
        li {
            list-style: none;
        }
        .clear {
            /* clear: both;  */
        }

        .items img {
            width: 1030px;
            height: 686px;
            margin-left: 145px;
            margin-right: 145px;
        }
        .box {
            width: 1320px;
            margin: 0 auto; 
        }
        #content_box .box .clear {
            height: 80px;
        }
        #content_box {
            padding-top: 80px;
        }
        /* #content_box h3 {
            float: left;
            margin-left: 600px;
        } */
        /* #content_box p {
            float: right;
        } */
        .items { 
            /* width: 1030px;  */
            /* float: left; */
            /* margin: 50px 180px 0 17px; */
        }

        footer {
            /* width: 1,338.87px; */
            /* clear: both; */
        }
       
        /*
        .items .a {
            font-weight: bold;
            color: black;
            margin-top: 20px;
        }
        .items .b { 
            font-weight: bold;
            color: black;
            margin-top: 8px;
        }
        .items .b span { 
            color: #a26f59;
        }
        .items .c { 
            font-size: 12px;
            margin-top: 20px;
        }
        .items .d { 
            font-size: 12px;
            margin-top: 25px;
        }
        .items .d span {
            color: #a26f59;
        }
        */
        
        /* 탭메뉴 */
        /* body { padding: 30px; } */
        .tab_type1 { padding: 30px;}
        * { padding: 0; margin: 0; list-style: none;}
        .tab_type1 ul {display: flex; height: 60px; border-bottom: 1px solid #CA4444;} 
        .tab_type1 ul li {flex: 1; }  
        .tab_type1 ul li:first-child a {border-left: 1px solid #ddd;}
        .tab_type1 ul li a {display: block; height: 59px; border: 1px solid #ddd; 
            border-left: none; border-bottom: none; font-size: 14px; color: #505050; 
            text-align: center; line-height: 59px; text-decoration: none;} 
        .tab_type1 ul li a.on {position: relative; height: 58px; border-color: #CA4444; border-top-width: 2px; line-height: 57px; border-bottom: 1px solid #fff;}
        .tab_type1 ul li a.on:before { content: ""; position: absolute; left: -1px; top: -2px; width: 1px; height: 100%; background: #CA4444; border-top: 2px solid #CA4444;} 
    
    
        /* 상품후기 CSS */
        .review_qna {
            width : 1320px;
            margin : auto;
            padding-left : 141px;
        }

        .review_box {
            margin-bottom: 120px;
        }
        .board_top {
            display: flex; flex-flow: row nowrap;
            justify-content: space-between; 
            align-items: center; padding: 10px 0; margin: 10px 0; 
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
            width: 1040.89px;
            margin-bottom: 30px;
        }
        .board_top h3 {
            font-size: 24px;
            color: #2E2624;
            font-weight: 500;
        }
        .board_top h3 span {
            color: #505050;
            opacity: 0.5;
        }          
        .board_top .txt {
            margin-left: 80px;
        }
        .btn_reviews_box { }
        #review-list { 
            width: 1040.89px; 
            border-bottom: 1px solid #ddd; 
            padding-bottom: 10px;
        }
        .reviews_table>tbody>tr>td {
            text-align: center;
            color: #505050;
        }

        /* 상품문의 CSS */
        .qna_box {
            margin-bottom: 120px;
        }
        .qna_content .board_top {
            display: flex; flex-flow: row nowrap;
            justify-content: space-between; 
            align-items: center; padding: 10px 0; margin: 10px 0; 
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
            width: 1040.89px;
            margin-bottom: 30px;
        }
        .qna_content .board_top h3 span {
            color: #505050;
            opacity: 0.5;
        }          
        .qna_content .board_top .txt {
            margin-left: 0 0 0 80px;
        }
        .qna_table { 
            width: 1040.89px; 
            /* border-bottom: 1px solid #ddd;  */
            padding-bottom: 10px;
        }
        .qna_table>tbody>tr>td {
            text-align: center;
            color: #505050;
        }
        .qna_content {
            height: 143.33px;
            border-bottom: 1px solid #ddd; 
        }

        
        
    </style>
</head>

<body>
    <div class="outer">
        <header>
            <%@ include file="../common/mainSidebar.jsp" %>
        </header>
        
        <div class="mainview">
            <div>
                <%@ include file="../common/menubar.jsp" %>
            </div>

            <main id="order_wrap">
                <div class="left">
                    <img src="https://www.pngarts.com/files/7/Modern-Furniture-PNG-Pic.png"> 
                    <!-- <img src="https://cdn-pro-web-151-250.cdn-nhncommerce.com/younhyun_godomall_com/data/goods/23/03/12/1000002833/1000002833_detail_090.jpg"> -->
                </div>
                <div class="right">
                    <div class="top">
                        <h1 id="title">SILKY STONE <span style="font-size: medium; color: #868686;">GREIGE</span></h1>
                        <p>실키 스톤 그레이지</p>
                        <dl>
                            <dt>판매가격</dt>
                            <dd class="price">3,000원</dd>
                            <dt>적립금</dt>
                            <dd>1%</dd>
                            <dt>원산지</dt>
                            <dd>대한민국</dd>
                        </dl>
                        <div class="number">
                            <p class="order_name">앵무새 인테리어 포스터(1번/썬코발)</p>
                            <div class="order_number">
                                <input type="number" name="num" id="num" value="1">
                                <span class="number_price">3,000원</span>
                            </div>
                        </div>
                        <div class="total_price">
                            <p>총 상품 금액</p>
                            <p class="result_price">3,000원</p>
                        </div>
                    </div>
                    <div class="bottom">
                        <button type="button" id="order_btn">주문하기</button>
                        <button type="button" id="cart_btn" onclick="updateCart();">장바구니</button>
                        <button type="button" id="like_btn">찜하기</button>
                    </div>
                </div>
            </main>

			<section id="content_box">
		        <div class="box">
		            <nav class="tab_type1">
		                <ul>
		                    <li><a href="#a">제품소개</a></li>
		                    <li><a href="#a" class="on">상세정보</a></li>
		                    <li><a href="#a" >유의사항</a></li>
		                    <li><a href="#a" >고객후기/문의</a></li>
		                </ul>
		            </nav>  
		            <div class="clear"></div>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image1.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image2.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image3.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image4.jpg"></li>
		            </ul>
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/subscribe.png"></li>
		            </ul>
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img style="width: 700px; margin-left: 310px;" src="<%=contextPath %>/resources/image/subscribe2.png"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image5.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image6.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image7.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image8.jpg"></li>
		            </ul>
		
		            <ul class="items" style="margin-bottom: 100px;">
		                <li><img src="<%=contextPath %>/resources/image/image9.jpg"></li>
		            </ul>
		            
		        </div>

    		</section>

            <div class="review_qna">
                <!-- 상품후기 -->
                <div class="review_box">
        
                    <div class="reviews_content">
                        <div class="board_top">
                            <h3>상품후기 <span>0</span></h3>
                            <p class="txt">
                                상품과 직접 관련이 없는 내용은 동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
                                배송, 구매 관련 내용은 고객센터 해당 게시판을 이용해주세요.							
                            </p>
                            <div class="btn_reviews_box">
                                <a href="../board/list.php?bdId=goodsreview" class="btn btn-outline-dark">전체보기</a>
                                <a href="javascript:gd_open_write_popup('goodsreview', '1000002833')" class="btn_reviews_write btn btn-dark">후기작성</a>
                            </div>
        
        
                        </div>
                        <div id="review-list">
                            <div class="reviews_detail">
                                <table class="reviews_table">
                                    <colgroup>
                                        <col width="13%">
                                        <col>
                                        <col width="100%">
                                        <col width="13%">
                                    </colgroup>
                                    <thead style="display: none;">
                                        <tr>
                                            <th>평점</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="4" class="no_data">등록된 상품후기가 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination"><ul></ul></div>
                        </div>
                    </div>
                </div>
                <!-- // 상품후기 -->

                <!-- 상품문의 -->
                <div class="qna_box">
                    <div class="qna_content">
                        <div class="board_top">
                            <h3>상품문의 <span>0</span></h3>
                            <div class="btn_qna_box">
                                <a href="../board/list.php?bdId=goodsqa" class="btn btn-outline-dark">전체보기</a>
                                <a href="javascript:gd_open_write_popup('goodsqa', '1000002833')" class="btn btn-dark">문의작성</a>
                            </div>
                        </div>
    
                        <div id="qna_list">
                            <div class="qna_detail">
                                <table class="qna_table">
                                    <colgroup>
                                        <col width="13%">
                                        <col>
                                        <col width="100%">
                                        <col width="13%">
                                    </colgroup>
                                    <thead style="display: none;">
                                        <tr>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>진행상황</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="no_data" colspan="5">등록된 상품후기가 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination"><ul></ul></div>
                        </div>
                    </div>
                    <!-- // 상품문의 -->
                </div>

            </div>

	        <footer>
	            <%@ include file="../common/footer.jsp" %>
	        </footer>
	    </div>
	</div>
	<!-- 
		cart insert/update 용 함수 작성 
		product 정보가 변수 p에 담겨있다고 가정
		p.getProductNo();
	 -->
	<script>
		function updateCart() {
			$.ajax({
				url : "<%= contextPath %>/update.cart",
				type : "post",
				data : {
					amount : $("#num").val(),
					productNo : <%=p.getProductNo()%>
				},
				success : function(result) {
					if(result > 0) { // 업데이트 성공
						alert("장바구니에 추가되었습니다.");
					} else {
						insertCart();
					}
				},
				error : function() {
					console.log("장바구니 update ajax 통신 실패");
				}
			});
		}
		
		function insertCart() {
			$.ajax({
				url : "<%= contextPath %>/insert.cart",
				type : "post",
				data : {
					amount : $("#num").val(),
					productNo : <%=p.getProductNo()%>
				},
				success: function(result) {
					if (result > 0) {
						alert("장바구니에 추가 되었습니다.");
					} else{
						alert("장바구니에 추가 실패");
					}
				},
				error : function() {
					console.log("장바구니 insert ajax 통신 실패");
				}
			});	
		}
	</script>

</body>
</html>