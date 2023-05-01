<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.ohgu.board.model.vo.Board, com.ohgu.common.model.vo.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>오구가구>마이페이지>1:1문의내역</title>
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
    .qbox {
		padding-left: 200px;
		width: 100%;
	}


    .textarea {
        width: 950.88px;
        height: 200px;
    }

    .buttondiv {
        position: absolute; 
        left: 273px; 
        top: 615.188px; 
        width: 700px; 
        height: 41px;
    }

    .div1 {
        position: absolute; top: 146.938px; 
        left: 157px; 
        width: 300px; 
        height: 48px;
    }

    .div1-1 {
        font-weight:bold;
        font-size:32px;
    }

    .deletearea {
        position: absolute; left: 146px; 
        top: 208px; width: 954px; 
        height: 210px;
    }

    .deletetop {
        border-top: 2px solid lightgray;
        position: absolute; top: 0px; 
        left: 0px; 
        width: 951.919px; 
        height: 20px;
    }
    
    .deletegroup {
        position: absolute; top: 10px; 
        left: 0px; width: 950.879px; 
        height: 200px;
    }
    .qbox {
		padding-left: 200px;
		width: 100%;
	}
    .boardList-area {
		width: 1000px;
		height: 100%;
		margin-left: 60px;
		margin-top: 60px;
	}
    .boardList-area table{
		width: 100%;
		height: 100%;
		text-align: center;
	}
	thead{
		background-color: #f2f2f2;
		height: 70px;
	}
	table tr {
		height: 50px;
		border-bottom: 1px solid #ccc;
	}
	table>tbody>tr:hover{
		background-color: #f2f2f2;
		cursor: pointer;
	}
	.paging-bar{
		width: 1000px;
		margin-left: 80px;
		margin-top: 30px;
	}
	.paging-bar button{
		border: 1px solid #ccc;
		background-color: #fff;
		padding: 5px 10px;
		margin: 0 5px;
		border-radius: 10px;
	}
	.paging-bar button:hover{
		background-color: #f2f2f2;
		cursor: pointer;
	}
</style>
</head>

<body>	
    <div class="outer">
        <header>
			<%@ include file="../common/menubar.jsp" %>
		</header>

        <div class="mainview">
            <div>
				<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
            <div class="qbox">
                <div class="boardList-area">
                    <h3 style="margin-bottom: 20px;">1:1 문의내역</h3>
                    <hr style="margin-bottom: 0;">
                    <div>
						<table>
							<thead>
								<tr>
									<td width="70">글번호</td>
									<td>제목</td>
									<td width="100">작성일</td>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="4">게시글이 존재하지 않습니다.</td>
									</tr>
								<%}else{ %>
									<% for(Board b : list){ %>
										<tr>
											<td><%= b.getOrderNo() %></td>
											<td><%= b.getBoardTitle() %></td>
											<td><%= b.getCreatedAt() %></td>
										</tr>
									<%} %>
								<%} %>
							</tbody>
						</table>
					</div>
                </div>
                
                <div align="center" class="paging-bar">
					<% for (int i = startPage; i <= endPage; i++){ %>
						<%if(i != currentPage){ %>
							<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=i%>';"><%= i %></button>
						<%}else{ %>
							<button disabled><%=i %></button>
						<%} %>
					<% } %>
                
            </div>
        </div>
        <footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
    </div>
</body>
</html>