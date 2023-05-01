<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ohgu.board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지>문의글 상세조회</title>
<style>
	.outer{
        width: 100%;
        height: auto;
		min-height: 100%;
    }
	.left{
		width: 200px;
	}
	.footer{
		height: 100%;
		position: relative;
	}
	.box{
		display: grid;
		grid-template-columns: 200px auto;
		margin: 0;
	}
	#boardTable{
		width: 700px;
		margin-left: 80px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	#boardTable div{
		width: 100%;
		height: 100%;
		border: 1px solid #ccc;
	}
</style>
</head>
<body>
    <div class="outer">
        <div class="header">
			<%@ include file="../common/menubar.jsp" %>
		</div>
		<div class="box">
			<div class="left">
				<%@ include file="../common/adminPageSidebar.jsp" %>
			</div>
			<div>
				<div style="margin-left: 80px; margin-top: 30px;">
					<h1>1:1 문의</h1>
				</div>
				<div>
					<table id="boardTable">
						<tr>
							<td></td>
							<td>문의번호 : <%=b.getBoardNo()%></td>
							<td>주문번호 : <%=b.getOrderNo()%></td>
							<td>주문자명 : <%=b.getMemberName()%></td>
							<td width="200">제품명 : <%=b.getProductName()%></td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3"><%=b.getBoardTitle()%></td>
							<td>작성날짜 : <%=b.getCreatedAt()%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="4"><div width="100%"><%=b.getBoardContent()%></div></td>
						</tr>
						<tr>
							<td>답변내용</td>
							<%if(b.getAnswer() == null){ %>
								<td colspan="4"><textarea id="answer1" style="width: 100%; height: 150px; resize: none;" readonly></textarea></td>
							<%}else{ %>
								<td colspan="4"><textarea id="answer1" style="width: 100%; height: 150px; resize: none;" readonly><%=b.getAnswer()%></textarea></td>
							<%} %>
						</tr>
						<tr>
							<td>답변</td>
							<td colspan="4">
								<div style="display: grid; grid-template-columns: auto 50px;">
									<div>
										<textarea id="answer2" style="width: 100%; height: 150px; resize: none;"></textarea>
									</div>							
									<button type="button" class="btn btn-danger" onclick="answer();">등록</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>      
    </div>
    <div class="footer" style="width: 100%;">
    	<%@ include file="../common/footer.jsp" %>
    </div>

	<script>
		function answer(){
			let answer = $("#answer2").val();
			$.ajax({
				url : "answer.do",
				type : "post",
				data : {
					boardNo : <%=b.getBoardNo()%>,
					answer : $("#answer2").val()
				},
				success : function(result){
					if(result == 1){
						alert("답변 등록 성공");
						$("#answer1").val(answer);
					}else{
						alert("답변 등록 실패");
					}
					$("#answer2").val("");
				},
				error : function(){
					console.log("답변 등록 실패");
				}
			});
		}
	</script>

</body>
</html>