<%@page import="com.community.util.StringUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.dto.EmplyListDto"%>
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
			<h1 class="heading">직원 관리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">직원 리스트</div>
				<div class="card-body">
					<p>직원 목록을 확인하세요.</p>
				<%
					// 페이징 처리
					
					// 1. 한 화면에 표시할 행의 갯수를 결정하기
					final int rows = 10;
					// 2. 현재 페이지 번호를 조회하기
					int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
					// 3. 현재 페이지 번호에 맞는 조회범위 계산하기
					int begin = (currentPage - 1)*rows + 1;
					int end = currentPage*rows;
					// 4. Map객체를 생성해서 조회범위를 저장한다.
					Map<String, Object> param = new HashMap<>();
					param.put("begin", begin);
					param.put("end", end);
					
					
					// 현재 페이지번호에 맞는 직원 목록을 조회하기 위해서 EmployeeDao객체를 생성
					EmployeeDao employeeDao = EmployeeDao.getInstance();
					// EmployeeDao객체의 getAllEmployees 메소드를 실행해서 현재 페이지번호에 맞는 직원 정보를 반환받음
					List<EmplyListDto> emplyList = employeeDao.getAllEmplyList(param);
				%>
					<table class="table table-sm">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<td>부서명</td>
								<td>직위</td>
								<td>연락처</td>
								<td>이메일</td>								
								<td></td>
							</tr>
						</thead>
						<tbody>
					<%
						if (emplyList.isEmpty()) {
					%>
							<tr>
								<td colspan="6" class="text-center">직원 정보가 존재하지 않습니다.</td>
							</tr>
					
					<%
						} else {
							for (EmplyListDto emplylist : emplyList) {
					%>
							<tr>
								<td><%=emplylist.getEmpNo() %></td>
								<td><%=emplylist.getEmpName() %></td>
								<td><%=emplylist.getDepartmentName() %></td>
								<td><%=emplylist.getPositionName() %></td>
								<td><%=emplylist.getPhone() %></td>
								<td><%=emplylist.getEmail() %></td>
								<td>
									<a href="emp-modifyform.jsp?empNo=<%=emplylist.getEmpNo() %>" class="btn btn-outline-primary btn-xs">수정</a>
									<a href="delete.jsp?empNo=<%=emplylist.getEmpNo() %>" class="btn btn-outline-secondary btn-xs">삭제</a>
								</td>
							</tr>
					<%
							}
						}
					%>
						</tbody>
					</table>
					<%
						// 1. 전체 책 갯수를 조회한다.
						int totalRows = employeeDao.getTotalRows();
						
						// 2. 전체 페이지 갯수를 계산한다.
						int totalPages = (int) Math.ceil((double) totalRows/rows);
					%>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item"><a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="employees.jsp?page=<%=currentPage - 1 %>">이전</a></li>
					<%
						for (int number = 1; number <= totalPages; number++) {
					%>
							<li class="page-item"><a class="page-link <%=currentPage == number ? "active" : "" %>" href="employees.jsp?page=<%=number %>"><%=number %></a></li>
					<%
						}
					%>
						<li class="page-item"><a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="employees.jsp?page=<%=currentPage + 1 %>">다음</a></li>
						</ul>
					</nav>
				</div>
				<div class="card-footer text-end">
					<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-employees">신규 등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-employees">
	<div class="modal-dialog">
		<form class="border p-3 bg-light" method="post" action="register.jsp">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">직원 정보 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control form-control-sm" name="name" placeholder="직원이름">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">소속부사</label>
						<div class="col-sm-6">
							<select class="form-select form-select-sm" name="deptNo">
								<!-- comm_employees 테이블에 저장된 내용을 출력하세요 -->
								<option value="101"> 디자인1팀</option>
								<option value="102"> 디자인2팀</option>
								<option value="103"> 퍼블리싱1팀</option>
								<option value="104"> 개발1팀</option>
								<option value="105"> 개발2팀</option>
								<option value="106"> 모바일 개발팀</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">직위</label>
						<div class="col-sm-6">
							<select class="form-select form-select-sm" name="positionNo">
								<!-- comm_postions 테이블에 저장된 내용을 출력하세요 -->
								<option value="100"> 대표이사</option>
								<option value="101"> 전무</option>
								<option value="102"> 상무</option>
								<option value="103"> 부장</option>
								<option value="104"> 차장</option>
								<option value="105"> 과장</option>
								<option value="106"> 대리</option>
								<option value="107"> 사원</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">이메일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control form-control-sm" name="email" placeholder="이메일">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">전화번호</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="phone" placeholder="전화번호">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">직원타입</label>
						<div class="col-sm-6">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="type" value="사용자" checked>
								<label class="form-check-label">사용자</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="type" value="관리자" >
								<label class="form-check-label">관리자</label>
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">등록</button>
			</div>
		</div>
	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>