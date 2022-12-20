<%@page import="com.community.vo.Position"%>
<%@page import="com.community.dao.PositionDao"%>
<%@page import="com.community.vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.DepartmentDao"%>
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
			<h1 class="heading">부서/직위 관리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">전체 부서 목록</div>
				<div class="card-body">
					<p>전체 부서목록을 확인하세요.</p>
					<%
						DepartmentDao departmentDao = new DepartmentDao();
						List<Department> departmentList = departmentDao.getAllDepartments();
					
					%>
					<table class="table table-sm" id="table-depts">
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<td></td>
							</tr>
						</thead>
						<tbody>
					<%
						for (Department department : departmentList) {
					%>
							<tr>
								<td><%=department.getNo() %></td>
								<td><%=department.getName() %></td>
								<td><button class="btn btn-outline-primary btn-xs">수정</button></td>
							</tr>
					<%
						}
					%>
						</tbody>
					</table>
				</div>
				<div class="card-footer text-end">
					<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-dept">신규 등록</button>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<div class="card-header">전체 직위 목록</div>
				<div class="card-body">
					<p>전체 직위목록을 확인하세요.</p>
					<%
						PositionDao positionDao = new PositionDao();
						List<Position> positionList = positionDao.getAllPositions();
					%>
					<table class="table table-sm" id="table-positions">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="*">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>순서</th>
								<th>직위이름</th>
								<td></td>
							</tr>
						</thead>
						<tbody>
					<%
						for (Position position : positionList) {
					%>
							<tr>
								<td><input type="checkbox" /></td>
								<td><%=position.getNo() %></td>
								<td><%=position.getSeq() %></td>
								<td><%=position.getName() %></td>
								<td><button class="btn btn-outline-primary btn-xs">수정</button></td>
							</tr>
					<%
						}
					%>		
						</tbody>
					</table>
					<div>
						<button class="btn btn-outline-secondary btn-xs">맨 위로</button>
						<button class="btn btn-outline-secondary btn-xs">위로</button>
						<button class="btn btn-outline-secondary btn-xs">아래로</button>
						<button class="btn btn-outline-secondary btn-xs">맨 아래로</button>
					</div>
				</div>
				<div class="card-footer text-end">
					<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-position">신규 등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 부서정보 등록폼 -->
<div class="modal" tabindex="-1" id="modal-form-dept">
	<div class="modal-dialog">
		<form id="form-add-dept" class="border p-3 bg-light" method="post" action="addDept.jsp">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">부서정보 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm" >부서명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control form-control-sm" name="name" placeholder="부서명을 입력하세요">
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
<!-- 부서정보 수정 폼 -->
<div class="modal" tabindex="-1" id="modal-modifyform-dept">
	<div class="modal-dialog">
		<form  id="form-modify-dept" class="border p-3 bg-light" method="post" action="modifyDept.jsp">
		<!--  <input type="hidden" name="deptNo" value="100" /> -->
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">부서정보 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">부서번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control form-control-sm" name="deptNo" readonly placeholder="부서번호을 입력하세요">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-3 col-form-label col-form-label-sm">부서명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control form-control-sm" name="name" placeholder="부서명을 입력하세요">
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
<!-- 직위정보 등록폼 -->
<div class="modal" tabindex="-1" id="modal-form-position">
	<div class="modal-dialog">
		<form id="form-add-position" class="border p-3 bg-light" method="post" action="addPosition.jsp">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">직위정보 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row mb-2">
					<label class="col-sm-3 col-form-label col-form-label-sm" >노출순위</label>
					<div class="col-sm-9">
						<input type="text" class="form-control form-control-sm" name="seq" placeholder="노출순위를 입력하세요">
					</div>
				</div>
				<div class="row mb-2">
					<label class="col-sm-3 col-form-label col-form-label-sm" >직위명</label>
					<div class="col-sm-9">
						<input type="text" class="form-control form-control-sm" name="name" placeholder="직위명을 입력하세요">
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
<!-- 직위정보 수정 폼 -->
<div class="modal" tabindex="-1" id="modal-modifyform-position">
	<div class="modal-dialog">
		<form id="form-modify-position" class="border p-3 bg-light" method="post" action="modifyPosition.jsp">
		<input type="hidden" name="positionNo" value="100" />
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">직위정보 수정폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row mb-2">
					<label class="col-sm-3 col-form-label col-form-label-sm" >번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control form-control-sm" name="positionNo" readonly placeholder="노출순위를 입력하세요">
					</div>
				</div>
				<div class="row mb-2">
					<label class="col-sm-3 col-form-label col-form-label-sm" >노출순위</label>
					<div class="col-sm-9">
						<input type="text" class="form-control form-control-sm" name="seq" placeholder="노출순위를 입력하세요">
					</div>
				</div>
				<div class="row mb-2">
					<label class="col-sm-3 col-form-label col-form-label-sm" >직위명</label>
					<div class="col-sm-9">
						<input type="text" class="form-control form-control-sm" name="name" placeholder="직위명을 입력하세요">
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
	var deptModifyModal = new bootstrap.Modal("#modal-modifyform-dept");
	
	$("#table-depts tbody button").click(function() {
		var no = $(this).closest("tr").find("td:eq(0)").text();
		var name = $(this).closest("tr").find("td:eq(1)").text();
		
		$("#form-modify-dept [name=deptNo]").val(no);
		$("#form-modify-dept [name=name]").val(name);
		deptModifyModal.show();
	});
	

	var positionModifyModal = new bootstrap.Modal("#modal-modifyform-position");
	
	$("#table-positions tbody button").click(function() {
		var no = $(this).closest("tr").find("td:eq(1)").text();
		var seq = $(this).closest("tr").find("td:eq(2)").text();
		var name = $(this).closest("tr").find("td:eq(3)").text();
		console.log(seq);
		$("#form-modify-position [name=positionNo]").val(no);
		$("#form-modify-position [name=seq]").val(seq);
		$("#form-modify-position [name=name]").val(name);		
		positionModifyModal.show();
	});
});



</script>
</body>
</html>