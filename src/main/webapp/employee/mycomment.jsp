<%@page import="com.community.dto.MyCommentDto"%>
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
	MyCommentDto myCommentDto = new MyCommentDto();
	// 로그인한 직원번호를 commentDao의 getTotalCommentRowsByEmpNo 전달하고 totalPage를 반환받는다.
	int totalPage = commentDao.getTotalCommentRowsByEmpNo(loginEmployee.getNo());
	// Pagination 객체를 생성한다.
	Pagination pagination = new Pagination(currentPage, totalPage, rows);
	
	// Map 객체 생성 -> 객체를 담은 후 리스트로 CommentDao.getComments에 보낸다.
	Map<String, Object> param = new HashMap<>();
	param.put("empNo", loginEmployee.getNo());
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	 
	List<MyCommentDto> commentList = commentDao.getComments(param); 
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
	} else {
		for(MyCommentDto comment : commentList) {		
%>
						<form id="form-comment" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="mycomment.jsp">
						<input type="hidden" name="page" value="<%=currentPage %>" />
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="commentdelete.jsp?commentNo=<%=comment.getNo() %>&page=<%=currentPage %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text"><a href="../board/<%=comment.getMoveName() %>/detail.jsp?no=<%=comment.getPostNo() %>"><%=comment.getContent() %></a></p>
						</div>
						</form>
<%
		}
	}
%>
					</div>		
				</div>
			</div>	
<%
	if(!commentList.isEmpty()) {
%>
			<div class="row mb-3">
				<div class="col-12">	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : "" %>"
									href="mycomment.jsp?page=<%=pagination.getPrevPage() %>" data-page-no="<%=pagination.getPrevPage() %>">이전</a>
							</li>
<%
	for(int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
							<li class="page-item">
								<a class="page-link <%=currentPage == num ? "active" : "" %>" 
								href="mycomment.jsp?page=<%=num %>" data-page-no="<%=num %>"><%=num %></a>
							</li>
<%
		}
%>
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disabled" : "" %>" 
									href="mycomment.jsp?page=<%=pagination.getNextPage() %>" data-page-no="<%=pagination.getNextPage() %>">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
<%
	}
%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(".pagination a").click(function(event) {
	event.preventDefault();
	var pageNo = $(this).attr("data-page-no");
	$("[name=page]").val(pageNo)
	$("#form-comment").trigger("submit")
});
</script>
</body>
</html>