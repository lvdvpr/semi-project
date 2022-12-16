<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.community.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
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
			<h1 class="heading">묻고 답하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">질문 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">묻고 답하기 게시판</div>
<%
	
	// 현재 페이지
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	
	QuestionDao questionDao = new QuestionDao();
	
	Map<String, Object> param = new HashMap<>();
	param.put("keyword", keyword);
	param.put("opt", opt);
	
	int totalRows = questionDao.getTotalRows(param);
	
	// pagination 객체를 가져온다
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());

	List<QnaDto> questionList = questionDao.getAllPost(param);

%>				
				<div class="card-body">
				<!-- 여기 아이디 주기 -->
					<form id="post-list-select" class="mb-3" method="get" action="list.jsp">
						<input type="hidden" name="page" value="<%=currentPage %>">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" name="rows" >
								<!-- 마저 구현하기 -->
									<option value="10" <%=rows == 10 ? "selected" : "" %> > 10</option>
									<option value="15" <%=rows == 15 ? "selected" : "" %> > 15</option>
									<option value="20" <%=rows == 20 ? "selected" : ""%> > 20</option>
								</select>
							</div>
							<div>
								<small><input type="checkbox"> 안읽은 게시글</small>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %> id="title" > 제목</option>
									<option value="empName" <%="empName".equals(opt) ? "selected" : "" %> id="empName" > 작성자</option>
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
									<th><input type="checkbox" id="all-checkbox"></th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
<%
	for (QnaDto questions : questionList) {
		
		int postNo = questions.getNo();
		int postOriginNo = questions.getOriginalNo();
		
	if (postNo != postOriginNo) {
%>								<!-- 질문글 -->
								<tr>
									<td><input type="checkbox" name="postNo" value="<%=questions.getNo() %>"/></td>
									<td><%=questions.getNo() %></td>
									<td class="ps-4"><a href="detail.jsp?no=<%=questions.getNo() %>" class="text-decoration-none text-dark"><i class="bi bi-arrow-return-right"></i><%=questions.getTitle() %></a></td>
									<td><%=questions.getName() %></td>
									<td><%=StringUtils.dateToText(questions.getCreatedDate()) %></td>
									<td><%=questions.getReadCount() %></td>
									<td><%=questions.getSuggestionCount() %></td>
								</tr>
<%
	} else if (postNo == postOriginNo) {
%>								
								<!-- 답글 -->
							<tbody>							
								<tr>
									<td><input type="checkbox" name="postNo" value="<%=questions.getNo() %>"/></td>
									<td><%=questions.getNo() %></td>
									<td><a href="detail.jsp?no=<%=questions.getNo() %>" class="text-decoration-none text-dark">
										<i class="bi bi-question-circle-fill"></i><%=questions.getTitle() %></a></td>
									<td><%=questions.getName() %></td>
									<td><%=StringUtils.dateToText(questions.getCreatedDate()) %></td>
									<td><%=questions.getReadCount() %></td>
									<td><%=questions.getSuggestionCount() %></td>
								</tr>
<%
	}
}
%>							
							</tbody>
						</table>
					</form>
<%
	if (!questionList.isEmpty()) {
		int beginPage = pagination.getBeginPage();
		int endPage = pagination.getEndPage();
		boolean isFirst = pagination.isFirst();
		boolean isList = pagination.isLast();
		int prevPage = pagination.getPrevPage();
		int nextPage = pagination.getNextPage();
%>					
		<nav>
			<ul class="pagination pagination-sm justify-content-center">
				<li class="page-item">
					<a class="page-link <%=isFirst ? "disabled" : "" %>" 
					href="list.jsp?page=<%=prevPage %>" data-posts-no="<%=prevPage %>">이전</a>
				</li>
		<%
			for (int number = beginPage; number <= endPage; number++) {
		%>		
				<li class="page-item">
					<a class="page-link <%=currentPage == number ? "active" : "" %>"
					 href="list.jsp?page=<%=number %>" data-posts-no="<%=number %>"><%=number %></a></li>
							
		<%
			}
		%>		
				<li class="page-item">
					<a class="page-link <%=isList ? "disabled" : "" %>" 
					href="list.jsp?page=<%=nextPage %>" data-posts-no="<%=nextPage %>">다음</a>
				</li>
			</ul>
		</nav>
<%
	}
