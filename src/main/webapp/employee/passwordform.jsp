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
	<jsp:param name="menu" value="employee"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">내 정보 보기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">나의 메뉴</div>
				<div class="card-body">
					<div class="list-group">
						<a href="home.jsp" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="mypost.jsp" class="list-group-item list-group-item-action">내가 작성한 게시글</a>
						<a href="mycomment.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="" class="list-group-item list-group-item-action active">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>비밀번호를 변경하세요.</p>
		<%
			String error = request.getParameter("error");
		
			if("fail".equals(error)) { 
		%>			
					<div class="alert alert-danger">
						<strong>비밀번호 변경 실패</strong> 비밀번호가 일치하지 않거나 유효한 비밀번호가 아닙니다.
					</div>
		<%
			} 
		%>		
		
		<% 
			if ("fail2".equals(error)) {
		%>
				<div class="alert alert-danger">
				<strong>비밀번호 변경 실패</strong> 이전 비밀번호와 동일한 비밀번호로 변경할 수 없습니다.
				</div>
		<% 		
			}
		%>			
		
					<form class="border p-3 bg-light" method="post" action="password-change.jsp" onsubmit="return checkForm();">
						<div class="mb-3">
							<label class="form-label">이전 비밀번호</label>
							<input type="password" class="form-control" name="prevPassword" />
						</div>
						<div class="mb-3">
							<label class="form-label">새 비밀번호</label>
							<input type="password" class="form-control" name="password" />
						</div>
						<div class="mb-3">
							<label class="form-label">새 비밀번호 확인</label>
							<input type="password" class="form-control" name="password2" />
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-primary btn-sm">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkForm() {
		var prevPasswordField = document.querySelector("[name=prevPassword]");
		var passwordField = document.querySelector("[name=password]");
		var passwordField2 = document.querySelector("[name=password2]");
		
		if (prevPasswordField.value === "") {
			alert("이전 비밀번호는 필수입력값입니다.");
			prevPasswordField.focus();
			return false;
		}
		if (passwordField.value === "") {
			alert("새 비밀번호는 필수입력값입니다.");
			passwordField.focus();
			return false;
		}
		if (passwordField2.value === "") {
			alert("새 비밀번호 확인은 필수입력값입니다.");
			passwordField2.focus();
			return false;
		}
		if (passwordField.value != passwordField2.value) {
			alert("새 비밀번호가 동일하지 않습니다.");
			passwordField.focus();
			passwordField2.focus();
			return false;
		} 	
		return true;
	}
</script>
</body>
</html>