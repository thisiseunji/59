<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구가구>고객센터>1:1문의</title>
<Style>
	.outer{
		position: relative;
		height : 1500px;
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
	.detailView{
		width: 500px;
		height: 100%;
		margin-left: 80px;
		margin-top: 50px;
	}
	.detailView table{
		width: 500px;
	}
	textarea{
		width: 400px;
		height: 200px;
	}
	.button-area{
		margin-top: 20px;
		width: 500px;
		text-align: center;
	}
	.modal-body img{
		width: 100px;
		height: 120px;
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
	
</Style>
</head>
<body>
	<div class="outer">
		<header>
			<%@ include file="../common/menubar.jsp" %>
		</header>
		<div class="mainview">
			<div>
				<%@ include file="../common/customerSidebar.jsp" %>
			</div>
			<div class="qbox">
				<div class="detailView">
					<h2 style="margin-bottom: 80px;">1:1 문의</h2>
					<form action="insert.bo" method="post">
						<input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>">
						<table style="height: 200px;">
							<tr>
								<td style="height: 20%; width: 100px;">주문번호</td>
								<td colspan="2"><input type="text" name="orderNo" value="" style="width: 310px;" id="q_orderNo"></td>
								<td><button type="button" class="btn btn-dark btn-sm" data-toggle="modal" data-target="#orderNoForm" onclick="orderNoSearch();">조회</button></td>
							</tr>
							<tr>
								<td></td>
								<td style="width: 120px; height: 80%;" id="q_fileName">사진</td>
								<td colspan="2" style="width: 70px;" id="q_productName">상품명</td>
							</tr>
						</table>
						<hr>                                                                                                          
						<table>
							<tr>
								<td style="width: 100px;">작성자</td>
								<td><input type="text" name="memberName" value="<%= loginUser.getMemberName() %>" style="width: 400px;"></td>
							</tr>
							<tr>
								<td>휴대전화</td>
								<td><input type="text" name="phone" value="<%= loginUser.getPhone() %>" style="width: 400px;"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" value="<%= loginUser.getEmail() %>" style="width: 400px;"></td>
							</tr>
						</table>
						<hr>
						<table>
							<tr>
								<td style="width: 100px;">제목</td>
								<td><input type="text" name="title" style="width: 400px;"></td>
							</tr>
							<tr>
								<td>문의내용</td>
								<td><textarea name="content" cols="30" rows="10" style="resize: none;"></textarea></td>
							</tr>
						</table>
						<div class="button-area">
							<button type="submit" class="btn btn-danger">등록</button>
							<button class="btn btn-outline-danger">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>

	<!-- The Modal -->
	<div class="modal" id="orderNoForm">
		<div class="modal-dialog modal-lg">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">주문번호 조회</h4>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body">
				<div align="center">
					<table style="width: 700px;">
						<thead align="center">
							<tr>
								<th colspan="3">상품정보</th>
								<th>주문번호</th>
								<th>주문일자</th>
							</tr>
						</thead>
						<tbody align="center">
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- Modal footer -->
			<div align="center" style="margin: 30px; border-top: 1px solid lightgray;">
			<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin:20px;">취소</button>
			<button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="margin:20px;">선택하기</button>
			</div>
	
		</div>
		</div>
	</div>
	
	<script>
		function orderNoSearch(){
			$.ajax({
				url : "orderNoSearch.do",
				type : "post",
				data : {
					memberNo : <%= loginUser.getMemberNo() %>
				},
				success : function(list){
					let result = "";
					
					for(let i in list){
						result += "<tr >"
									+ "<td><input type='radio' name='val'></td>"
									+ "<td><img src=" + list[i].fileName +"></td>"
									+ "<td>" + list[i].productName + "</td>"
									+ "<td>" + list[i].orderNo + "</td>"
									+ "<td>" + list[i].orderedAt + "</td>"
								+ "</tr>";
					}
					
					$(".modal-body tbody").html(result);


					$("#orderNoForm tbody>tr").on("click", "input[type=radio]", function() {

						let fileName = $(this).parent().siblings().eq(0).children().attr("src");
						let productName = $(this).parent().siblings().eq(1).text();
						let orderNo = $(this).parent().siblings().eq(2).text();
						let orderedAt = $(this).parent().siblings().eq(3).text();

						$("#q_productName").text(productName);
						$("#q_orderNo").val(orderNo);
						$("#q_fileName").html("<img style='width: 100px; height: 120px;' src=" + fileName + ">");
					});

				},
				error : function(){
					console.log("조회실패");
				}
			});
		}


	</script>
	
</body>
</html>