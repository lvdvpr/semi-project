
<%@page import="com.community.vo.Employee"%>

<%@page import="com.community.dto.PostListDto"%>

<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Board"%>
<%@page import="com.community.dao.BoardDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.Pagination"%>
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
<%
	Employee loginEmployee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	if (loginEmployee==null) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}
//  관리자 외  페이지 접근 불가능
	if ("사용자".equals(loginEmployee.getType())) {
		response.sendRedirect("/web-community/employee/loginform.jsp?error=deny");
		return;
	}

	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"), 0);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	Map<String, Object> param = new HashMap<>();
	
	AdminPostDao postDao = AdminPostDao.getInstance();
	if (boardNo != 0) {
		param.put("boardNo", boardNo);						
	}
	int totalRows = postDao.getTotalRows(param);
	
	Pagination pagination = new Pagination(currentPage, totalRows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<PostListDto> postList = postDao.getAllPosts(param);
		
%>


<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">게시물 관리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="row p-3">
						<div class="col-3 border p-3">
							<p>전체 게시판목록을 확인하세요.</p>
	
						<ul class="tree border py-3 text-dark" id="board-list">
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=102" class="text-decoration-none <%=boardNo==102 ? "bg-dark text-white" : "text-dark"%>" data-board-no="102">공지사항</a></span>
							</li>
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=103" class="text-decoration-none  <%=boardNo==103 ? "bg-dark text-white" : "text-dark"%>" data-board-no="103">파일게시판</a></span>
							</li>
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=104" class="text-decoration-none  <%=boardNo==104 ? "bg-dark text-white" : "text-dark"%>" data-board-no="104">갤러리</a></span>
							</li>
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=105" class="text-decoration-none  <%=boardNo==105 ? "bg-dark text-white" : "text-dark"%>" data-board-no="105">자유게시판</a></span>
							</li>
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=106" class="text-decoration-none  <%=boardNo==106 ? "bg-dark text-white" : "text-dark"%>" data-board-no="106">묻고답하기</a></span>
							</li>
							<li >
								<span class="caret"><a href="/web-community/admin/posts.jsp?boardNo=107" class="text-decoration-none  <%=boardNo==107 ? "bg-dark text-white" : "text-dark"%>" data-board-no="107">임시저장함</a></span>
							</li>
						</ul>
					</div>
					
						<div class="col-9">
							<form id="form-posts" class="border p-3" method="get" action="remove_post.jsp">
								<input type="hidden" name="page" value="<%=currentPage %>" />
								<input type="hidden" name="boardNo" value="<%=boardNo %>" />
								<table class="table table-sm" id="table-posts">
									<colgroup>
										<col width="5%">
										<col width="10%">
										<col width="*">
										<col width="15%">
										<col width="10%">
										<col width="18%">
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" id="checkbox-all"></th>
											<th>번호</th>
											<th>제목</th>
											<th>상태</th>
											<th>작성자</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
									<%
										if (postList.isEmpty()) {
									%>
										<tr>
											<td colspan="6" class="text-center"> 게시글 정보가 없습니다.</td>
										</tr>
									<%
										} else {
									
										for (PostListDto post : postList) {
									%>
										<tr>
											<td><input type="checkbox" name="no" data-post-nos="<%=post.getNo()%>" value="<%=post.getNo()%> "/></td>
											<td><%=post.getNo() %>
											<td><a href="detail.jsp?no=<%=post.getNo() %>" class="text-decoration-none text-dark"><%=post.getTitle() %></a></td>
											<td><%="N".equals(post.getDeleted()) ? "미삭제" : "삭제" %>
											<%="Y".equals(post.getImportant()) ? "[중요] " : ""  %></td>
											<td><%=post.getName()%></td>
											<td><%=StringUtils.dateToText(post.getCreatedDate()) %></td>
										</tr>
									<%
										}
									}
									%>
									</tbody>
								</table>
								
								<%
									if (!postList.isEmpty()) {
										int beginPage = pagination.getBeginPage();	
										int endPage = pagination.getEndPage();		
										boolean isFirst = pagination.isFirst();		
										boolean isLast = pagination.isLast();		
										int prevPage = pagination.getPrevPage();	
										int nextPage = pagination.getNextPage();	
								%>
								<nav>
									<ul class="pagination pagination-sm justify-content-center">
										<li class="page-item">
											<a class="page-link <%=isFirst? "disabled" : ""%>" href="posts.jsp?page=<%=prevPage %>&boardNo=<%=boardNo%>">이전</a>
										</li>
								<%
											for (int number = beginPage; number <= endPage; number++) {
								%>
										<li class="page-item">
											<a class="page-link <%=currentPage == number ? "active" : "" %>" href="posts.jsp?page=<%=number %>&boardNo=<%=boardNo %>"><%=number %></a></li>
								<%
										}
								%>
								
										<li class="page-item">
											<a class="page-link <%=isLast? "disabled" : ""%>" href="posts.jsp?page=<%=nextPage %>&boardNo=<%=boardNo%>">다음</a>
										</li>
									</ul>
								</nav>
								<%
									}
								%>
								<div class="text-end">
									<button type="button" id="button-restore" class="btn btn-outline-dark btn-sm">복구</button>
									<button type="button" id="button-open-move" class="btn btn-outline-dark btn-sm">이동</button>
									<button type="button" id="button-delete" class="btn btn-outline-dark btn-sm">삭제</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 게시물 이동하기 모달창 -->

<div class="modal" tabindex="-1" id="modal-form-move-posts">
   <div class="modal-dialog">
      <form id="move-post" class="border p-3 bg-light" action="post-move.jsp" method="get">
         <!-- 이동시킬 게시글의 번호를 스크립트로 설정하세요 -->
         <input type="hidden" name="no" value="" />
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">게시글 이동하기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                  <div class="row mb-2">
                     <label class="form-label">이동할 게시판을 선택하세요.</label>
                     <select class="form-select form-select-sm" name="boardNo">
                        <option value="102">공지사항</option>
                        <option value="103">파일게시판</option>
                        <option value="104">갤러리</option>
                        <option value="105">자유 게시판</option>
                        <option value="106">묻고 답하기</option>
                        <option value="107">임시 저장함</option>
                     </select>
                  </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
               <button type="submit" class="btn btn-primary btn-xs">이동</button>
            </div>
         </div>
      </form>
   </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		let $postMoveModal = new bootstrap.Modal("#modal-form-move-posts");
		
		//게시글 복구 - 게시글 미선택시 처리 / 미삭제 상태일 때 선택하는 경우 alert  / 제출 
		$("#button-restore").click(function() {
			if ($(":checkbox[name=no]:checked").length === 0) {
				alert("게시물을 하나 이상 선택해주세요.");
				return;
			} else  {
			$("#form-posts").attr("action", "restore.jsp").trigger("submit");
			alert("게시글 복구가 완료되었습니다.")
		}
			
		})

		
		$("#button-delete").click(function() {
			if ($(":checkbox[name=no]:checked").length === 0) {
				alert("게시물을 하나 이상 선택해주세요.");
				return;
			} if(confirm("게시글을 삭제하시겠습니까?")) {
				$("#form-posts").attr("action", "remove_post.jsp").trigger("submit");
				alert("게시글 삭제가 완료되었습니다.")
			} else {
				return false;
				}
			})
		// 전체체크박스값이 변경될 때 개별 체크박스의 상태도 동일하게 적용시키기. 
		$("#checkbox-all").change(function() {
			let $allChecked = $(this).prop('checked');
			$(":checkbox[name=no]").prop("checked", $allChecked);
			toggleSelectedCheckbox();
		
		})

		
		$(":checkbox[name=no]").change(function() {
			toggleCheckboxAll();
			toggleSelectedCheckbox();
		})
		// 개별 체크박스의 체크갯수가 체크박스의 총 갯수와 같으면, 전체체크박스의 체크상태와 동일하게 설정 
		function toggleCheckboxAll() {
			let $checkboxLength = $(":checkbox[name=no]").length;
			let $checkedCheckboxLength = $(":checkbox[name=no]:checked").length;
			$("#checkbox-all").prop('checked', $checkboxLength ===$checkedCheckboxLength)
			
		}
		// 체크된 게 없을 때 복구/삭제/이동 작업 버튼을 disabled 처리
		function toggleSelectedCheckbox() {
			let $buttonRestore = $("#button-restore");
			let $buttonDelete = $("#button-delete");
			let $buttonMove = $("#button-open-move");
			let $checkedCheckboxLength =  $(":checkbox[name=no]:checked").length;
			if ($checkedCheckboxLength === 0) {
				$buttonRestore.addClass("disabled");
				$buttonDelete.addClass("disabled");
				$buttonMove.addClass("disabled");
			} else {
				$buttonRestore.removeClass("disabled");
				$buttonDelete.removeClass("disabled");
				$buttonMove.removeClass("disabled");
			}
		}
	
		
		// 모달창 , 이동하기 - boardNo, no 값 설정
		$("#button-open-move").click(function() {
			let $checkedCheckboxes = $(":checkbox[name=no]:checked");
			if ($checkedCheckboxes.length === 0 || $checkedCheckboxes.length > 1) {
				alert("게시물을 하나만 선택하세요");
				return;
			}
			// select의 boardNo값 설정
			let boardNo = $("#board-list a.bg-dark").attr("data-board-no")
			$("#modal-form-move-posts [name=boardNo]").val(boardNo);
			
			
			// hidden 필드에 no값 설정
			let no = $(":checkbox[name=no]").attr("data-post-nos");
			$(":hidden[name=no]").val(no);
			
			$postMoveModal.show();			

			})				
			
			
		})
		
		
				
		
		
	
		

	
	

</script>
</body>
</html>