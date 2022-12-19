<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.PostDto"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
			<h1 class="heading">자유게시판</h1>
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
		
		<%
			Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
			int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
			int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1); 
			String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
			String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
					
			FreeDao freeDao = FreeDao.getInstance();
			
			Map <String,Object> param = new HashMap<>();
			if(!opt.isEmpty() && !keyword.isEmpty()) {
				param.put("opt", opt);
				param.put("keyword", keyword);
			}
			
			int totalRows = freeDao.getTotalRows(param);
			
			Pagination pagination = new Pagination(currentPage, totalRows, rows);
			
			param.put("begin", pagination.getBegin());
			param.put("end", pagination.getEnd());
					
			List<PostDto> postList = freeDao.getPosts(param);
		%>
		
		<div class="col-9"> 
			<div class="card">
				<div class="card-header">자유게시판 목록</div>
				<div class="card-body">
					<form id="form-board" class="mb-3" method="get" action="deletePost.jsp">
						<input type="hidden" name="page" value="<%=currentPage %>">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" name="rows">
									<option value="10" <%=rows == 10? "selected" : "" %>> 10</option>
									<option value="15" <%=rows == 15? "selected" : "" %>> 15</option>
									<option value="20" <%=rows == 20? "selected" : "" %>> 20</option>
								</select>
							</div>
				
							<div>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %>> 제목</option>
									<option value="content" <%="content".equals(opt) ? "selected" : "" %>> 내용</option>
									<option value="writer" <%="writer".equals(opt) ? "selected" : "" %>> 작성자</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value="<%=keyword %>">
								<button type="button" class="btn btn-outline-secondary btn-xs" id="btn-search">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="3%">
								<col width="9%">
								<col width="*">
								<col width="10%">
								<col width="12%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox" id="checkbox-all-toggle"></th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
					<%
						if (postList.isEmpty()) {
					%>
						<tr><td class="text-center" colspan="7"> 게시글 정보가 없습니다. </td></tr>
					<%		
						} else {
							for (PostDto post : postList) {
					%>
						<tr>
							<td><input type="checkbox" name="postNo" value="<%=post.getPostNo() %>"/></td>
							<td><%=post.getPostNo() %></td>
							<td><a href="detail.jsp?no=<%=post.getPostNo() %>&read=Y" class="text-decoration-none text-dark"><%=post.getPostTitle() %></a></td>
							<td><%=post.getEmpName() %></td>
							<td><%=StringUtils.dateToText(post.getPostCreatedDate()) %></td>
							<td><%=post.getPostReadCount() %></td>
							<td><%=post.getPostSuggestionCount() %></td>
						</tr>
					<%			
							}
						}
					%>	
							</tbody>
						</table>
					
					<%
						if (!postList.isEmpty()) {
							int beginPage = pagination.getBeginPage();   // 시작 페이지번호
							int endPage = pagination.getEndPage();       // 끝 페이지번호
							boolean isFirst = pagination.isFirst();      // 첫 페이지인지 여부, 이전버튼의 비활성화에서 사용
							boolean isLast = pagination.isLast();        // 마지막 페이지인지 여부, 다음 버튼의 비활성화에서 사용
							int prevPage = pagination.getPrevPage();     // 이전 페이지번호, 이전 버튼에서 사용
							int nextPage = pagination.getNextPage();     // 다음 페이지번호, 다음 버튼에서 사용
					%>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=isFirst ? "disabled" : "" %>" 
									href="list.jsp?page=<%=prevPage %>"
									data-page-no="<%=prevPage %>">이전</a>
							</li>
							<%
								for (int number = beginPage; number <= endPage; number++) {
							%>
							<li class="page-item">
								<a class="page-link <%=currentPage == number ? "active" : "" %>" 
								    href="list.jsp?page=<%=number %>" 
								    data-page-no="<%=number %>"><%=number %></a>
							</li>
							<%
								}
							%>	
							<li class="page-item">
								<a class="page-link <%=isLast ? "disabled" : "" %>" 
								   href="list.jsp?page=<%=nextPage %>"
								   data-page-no="<%=nextPage %>">다음</a>
							</li>
						</ul>
					</nav>
					<%
						} 
					%>
					<div class="text-end">
						<button type="button" class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">등록</button>
						<button type ="button" class="btn btn-outline-dark btn-xs" id="btn-delete">삭제</button>
					</div>
					</form>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="border p-3 bg-light" method="post" action="register.jsp">
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
							<input type="text" class="form-control form-control-sm" name="title" placeholder="제목">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=employee.getName()%>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" >
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
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary btn-xs">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	// 삭제버튼
	$("#btn-delete").click(function() {
		$("#form-board").attr("action", "deletePost.jsp").trigger("submit");
	});
	
	// 검색버튼 
	$("#btn-search").click(function() {
		var keyword = $("[name=keyword]").val();
		if (keyword == "") {
			alert("검색어를 입력하세요.");
			return false;
		}
		$("[name=page]").val(1);
		$("#form-board").attr("action", "list.jsp").trigger("submit");
	});
	
	// 행갯수 수정
	$("[name=rows]").change(function() {
		$("[name=page]").val(1);
		$("#form-board").attr("action", "list.jsp").trigger("submit");
	});
	
	// 페이지번호 클릭했을때
	$(".pagination a").click(function(event) {
		event.preventDefault();
		let pageNo = $(this).attr("data-page-no");
		
		$("[name=page]").val(pageNo);
		$("#form-board").attr("action", "list.jsp").trigger("submit");
	});
	
	// 체크박스 모두 선택
	$("#checkbox-all-toggle").change(function() {
		let allCheck = $(this).prop('checked');
		
		$(":input[name=postNo]").prop('checked', allCheck);
	})
	
})
</script>
</body>
</html>