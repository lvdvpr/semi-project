<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.dto.PostDto"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
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
<jsp:include page="../../common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">게시글 상세정보</h1>
		</div>
	</div>
	
	<%
		String error = request.getParameter("error");
	
		if ("suggest".equals(error)) {
	%>
		<div class="alert alert-danger">
			<strong>이미 추천된 게시글입니다.</strong> 
		</div>
	<%
		} 
	%>	
	
	<%
		Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		int postNo = StringUtils.stringToInt(request.getParameter("no"));
		String read = request.getParameter("read");

		FreeDao freeDao = FreeDao.getInstance();
		PostDto postDto = freeDao.getPostDtoByNo(postNo);
		
		FreeBoard freeBoard = postDto.getFreeBoard();
		
		if ("Y".equals(read)) {
			postDto.setPostReadCount(postDto.getPostReadCount() + 1);
			freeBoard.setReadCount(postDto.getPostReadCount());
			freeDao.updatePost(freeBoard);
		}
	%>
	
	<div class="row mb-3">
		<div class="col-12">
			<table class="table table-sm table-bordered">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center bg-light">번호</th>
						<td><%=postDto.getPostNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(postDto.getPostCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=postDto.getPostTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=postDto.getPostSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=postDto.getEmpName() %> (<%=postDto.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=postDto.getDepartmentName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=postDto.getPostReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=postDto.getPostCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0"><%=postDto.getPostContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			<div>
<%
	if (employee != null && postDto.getPostWriterNo() == employee.getNo()) {
%>
				<span>
					<a href="deletePost.jsp?postNo=<%=postDto.getPostNo() %>" class="btn btn-danger btn-xs">삭제</a>
					<button class="btn btn-warning btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</button>
				</span>
<%
	}
%>

<%
	if (employee != null && postDto.getPostWriterNo() != employee.getNo()) {
%>
				<span class='float-end'>
					<a href="addSuggestion.jsp?postNo=<%=postDto.getPostNo() %>&empNo=<%=postDto.getEmpNo() %>" class="btn btn-outline-primary btn-xs">추천</a>
				</span>
<%
	}
%>
			</div>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="addComment.jsp" onsubmit="return checkForm();">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=postNo %>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button type="submit" class="btn btn-secondary btn-xs">댓글</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class="col-12">
			<div class="card">
	<%
		CommentDao commentDao = new CommentDao();
	
		List<CommentDto> commentList = commentDao.getCommentsByPostNo(postNo);
		
		if (!commentList.isEmpty()) {
			for (CommentDto comment : commentList) {
	%>
			<div class="card-body py-1 px-3 small border-bottom">
				<div class="mb-1 d-flex justify-content-between text-muted">
					<span><%=comment.getEmpName() %></span>
					<span><span class="me-4"><%=StringUtils.dateToText(comment.getCommentCreatedDate()) %></span> <a href="delete-comment.jsp?no=<%=postNo %>&cno=<%=comment.getCommentNo() %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
				</div>
				<p class="card-text"><%=comment.getCommentContent() %></p>
			</div>
	<%			
			}
		}
	%>	
			</div>				
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="modify.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="postNo" value="<%=freeBoard.getNo() %>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value=""> 게시판을 선택하세요</option>
								<option value="102"> 공지사항</option>
								<option value="103"> 파일게시판</option>
								<option value="104"> 갤러리</option>
								<option value="105" selected="selected"> 자유게시판</option>
								<option value="106"> 묻고답하기</option>
								<option value="107"> 임시저장함</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" value="<%=freeBoard.getTitle() %>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" <%="N".equals(freeBoard.getImportant()) ? "checked" : "" %>>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y" <%="Y".equals(freeBoard.getImportant()) ? "checked" : "" %>>
								<label class="form-check-label">중요</label>
							</div>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">내용</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" name="content"><%=freeBoard.getContent() %></textarea>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">수정</button>
			</div>
		</div> 
	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript"> 
	function checkForm() {
		var commentContent = document.querySelector("[name=content]");
		
		if (commentContent.value === "") {
			alert("댓글이 입력되지 않았습니다.");
			commentContent.focus();
			return false;
		}
		return true;
	} 
</script>
</body>
</html>