%>				
				<div class="text-end">
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">질문 등록</button>
						<button class="btn btn-primary btn-xs" id="btn-open-answer">답변 등록</button>
						<button class="btn btn-outline-dark btn-xs" id="deleted-post">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 등록 모달창 -->
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
								<option value="104"> 갤러리</option>
								<option value="105"> 자유게시판</option>
								<option value="106" selected="selected"> 묻고 답하기</option>
								<option value="107"> 임시저장함</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title">
						</div>
					</div>
					<div class="row mb-2">
					<!-- 로그인 완료되면 추가해야함 -->
						<input type="hidden" name="writerNo" value="">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="홍길동" name="emp-name">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" checked>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y">
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
<!-- 게시글 답글 모달창 -->
<div class="modal" tabindex="-1" id="modal-modifyform-posts">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">				
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="border p-3 bg-light" method="post" action="insert-post-answer.jsp">
					
					<input type="hidden" name="originalNo" />
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value="102"> 공지사항</option>
								<option value="103"> 파일게시판</option>
								<option value="104"> 갤러리</option>
								<option value="105"> 자유게시판</option>
								<option value="106" selected="selected"> 묻고 답하기</option>
								<option value="107"> 임시저장함</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title">
						</div>
					</div>
					<div class="row mb-2">
					<!-- 로그인 완료되면 추가해야함 -->
						<input type="hidden" name="writerNo" value="">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="홍길동" name="emp-name">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" checked>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y">
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

<form id="form-delete" method="get" action="delete.jsp"></form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(function() {
	
	// 10, 15, 20 보기 클릭시 기본 page 번호가 1이 되도록 지정
	$("select[name=rows]").change(function() {
		$(":input[name=page]").val(1);
		$("#post-list-select").trigger('submit');
	})
	
	// 10, 15, 20선택시 페이지 네이션 값 전해주기
	$(".pagination a").click(function(event) {
		event.preventDefault(); // 얘 때문인 거 같음 - 없애면 2페이지로 넘어갈 때 유지가 안되고, 있으면 1페이지에서 움직이지 않음
								// a태그를 버튼으로 바꾸고 href로 전해주는 값을 form 태그를 지정해 전해준다...?? 이게 맞는지
		var pageNo = $(this).attr("data-posts-no");
		
		$(":input[name=page]").val(pageNo);
		
		$("#post-list-select").trigger('submit');

	})
	
	// 검색 키워드 ""일 경우 alert 울리기
	$("#btn-search").click(function() {
		var keyword = $(":input[name=keyword]").val();
		
		if(keyword == "") {
			alert("검색어를 입력하세요");
			return false;
		}
		
		$(":input[name=page]").val(1);
		$("#post-list-select").trigger('submit');
	})
	
	// 전체 체크박스 구현 - allcheck 누르면 전부 체크되게 구현
	$("#all-checkbox").change(function() {
		let $allCheck = $(this).prop('checked');
		
		$(":input[name=postNo]").prop('checked', $allCheck);

	})
	// 전체 체크박스 구현 -  게시글 옆 checkbox 체크여부에 따라 all-check 변화
	$(":input[name=postNo]").change(function() {
		let checkboxNumber = $(":input[name=postNo]").length;
		let checkboxCheckedNumber = $(":input[name=postNo]:checked").length;
		
		if (checkboxNumber == checkboxCheckedNumber) {
			//$("#all-checkbox").prop("checked", "");로 쓰면 안되는 건지
			$("#all-checkbox").prop("checked", true); 
		} else {
			$("#all-checkbox").prop("checked", false);
			
		}
				// if문 대신 사용하던데 코드 해석이 안된다.
				// $("#all-checkbox").prop("checked", checkboxNumber == checkboxCheckedNumber)
		})
	
	// 게시글 일반/중요 구현
	$(":input[name=important]").click(function() {
		
		$(":input[name=important]").change(function() {
			
			$(":input[value='N']").prop("checked", "");
			
			var $important = $(this).val();
			$(":input[name=important]").val($important);
		})

	})
	
	// 답변 등록시 checkbox 1개이상
	var answerModal = new bootstrap.Modal("#modal-modifyform-posts");
	$("#btn-open-answer").click(function() {
		
		var $checkedCheckboxs = $(":checkbox[name=postNo]:checked");
		if ($checkedCheckboxs.length == 0 || $checkedCheckboxs.length > 1) {
			alert("지정된 게시글이 없습니다.");
			return;
		}

		var postNo = $checkedCheckboxs.val();
		// hidden field 값 설정
		$(":input[name=originalNo]").val(postNo);
		
		answerModal.show();
	})
	
	// 삭제하기 - 로그인 한 사람 중 자기 자신만 삭제할 수 있게 구현하기
	$("#deleted-post").click(function() {
		
		var $deletedCheckboxs = $(":checkbox[name=postNo]:checked");
		if ($deletedCheckboxs.length == 0) {
			alert("삭제할 게시글을 선택하세요.");
			return;
		}
		
		var $form = $("#form-delete")
		for (var index = 0; index < $deletedCheckboxs.length; index++) {
			var el = $deletedCheckboxs[index];
			var postNo = $(el).val();
			var input = "<input type='hidden' name='postNo' value='"+postNo+"'>";
			$form.append(input);
		}
		$form.trigger('submit');
	})
		
})
</script>
</body>
</html>