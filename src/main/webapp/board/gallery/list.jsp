<%@page import="com.community.vo.Employee"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.dto.GalleryDto"%>
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
			<h1 class="heading">갤러리</h1>
<%
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	Map<String, Object> param = new HashMap<>();
	param.put("keyword", keyword);
	param.put("opt", opt);
	
	GalleryDao galleryDao = GalleryDao.getInstance();
	int totalRows = galleryDao.getTotalRows();
	
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<GalleryDto> galleryList = galleryDao.getAllGallery(param);
	
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
%>			
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">파일 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">파일 목록</div>
				<div class="card-body">
					<form id="post-list-submit"class="mb-3" method="get" action="list.jsp">
					<input type="hidden" name="page" value="<%=currentPage %>">
<!-- 여기 -->					<input type="hidden" name="checkboxPostNo">
 						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" name="rows">
									<option value="10" <%=rows == 10 ? "selected" : "" %>> 10</option>
									<option value="15" <%=rows == 15 ? "selected" : "" %>> 15</option>
									<option value="20" <%=rows == 20 ? "selected" : "" %>> 20</option>
								</select>
							</div>
							<div>
								<select class="form-select form-select-xs" name="opt">
									<option value="title <%="title".equals(opt) ? "selected" : "" %>" id="title"> 제목</option>
									<option value="empName" <%="empName".equals(opt) ? "selected" : "" %>id="empName"> 작성자</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value="<%=keyword %>">
								<button type="button" class="btn btn-outline-secondary btn-xs" id="search-form">검색</button>
							</div>
						</div>					
						<table class="table table-sm border-top">
							<colgroup>
								<col width="3%">
								<col width="9%">
								<col width="7%">
								<col width="*">
								<col width="10%">
								<col width="12%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox" id="all-checkbox"></th>
									<th>번호</th>
									<th><i class="bi bi-paperclip"></i></th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
<%
	for (GalleryDto galleryDto : galleryList) {
		
		if (employee != null && employee.getNo() == galleryDto.getEmpNo()) {
%>							
								<tr>
									<td><input type="checkbox" name="postCheckbox" value="<%=galleryDto.getNo() %>" />
								</td>
<%
		} else {
%>								
								<tr>
									<td><input type="checkbox" name="postCheckbox" value="<%=galleryDto.getNo() %>" disabled="disabled"/>
								</td>
<%
		}
%>								
									<td><%=galleryDto.getNo() %></td>
									<td><a href="download"><i class="bi bi-paperclip"></i></a></td>
									<td><a href="detail.jsp?no<%=galleryDto.getNo() %>" class="text-decoration-none text-dark"><%=galleryDto.getTitle() %></a></td>
									<td><%=galleryDto.getName() %></td>
									<td><%=StringUtils.dateToText(galleryDto.getCreatedDate()) %></td>
									<td><%=galleryDto.getReadCount() %></td>
								</tr> 
<%
	}
%>								
							</tbody>
						</table>
					</form>
<%
	if (!galleryList.isEmpty()) {
	int beginPage = pagination.getBeginPage();
	int endPage = pagination.getEndPage();
	int prevPage = pagination.getPrevPage();
	int nextPage = pagination.getNextPage();
	boolean isFirst = pagination.isFirst();
	boolean isLast = pagination.isLast();
%>					
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item disabled">
								<a class="page-link <%=isFirst ? "disabled" : "" %>" 
								href="list.jsp?page=<%=prevPage %>" data-post-no="<%=prevPage %>">이전</a>
							</li>
<%
	for (int number = beginPage; number <= endPage; number++) {
%>							
							<li class="page-item">
							<a class="page-link <%=currentPage == number ? "active" : "" %>" 
							href="list.jsp?page=<%=number %>" data-post-no="<%=number %>"><%=number %></a></li>
<%
	}
%>							
							<li class="page-item">
								<a class="page-link <%=isLast ? "disabled" : "" %>" 
								href="list.jsp?page=<%=nextPage %>" data-post-no="<%=nextPage %>">다음</a>
							</li>
						</ul>
					</nav>
<%
	}
%>					
					<div class="text-end">
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">등록</button>
						<button id="delete-button" class="btn btn-outline-dark btn-xs">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 등록폼 -->
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="border p-3 bg-light" method="post" action="insert-post.jsp">
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
							<input type="text" class="form-control form-control-sm" name="title" placeholder="제목">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" name="empName" readonly="readonly" value="홍길동">
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
							<textarea rows="5" class="form-control" name="content"></textarea>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
						<div class="col-sm-9 mb-1">
							<input type="file" class="form-control form-control-sm" name="fileName">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div>
		  	<!-- 	<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
						<div class="col-sm-9 mb-1">
							<input type="file" class="form-control form-control-sm" name="file">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div> -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">등록</button>
			</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- (여기) checkboxCheck하면 postNo넘어가게 구현 -->
<form id="form-tag" method="get" action="delete.jsp">
	<input type="hidden" name="postNo">
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	// 페이지 넘어가도 5, 10, 15 유지 되게 구현
	$("select[name=rows]").change(function() {
		
		$(":input[name=page]").val(1);
		$("#post-list-submit").trigger('submit');
	})
	
	// 2page 누르면 값 전달되게 구현
	$(".pagination a").click(function(event) {
		event.preventDefault();
		
		var $pageNo = $(this).attr("data-post-no");
		$(":input[name=page]").val($pageNo);
		
		$("#post-list-submit").trigger('submit');
	})
	
	// 검색어 없으면 alert
	$("#search-form").click(function() {
		
		var keyword = $(":input[name=keyword]").val();
		
		if (keyword == "") {
			alert("검색어를 입력하세요");
			return false;
		}
	})
	
	// all-check 구현
	$("#all-checkbox").change(function() {
		let $allCheck = $(this).prop('checked');
		
		$(":input[name=postCheckbox]").prop("checked", $allCheck);
		
	})
	
	$(":input[name=postCheckbox]").change(function() {
	let $CheckboxChecked = $(":input[name=postCheckbox]:checked").length;
	let $CheckboxNotChecked = $(":input[name=postCheckbox]").length;
		
		if($CheckboxChecked == $CheckboxNotChecked) {
			$("#all-checkbox").prop("checked", true);
		} else {
			$("#all-checkbox").prop("checked", false);
		}
	})
	
	// important 구현
	$(":input[name=important]").change(function() {
		
		var $checkImportant = $(this).val();
		
		$(":input[name=important]").val($checkImportant);
	})
	
	// 삭제하기 구현
	$("#delete-button").click(function() {
		
		let $deletedCheckboxs = $(":input[name=postCheckbox]:checked").val();
		if($deletedCheckboxs.lengh == 0) {
			alert("지정된 게시글이 없습니다");
			return;
		}
		
		let postNo = $deletedCheckboxs.val();
		let $form = ("#form-tag");
		for (var indect = 0; index <$deletedCheckboxs.length; index++) {
			var el = $deletedCheckboxs[index];
			var postNo = $(el).val();
			var inputPostNo = "<input type='hidden' name='postNo' value='"+postNo+"'>";
			
			$form.append(inputPostNo);
		}
		
		$form.trigger('submit');
		
	})
	
})
</script>
</body>
</html>