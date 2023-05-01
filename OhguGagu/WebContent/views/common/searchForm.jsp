<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- 온라인 방식 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div data-toggle="modal" data-target="#searchModal">Search</div>

    <!-- The Modal -->
    <div class="modal" id="loginModal">
        <div class="modal-dialog">
            <div class="modal-content">
    
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="/action_page.php">
                        <div class="form-group">
                          <label for="userId">ID:</label>
                          <input type="text" class="form-control" placeholder="Enter ID" id="userId">
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" class="form-control" placeholder="Enter password" id="pwd">
                        </div>
                        <div class="form-group form-check">
                          <label class="form-check-label">
                            <input class="form-check-input" type="checkbox"> Remember me
                          </label>
                        </div>
                    </form>
                </div>    
            </div>
        </div>
    </div>
</body>
</html>