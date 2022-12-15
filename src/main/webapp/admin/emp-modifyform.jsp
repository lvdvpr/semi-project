<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.EmplyListDto"%>
<%@page import="com.community.dao.EmployeeDao"%>
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
				<div class="card-header">직원 정보 수정폼</div>
				<%
					// 요청파라미터값을 조회
					int no = Integer.parseInt(request.getParameter("empNo"));
				
					// 직원번호에 해당하는 직원정보를 조회
					EmployeeDao employeeDao = EmployeeDao.getInstance();
					Employee employee = employeeDao.getEmployeeByEmpNo(no);
				%>
				
				
				
				<div class="card-body">
					<p>직원정보를 수정하세요.</p>
					<form class="" method="post" action="update.jsp">
						<table class="table table-borderless">
							<colgroup>
								<col width="10%">
								<col width="40%">
								<col width="10%">
								<col width="40%">
							</colgroup>
							<tbody>
								<tr>
									<th class="text-end">직원번호</th>
									<td><input type="text" class="form-control form-control-sm" name="no" value="<%=employee.getNo() %>" readonly/></td>
									<th class="text-end">직원이름</th>
									<td><input type="text" class="form-control form-control-sm" name="name" value="<%=employee.getName() %>" /></td>
								</tr>
								<tr>
									<th class="text-end">이메일</th>
									<td><input type="text" class="form-control form-control-sm" name="email" value="<%=employee.getEmail() %>" /></td>
									<th class="text-end">전화번호</th>
									<td><input type="text" class="form-control form-control-sm" name="phone" value="<%=employee.getPhone() %>" /></td>
								</tr>
								<tr>
									<th class="text-end">소속부서</th>
									<td>
										<select class="form-select form-select-sm" name="deptNo">
											<option value="101" <%="101".equals(employee.getDeptNo()) ? "selected" : "" %>> 디자인1팀</option>
											<option value="102" <%="102".equals(employee.getDeptNo()) ? "selected" : "" %>> 디자인2팀</option>
											<option value="103" <%="103".equals(employee.getDeptNo()) ? "selected" : "" %>> 퍼블리싱1팀</option>
											<option value="104" <%="104".equals(employee.getDeptNo()) ? "selected" : "" %>> 퍼블리싱2팀</option>
											<option value="105" <%="105".equals(employee.getDeptNo()) ? "selected" : "" %>> 개발1팀</option>
											<option value="106" <%="106".equals(employee.getDeptNo()) ? "selected" : "" %>> 개발2팀</option>
											<option value="107" <%="107".equals(employee.getDeptNo()) ? "selected" : "" %>> 모바일 개발팀</option>
										</select>
									</td>
									<th class="text-end">직위</th>
									<td>
										<select class="form-select form-select-sm" name="positionNo">
											<option value="100" <%="100".equals(employee.getPositionNo()) ? "selected" : "" %>> 대표이사</option>
											<option value="101" <%="101".equals(employee.getPositionNo()) ? "selected" : "" %>> 전무</option>
											<option value="102" <%="102".equals(employee.getPositionNo()) ? "selected" : "" %>> 상무</option>
											<option value="103" <%="103".equals(employee.getPositionNo()) ? "selected" : "" %>> 부장</option>
											<option value="104" <%="104".equals(employee.getPositionNo()) ? "selected" : "" %>> 차장</option>
											<option value="105" <%="105".equals(employee.getPositionNo()) ? "selected" : "" %>> 과장</option>
											<option value="106" <%="106".equals(employee.getPositionNo()) ? "selected" : "" %>> 대리</option>
											<option value="107" <%="107".equals(employee.getPositionNo()) ? "selected" : "" %>> 사원</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="text-end">
							<a href="employees.jsp" class="btn btn-secondary btn-sm">취소</a>
							<button type="submit" class="btn btn-primary btn-sm">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>