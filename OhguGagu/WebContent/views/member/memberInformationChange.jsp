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

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <!-- jQuery -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
            
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
	
	/* 회원 정보 변경 페이지 스타일 */
	
	.member_info {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
}

.member_info label {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 5px;
}

.member_info input[type="text"], .member_info input[type="password"], .member_info select {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  font-size: 14px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.member_info button {
  padding: 10px 20px;
  margin-top: 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #333;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.member_info button:hover {
  background-color: #555;
}

div>form {
    margin-bottom: 30px;
    padding-left : 20%;
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
            < class="qbox">

            <form id="memberInfoForm" action="#" method="post">
                <div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" value="oosy123" readonly>
                </div>

                <div>
                  <label for="name">이름</label>
                  <input type="text" id="name" name="name" value="송민근" readonly>
                </div>

                <div>
                  <label for="email">이메일</label>
                  <input type="email" id="email" name="email" value="oosy123@naver.com" required>
                </div>
                <div>
                  <label for="password">비밀번호</label>
                  <input type="password" id="password" name="password" minlength="8" placeholder="비밀번호" required>
                </div>
                <div>
                  <label for="confirmPassword">비밀번호 확인</label>
                  <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" minlength="8" required>
                </div>
                <div>
                  <label for="phoneNumber">휴대폰번호</label>
                  <input type="tel" id="phoneNumber" name="phoneNumber" value="01047156398" required>
                </div>
                <div>
                  <label for="address">주소</label>
                  <input type="text" id="address1" name="address" placeholder="우편번호 입력" required> <br>
                  <input type="text" id="address2" name="address" placeholder="주소 입력" required> <br>
                  <input type="text" id="address3" name="address" placeholder="상세주소 입력" required>
                </div>
                <div style="text-align : center">
                    <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>'">취소</button>
                    <button type="submit" class="btn btn-danger">정보수정</button>
                </div>
            </form>
    
            </div> <!-- q박스 -->
        </div>
        <footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
    </div>
</body>
</html>