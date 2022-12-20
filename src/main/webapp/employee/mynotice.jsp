<%@page import="com.community.dto.MyNoticeDto"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.catalina.tribes.transport.nio.ParallelNioSender"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.NoticeDao"%>
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
	// loginEmployee 정보를 조회해 null값이면 "/web-community/employee/loginform.jsp?error=deny"로 로그인 페이지를 반환한다.
	Employee loginEmployee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	if(loginEmployee == null) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}
	
	// 행 갯수, 요청한 페이지 번호
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	NoticeDao noticeDao = new NoticeDao();
	MyNoticeDto myNoticeDto = new MyNoticeDto();
	
	// 해당 loginEmployee.getNo() 사람에게 온 알람의 갯수 조회
	int totalRows = noticeDao.getTotalNoticeRows(loginEmployee.getNo());
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	Map<String, Object> param = new HashMap<>();
	param.put("empNo", loginEmployee.getNo());
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<MyNoticeDto> noticeList = noticeDao.getNotices(param);
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
						<a href="mycomment.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action active">나에게 온 알림</a>
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
				<div class="card-header">나에게 온 알림을 확인하세요</div>
				<div class="card-body">
					<form id="form-notice" class="mb-3" method="get" action="mynotice.jsp">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-s" name="rows">
									<option value="10" <%=rows == 10 ? "selected"	: "" %>>10개씩</option>
									<option value="15" <%=rows == 15 ? "selected"	: "" %>>15개씩</option>
								</select>
								<input	type="hidden" name="page" value="<%=currentPage %>" />
							</div>
						</div>
						<table class="table table-sm border-top" id="table-notice-list">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th>번호</th>
									<th>보낸 사람</th>
									<th>보낸 날짜</th>
									<th>상태</th>
									<th>읽은 날짜</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
<%
	if(noticeList.isEmpty()) {
%>
								<tr>
									<td colspan="6" class="text-center">나에게 온 알람이 없습니다.</td>
								</tr>
<%
	} else {
		for(MyNoticeDto myDto : noticeList) {
%>
								<tr>
									<td class="border-bottom-0"><%=myDto.getNo() %></td>
									<td class="border-bottom-0"><%=myDto.getSendEmpName() %></td>
									<td class="border-bottom-0"><%=StringUtils.dateToText(myDto.getCreatedDate()) %></td>
									<td class="border-bottom-0"><%=myDto.getReadingStatus().equals("Y") ? "읽음" : "안읽음" %></td>
									<td class="border-bottom-0"><%=StringUtils.dateToText(myDto.getUpdatedDate()) %></td>
									<td class="border-bottom-0 pt-2">
										<button data-notice-no="<%=myDto.getNo() %>" class="btn btn-outline-secondary btn-xs <%="Y".equals(myDto.getReadingStatus()) ? "disabled" : ""%>">확인</button> 
										<a href="noticedelete.jsp?noticeNo=<%=myDto.getNo() %>&rows=<%=rows %>&page=<%=currentPage %>" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
								<tr>
									<td colspan="6" class="small ps-5 py-2">
										<a href="../board/<%=myDto.getMoveName() %>/detail.jsp?no=<%=myDto.getPostNo() %>"><%=myDto.getPostNo() %>번 게시글</a>에 <strong><%=myDto.getSendEmpName() %></strong>님이 댓글을 달았습니다.
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
	if(!noticeList.isEmpty()) {
%>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : "" %>"
									href="mynotice.jsp?page=<%=pagination.getPrevPage() %>" data-page-no="<%=pagination.getPrevPage() %>">이전</a>
							</li>
<%
		for(int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
							<li class="page-item">
								<a class="page-link <%=currentPage == num ? "active" : "" %>" 
									href="mynotice.jsp?page=<%=num %>" data-page-no="<%=num %>"><%=num %></a>
							</li>
<%
		}
%>
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disabled" : "" %>" 
									href="mynotice.jsp?page=<%=pagination.getNextPage() %>" data-page-no="<%=pagination.getNextPage() %>">다음</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$("select[name=rows]").change(function(){
	$("[name=page]").val(1)
	$("#form-notice").trigger("submit")
});

$(".pagination a").click(function(event){
	event.preventDefault();
	var pageNo = $(this).attr("data-page-no");
	$("[name=page]").val(pageNo)
	$("#form-notice").trigger("submit")
});

$("#btn-check").click(function(event) {
	event.preventDefault();
	var pageNo = $(this).attr("data-page-no");
	$("[name=page]").val(pageNo);
	$("#form-notice").trigger("submit")
})


$("#table-notice-list .btn[data-notice-no]").click(function() {
	var noticeNo = $(this).attr("data-notice-no");
	var $btn = $(this);
	
	var $tr = $(this).closest("tr");
	$.getJSON("noticecheck.jsp", {noticeNo: noticeNo}, function(notice) {
		/*
			notice - {no:10022, readingStatus:'Y', updatedDate:'2022년 12월 19일'}
		*/
		$tr.find("td:eq(3)").text(notice.readingStatus === "Y" ? "읽음" : "안읽음");
		$tr.find("td:eq(4)").text(notice.updatedDate);
		$btn.addClass("disabled");
	})
});
</script>
</body>
</html>