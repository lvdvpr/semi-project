<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.MyPostDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	if (loginEmployee == null) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}
	// 행 갯수, 요청한 페이지 번호를 조회한다.
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	int empNo = StringUtils.stringToInt(request.getParameter("empNo"), loginEmployee.getNo());
	
	PostDao postDao = new PostDao();
	MyPostDto myPostDto = new MyPostDto();
	
	Map<String, Object> param = new HashMap<>();
	if(!opt.isEmpty() && !keyword.isEmpty()) {
		param.put("opt", opt);
		param.put("keyword", keyword);
		param.put("empNo", empNo);
	} else {
		param.put("empNo", empNo);
	}
	
	// 해당 loginEmployee.getNo() 사람이 작성한 게시글 갯수 조회
	int totalRows = postDao.getTotalPostRows(param);
	// Pagination 객체를 생성
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("empNo", loginEmployee.getNo());
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<MyPostDto> myPostDtoList = postDao.getPosts(param);
%>
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">내가 작성한 게시글 보기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">나의 메뉴</div>
				<div class="card-body">
					<div class="list-group">
						<a href="home.jsp" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="mypost.jsp" class="list-group-item list-group-item-action active">내가 작성한 게시글</a>
						<a href="mycomment.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
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
			<div class="card">
				<div class="card-header">내가 작성한 게시글</div>
				<div class="card-body">
					<form id="form-post" class="mb-3" method="get" action="mypost.jsp">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-s" name="rows">
									<option value="10" <%=rows == 10 ? "selected" : "" %> > 10개씩</option>
									<option value="15" <%=rows == 15 ? "selected" : "" %> > 15개씩</option>
									<option value="20" <%=rows == 20 ? "selected" : "" %> > 20개씩</option>
								</select>
								<input type="hidden" name="page" value="<%=currentPage %>" />
							</div>
							<div>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %>> 제목</option>
									<option value="content" <%="content".equals(opt) ? "selected" : "" %>> 내용</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value="<%=keyword %>">
								<button type="button" class="btn btn-outline-secondary btn-xs" id="btn-search">검색</button>
							</div>
						</div>	
						<table class="table table-sm border-top">
							<colgroup>
								<col width="9%">
								<col width="15%">
								<col width="*">
								<col width="8%">
								<col width="18%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="bg-light mb-3">
									<th>번호</th>
									<th>게시판명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
<%
	if(myPostDtoList.isEmpty()) {
%>

								<tr>
									<td colspan="6" class="text-center">등록한 게시글이 없습니다.</td>
								</tr>
<%
	} else {
		for (MyPostDto myDto : myPostDtoList) {
%>
								<tr>
									<td><%=myDto.getNo() %></td>
									<td><%=myDto.getBoardName() %></td>
									<td><a href="../board/detail.jsp?no=<%=myDto.getNo() %>" class="text-decoration-none text-dark"><%=myDto.getTitle() %></a></td>
									<td><%=myDto.getWriterName() %></td>
									<td><%=StringUtils.dateToText(myDto.getCreatedDate()) %></td>
									<td><%=myDto.getReadCount() %></td>
									<td><%=myDto.getSuggestionCount() %></td>
									<td>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
<%
		}
	}
%>
							</tbody>
						</table>
					</form>
<%
	if(!myPostDtoList.isEmpty()) {
%>
					<nav>
						<ul class="pagination pagination-sm justify-content-center"> 
							<li class="page-item">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : "" %>" 
									href="mypost.jsp?page=<%=pagination.getPrevPage() %>" data-page-no="<%=pagination.getPrevPage() %>">이전</a>
							</li>
<%
	for(int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
							<li class="page-item">
								<a class="page-link <%=currentPage == num ? "active" : "" %>" 
								href="mypost.jsp?page=<%=num %>" data-page-no="<%=num %>"><%=num %></a>
							</li>
<%
	}
%>
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disabled" : "" %>" 
									href="mypost.jsp?page=<%=pagination.getNextPage() %>" data-page-no="<%=pagination.getNextPage() %>">다음</a>
							</li>
						</ul>
					</nav>
<%
	}
%>
				</div>	
			</div>			
		 </div>				
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$("select[name=rows]").change(function(){
	$("[name=page]").val(1)
	$("#form-post").trigger("submit")
});

$(".pagination a").click(function(event) {
	event.preventDefault();
	var pageNo = $(this).attr("data-page-no");
	$("[name=page]").val(pageNo)
	$("#form-post").trigger("submit")
});

$("#btn-search").click(function() {
	var keyword = $("[name=keyword]").val();
	if (keyword == "") {
		alert("검색어를 입력하세요.");
		return false;
	}
	$("[name=page]").val(1)
	$("#form-post").trigger("submit")
})
</script>
</body>
</html>