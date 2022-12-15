<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="/web-community/resources/css/style.css" rel="stylesheet">
<title>사내 커뮤니티</title>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="login"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">로그인</h1>
		</div>
<%
	String error = request.getParameter("error");
%>

<%
	if ("fail".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong>아이디 혹은 비밀번호가 일치하지 않습니다.</strong> 
	</div>
<%
	} else if ("deny".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong> 로그인한 사용자만 이용가능합니다.</strong>
	</div>
<%
	}
%>
	</div>
	<div class="row mb-3">
		<div class="col-sm-6">
			<form id="form-login" class="border bg-light p-3" method="post" action="login.jsp">
				<div class="mb-3">
					<label class="form-label">직원번호</label>
					<input type="text" class="form-control" name="no"/>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password"/>
				</div>
				<div class="text-end">
					<a href="../home.jsp" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		
		$("#form-login").submit(function(event) {
			
			let no= $(":input[name=no]").val();
			if (no === '') {
				alert("직원번호는 필수입력값입니다.");
				return false;
			}
			let userPassword  = $(":input[name=password]").val();
			if (userPassword  === '') {
				alert("비밀번호는 필수입력값입니다.");
				return false;
			}
			
			return true;
		})
	})
</script>
</body>
</html>