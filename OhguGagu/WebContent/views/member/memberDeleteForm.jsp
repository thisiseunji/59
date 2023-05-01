<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .deleteBox{
		width: 1000px;
		height: 100%;
		margin-left: 60px;
		margin-top: 60px;
	}
    .guidebox{
        border-top: 2px solid lightgray;
        width: 1000px;
        height: 100%;
        background-color: antiquewhite;
        padding: 20px;
    }
    .buttonbox{
        margin-top: 150px;
        text-align: center;
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
                <div class="deleteBox">
                    <h1 style="margin-bottom: 20px;">회원탈퇴</h1>
                    <div>
                        <div class="guidebox">
                            <h3>오구가구 탈퇴 안내</h3>
                            <p>
                               	 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br>
                                                                        아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
                                <br><br>
                                ● 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다.
                            </p>
                        </div>
                    </div>
                    <div class="buttonbox">
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">탈퇴하기</button>
                        <button type="button" class="btn btn-outline-danger">이전으로</button>
                    </div>
                </div>
            </div>
        </div>
        <footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
    </div>


    <!-- 회원탈퇴용 모달창 (부트스트랩) -->
    <!-- The Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" align="center">
                	
                	<b>
                		탈퇴 후 복구가 불가능합니다. <br>
                		정말로 탈퇴하시겠습니까? <br><br>
                	</b>
                	
                	<form action="<%= contextPath %>/delete.me" method="post">
                		<table>
                			<tr>
                				<td>비밀번호</td>
                				<td>
                					<input type="password" name="memberPwd" required>
                				</td>
                			</tr>
                		</table>
                		
                		<br>
                		
                		<button type="submit" class="btn btn-danger btn-block">탈퇴하기</button>
                	</form>
                	
                </div>
            </div>
        </div>
    </div>

</body>
</html>