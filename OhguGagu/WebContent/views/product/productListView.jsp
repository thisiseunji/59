<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ohgu.common.model.vo.PageInfo, java.util.ArrayList, com.ohgu.product.model.vo.Product" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 상품</title>
    <style>
        /* reset.css 파일 : 속성 초기화 */
        * {box-sizing: border-box;}
        html, body, div,h1,h2,h3,h4,h5,h6, 
        p,div,em,sup,sub,code,hr,strong,span,q,blockquote,
        header,footer,aside,nav,article,section,figure,main,
        img,a,table,tr,td,th,thead,tbody,tfoot,
        ul,ol,li,dl,dt,dd,address,
        form,fieldset,legend,input,button,select,option,textarea, .order_by {
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

        /* css 속성 추가한부분 - 수정하면서 완성하기 */

		.outer {
			position: relative;
			height : 1000px;
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

        .items { 
            width: 390.33px;
            height: 260.21px;
            margin: 50px 180px 0 17px;
            display: inline-block;
            
        }
        .box {
            width: 100%;
            margin: 0 auto; 
        }
        #content_box .box .clear {
            height: 80px;
        }
        #content_box {
            padding-top: 80px;
        }
        .paging-area {
		width: 1000px;
		margin-left: 80px;
		margin-top: 30px;
	    }
        .paging-area button {
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 5px 10px;
            margin: 0 5px;
            border-radius: 10px;
        }
        .paging-area button:hover {
            background-color: #f2f2f2;
            cursor: pointer;
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

            <div style="margin-top: 100px; margin-left: 1200px;">
                <input class="order_by" type="checkbox">최신순
                <input class="order_by" type="checkbox">낮은 가격순
            </div>

		<div id="content_box">
	        <div class="box"> 
            	<div class="clear"></div>    
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image1.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image2.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image3.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image4.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image5.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image6.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image7.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image8.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>
                    <ul class="items" style="margin-bottom: 100px;">
                        <li><img src="img/image9.jpg"></li>
                        <li class="a">NST IVORY</li>
                        <li class="c">엔에스티 아이보리</li>
                        <li class="b">9,880원 <span>24%</span></li>
                        <li class="d">리뷰 <span>2</span> 평점 · <span>4.5/5</span></li>
                    </ul>            
                </div>
                <div align="center" class="paging-area">
					<% if(currentPage != 1) { %>
						<button onclick="location.href= '<%= contextPath %>/list.pr?currentPage=<%= currentPage-1 %>';">
							&lt;
						</button>
					<% } %>
					
					<% for(int p = startPage; p <= endPage; p++) { %>
					
						<% if(p != currentPage) { %>
							<button onclick="location.href= '<%= contextPath %>/list.pr?currentPage=<%= p %>';">
								<%= p %>
							</button>
						<% } else { %>
							<!-- 현재 내가 보고있는 페이지일 경우, 클릭이 안되게끔 막아두기 -->
							<button disabled><%= p %></button>
						<% } %>
						
					<% } %>
					
					<% if(currentPage != maxPage) { %>
						<button onclick="location.href= '<%= contextPath %>/list.pr?currentPage=<%= currentPage+1 %>';">
							&gt;
						</button>
					<% } %>
    		</div>
        </div>
            
        <footer>
            <%@ include file="../common/footer.jsp" %>
        </footer>
    </div>
	

</body>
</html>