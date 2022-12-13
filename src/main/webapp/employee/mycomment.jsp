<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
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
<%
	Employee loginEmployee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	if(loginEmployee == null) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}
	
	// 댓글 페이지 행 갯수, 요청할 페이지 번호를 조회한다.
	int rows = StringUtils.stringToInt(request.getParameter("row"), 5);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	CommentDao commentDao = new CommentDao();
	// 로그인한 직원번호를 commentDao의 getTotalCommentRowsByEmpNo 전달하고 totalPage를 반환받는다.
	int totalPage = commentDao.getTotalCommentRowsByEmpNo(loginEmployee.getNo());
	// Pagination 객체를 생성한다.
	Pagination pagination = new Pagination(currentPage, totalPage, rows);
	
	// Map 객체 생성 -> 객체를 담은 후 리스트로 CommentDao.getComments에 보낸다.
	Map<String, Object> param = new HashMap<>();
	param.put("empNo", loginEmployee.getNo());
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<Comment> commentList = commentDao.getComments(param);
%>
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
						<a href="mycomment.jsp" class="list-group-item list-group-item-action active">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="" class="list-group-item list-group-item-action">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<div class="card">
					<div class="card-header">내가 작성한 댓글을 확인하세요</div>
<%
	if(commentList.isEmpty()) {
%>
						<div class="card-body py-1 px-3 small border-bottom">
							<p class="card-text">작성한 댓글이 없습니다.</p>
						</div>
<%
	}
%>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">내용댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
						<!-- 댓글 반복 끝 -->
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">내용댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">내용댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">내용댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4">2022년 12월 10일</span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">내용댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.</p>
						</div>
					</div>		
				</div>
			</div>	
			<div class="row mb-3">
				<div class="col-12">	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item disabled">
								<a class="page-link">이전</a>
							</li>
							<li class="page-item"><a class="page-link active" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>