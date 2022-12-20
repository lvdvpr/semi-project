<%@page import="com.community.vo.Board"%>
<%@page import="com.community.dao.BoardDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.AdminReadingDao"%>
<%@page import="com.community.dao.AdminCommentDao"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Reading"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dto.AdminCommentDto"%>
<%@page import="java.util.List"%>
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
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="admin"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">게시글 상세정보</h1>
		</div>
<%
	String error = request.getParameter("error");
%>

<%
	 if ("suggest".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong>이미 추천한 게시글입니다.</strong>
	</div>
<%
	}
%>
	</div>
<%
	
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String read = request.getParameter("read");
	Employee loginEmployee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	// 로그인한 사용자만 접근 가능
	if (loginEmployee==null) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}

	
	AdminPostDao postDao = AdminPostDao.getInstance();
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post = detailPost.getPost();
	if ("Y".equals(read)) {
	// 조회 수 증가시키기
	post.setReadCount(post.getReadCount()+1);
	postDao.updatePost(post);
	}
	// 열람 정보 추가하기
	AdminReadingDao readingDao = AdminReadingDao.getInstance();
	Reading reading = new Reading();
	reading.setEmpNo(loginEmployee.getNo());  
	reading.setPostNo(no);
	
	try {
		readingDao.insertReading(reading);
	} catch (Exception e) {
		
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
						<td><%=detailPost.getNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(detailPost.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=detailPost.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=detailPost.getSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=detailPost.getName() %> (<%=detailPost.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=detailPost.getDepartmentName()%></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=detailPost.getReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=detailPost.getCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0" aria-label="readonly input example" readonly><%=detailPost.getPostContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			
			
<% 
	if (loginEmployee!= null ) {
		if (loginEmployee.getNo()!=detailPost.getWriterNo()) {	 // 타인이 쓴 글 -- 추천,답변만 가능
%>
			<div class="d-flex justify-content-between">
				<span>
					<a href="delete_detail_post.jsp?no=<%=no %>" class="btn btn-danger btn-xs disabled" >삭제</a>
					<a href="post-modify.jsp?no=<%=no %>" class="btn btn-warning btn-xs disabled" data-bs-toggle="modal" data-bs-target="#modal-form-modify">수정</a>
				</span>
				<span>
					<a href="suggestion.jsp?no=<%=no%>" class="btn btn-outline-primary btn-xs ">추천</a>
					<button class="btn btn-outline-primary btn-xs  " data-bs-toggle="modal" data-bs-target="#modal-form-posts">답변</button>
				</span>
			</div>
<%
	} else if (loginEmployee.getNo()==detailPost.getWriterNo()) { // 자신이 쓴 글 - 추천,답변 불가 / 수정,삭제 가능
%>
		<div class="d-flex justify-content-between">
		
						<span>
							<a href="delete_detail_post.jsp?no=<%=no %>" class="btn btn-danger btn-xs" id="delete-comment" >삭제</a>
							<a href="post-modify.jsp?no=<%=no %>" class="btn btn-warning btn-xs " data-bs-toggle="modal" data-bs-target="#modal-form-modify">수정</a>
						</span>
						<span>
							<a href="suggestion.jsp?no=<%=no%>" class="btn btn-outline-primary btn-xs disabled">추천</a>
							<button class="btn btn-outline-primary btn-xs disabled " data-bs-toggle="modal" data-bs-target="#modal-form-posts">답변</button>
						</span>
					</div>
<%
		}
	}
%>
	
<!-- 답변글 시작 -->

<%
	List<AdminPostDto> answers = postDao.getDetailPostsAnswersByOriginalNo(no);
//	if (detailPost.getOriginalNo()!=null) {
		for (AdminPostDto dto : answers) {
			int answerNo = dto.getNo();
			if (no != answerNo) {
%>
         <table class="table table-sm table-bordered">
            <colgroup>
               <col width="15%">
               <col width="35%">
               <col width="15%">
               <col width="35%">
            </colgroup>
            <tbody>
               <tr>
                  <th class="text-center bg-light">작성자</th>
                  <td><%=dto.getName() %> (<%=dto.getPositionName() %>)</td>
                  <th class="text-center bg-light">등록일</th>
                  <td><%=StringUtils.dateToText(dto.getCreatedDate())%></td>
               </tr>
               <tr>
                  <th class="text-center bg-light">내용</th>
                  <td colspan="3">
                     <p class="fw-bold mb-1"><%=dto.getTitle() %></p>
                     <p><%=dto.getPostContent()%></p>
                  </td>
               </tr>
            </tbody>
         </table>
         <!-- 답변글 끝 -->
<%
			}
		}	
//	}	
%>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form id="form-comments" method="post" action="add_comment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="no" value="<%=no%>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button type="submit" id="add-comment"class="btn btn-secondary btn-xs">댓글</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-12">
			<div class="card">
				<!-- 댓글 반복 시작 -->
				<% 
				AdminCommentDao commentDao  = AdminCommentDao.getInstance();
					List<AdminCommentDto>commentList = commentDao.getCommentsByPostNo(no);

					for (AdminCommentDto comment : commentList) {
						
				%>
					<div class="card-body py-1 px-3 small border-bottom">
						<div class="mb-1 d-flex justify-content-between text-muted">
							<span><%=comment.getName() %></span>
							<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate())%></span> <a href="delete_comment.jsp?no=<%=post.getNo() %>&cno=<%=comment.getCno() %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
						</div>
						<p class="card-text"><%=comment.getContent() %></p>
					</div>
				<!-- 댓글 반복 끝 -->
				<%
						}
				%>
				
			</div>				
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="modal-form-modify">
	<div class="modal-dialog modal-lg">
	<form id="form-modify" class="border p-3 bg-light" method="post" action="post-modify.jsp">
		
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="no" value="<%=no%>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo" >
<%
	// comm_boards에서 모든 게시판 이름 조회 
	
	BoardDao boardDao = BoardDao.getInstance();
	List<Board> boardList = boardDao.getAllBoards();
	for (Board board : boardList) {
%>
								<option value="<%=board.getNo()%>" <%=board.getNo() == detailPost.getBoardNo() ? "selected" : "" %>> <%=board.getName() %></option>
<%
	}
%>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" value="<%=detailPost.getTitle() %>">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=detailPost.getName() %>" name="name">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" <%="N".equals(detailPost.getImportant()) ? "checked" : "" %>>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y" <%="Y".equals(detailPost.getImportant()) ? "checked" : "" %>>
								<label class="form-check-label">중요</label>
							</div>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">내용</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" name="content" id="modify-content"><%=detailPost.getPostContent() %></textarea>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs" id="button-modify">수정</button>
			</div>
		</div>
	</form>
	</div>
</div>



<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="reply.jsp" id="form-reply">
		
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="originalNo" value="<%=no%>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo" >
<%
	
	for (Board board : boardList) {
%>
								<option value="<%=board.getNo()%>" <%=board.getNo() == detailPost.getBoardNo() ? "selected" : ""  %>> <%=board.getName() %></option>
<%
	}
%>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" id="reply-title" >
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=loginEmployee.getName() %>" name="name">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" checked>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y" >
								<label class="form-check-label">중요</label>
							</div>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">내용</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" name="content" id="reply-content">답변을 등록하세요</textarea>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" id="button-reply" class="btn btn-primary btn-xs">답변</button>
			</div>
		</div>
	</form>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		// 댓글 내용이 없을 때 처리
		$("#form-comments").submit(function() {
		let $contentField = $(":input[name=content]").val();
			if ($contentField === "") {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				return true;
			}
			
		})
		// 수정폼의 제목과 내용 입력값이 없을 때 처리
		$("#form-modify").submit(function() {
			let $titleField = $(":input[name=title]").val();
			let $contentField = $("#modify-content").val();
			if ($titleField === "") {
				alert("제목을 입력해주세요.");
				return false;
			} else if 
				($contentField === "") {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				return true;
			}
		})
		// 답변 폼의 제목/내용 입력값이 없을 때 처리
		$("#form-reply").submit(function(event) {
			let $replyTitleField = $("#reply-title").val();
			let $replyContentField = $("#reply-content").val();
			if ($replyTitleField === "") {
				alert("제목을 입력해주세요.");
				return false;
			} else if ($replyContentField === "") {
				alert ("내용을 입력해주세요");
				return false;
			} else {
				return true;
			}
		})
		
		// 체크된 라디오버튼 값 전달하기
		$(":radio[name=important]").change(function() {
		let	$checkedImportant = $(this).val();
			$(":radio[name=important]").val($checkedImportant);
		})
		
		// 댓글 삭제시 null 처리
		$("a.text-danger").click(function() {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				return true;
			}
			else {
				return false;
			}
		})
		
		$("#delete-comment").click(function() {
			if (confirm("게시글을 삭제하시겠습니까?")) {
				return true;
			}
			else {
				return false;
			}
		})
		
		$("#delete-comment2").click(function() {
			if (confirm("게시글을 삭제하시겠습니까?")) {
				return true;
			}
			else {
				return false;
			}
		})
	})
		
</script>
</body>
</html>