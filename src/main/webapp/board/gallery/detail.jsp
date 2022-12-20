<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dto.GalleryDto"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.GalleryDao"%>
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
	<div class="row mb-1">
		<div class="col">
<%
	String errorCode = request.getParameter("error");

	if("deny".equals(errorCode)) {
%>
	<div class="alert alert-danger" role="alert">
			 <strong>이미 추천한 게시물입니다.</strong>
	</div>
<%
	} else if ("invalid".equals(errorCode)) {
%>
	<div class="alert alert-danger" role="alert">
		<strong>댓글 내용을 적어주세요</strong>
	</div>
<%
	}	
%>	
		</div>	
	</div>
</div>	
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">게시글 상세정보</h1>
<%
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String read = request.getParameter("read");

	GalleryDao galleryDao = GalleryDao.getInstance();
	GalleryDto galleryDto = galleryDao.getGalleryDtoByNo(no);
	
	// 조회수
	Gallery gallery = galleryDao.getPostByNo(no);
	gallery.setReadCount(gallery.getReadCount() +1);
	galleryDao.updatedPost(gallery);
%>			
		</div>
	</div>
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
						<td><%=galleryDto.getNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(galleryDto.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=galleryDto.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=galleryDto.getSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=galleryDto.getName() %> (<%=galleryDto.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=galleryDto.getDepartmentName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=galleryDto.getReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=galleryDto.getCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><%=galleryDto.getContent() %></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="row p-2 g-2">		
							<!-- 이미지 -->	
								<div class="col-4"><img src="../../resources/images/<%=galleryDto.getFileName() %>" class="img-thumbnail border-0"/></div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
<%
	if (employee != null && employee.getNo() == galleryDto.getWriterNo()) {
%>			
				<span>
					<a href="delete.jsp?postNo=<%=galleryDto.getNo() %>" class="btn btn-danger btn-xs">삭제</a>
					<a href="modifyform.jsp?no=<%=galleryDto.getNo() %>" class="btn btn-warning btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
				</span>
<%
	}

	if (employee != null && employee.getNo() != galleryDto.getWriterNo()) {
%>	
			
				<span class="float-end">
					<a href="suggestion.jsp?no=<%=galleryDto.getNo() %>" class="btn btn-outline-primary btn-xs">추천</a>
				</span>
<%
	}
%>								
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="insert-comment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=galleryDto.getNo() %>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button class="btn btn-secondary btn-xs">댓글</button>
					</div>
				</div>
			</form>
		</div>
<%

	CommentDao commentDao = new CommentDao();
	List<CommentDto> commentList = commentDao.getCommentsByPostNo(no);
	
	for (CommentDto commentDto : commentList) {
		int commentEmpNo = commentDto.getEmpNo();
 		
%>		
		<div class="col-12" >
			<div class="card">
				<!-- 댓글 반복 시작 -->
				<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
				 	<span><%=commentDto.getEmpName() %></span>
					<span><span class="me-4"><%=StringUtils.dateToText(commentDto.getCommentCreatedDate()) %></span> 
						<a href="delete-comment.jsp?no=<%=no %>&cno=<%=commentDto.getCommentNo() %>" class="text-danger">				
						<i class="bi bi-trash-fill"></i></a></span>			
					</div>
					<p class="card-text"><%=commentDto.getCommentContent() %></p>
				</div>				
			</div>
		</div>
<%
	}
%>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="modifyform.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="postNo" value="<%=galleryDto.getNo() %>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value="102"> 공지사항</option>
								<option value="103"> 파일게시판</option>
								<option value="104" selected="selected"> 갤러리</option>
								<option value="105"> 자유게시판</option>
								<option value="106"> 묻고 답하기</option>
								<option value="107"> 임시저장함</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" value="<%=galleryDto.getTitle() %>">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=galleryDto.getName() %>" name="empName">
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
							<textarea rows="5" class="form-control" name="content"><%=galleryDto.getContent() %></textarea>
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
$(function() {
	
	// 게시글 일반/중요 구현
	$(":input[name=important]").click(function() {
		
		$(":input[name=important]").change(function() {
			
			$(":input[value='N']").prop("checked", "");
			
			var $important = $(this).val();
			$(":input[name=important]").val($important);
		})

	})
	
})
</script>
</body>
</html>
