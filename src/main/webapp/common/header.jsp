<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
	<%
	 String menu = request.getParameter("menu");
	
	 Employee loginEmployee = (Employee)session.getAttribute("LOGIN_EMPLOYEE"); 
	
	%>
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link <%="home".equals(menu)? "active" : "" %>" href="/web-community/home.jsp">홈</a></li>
	<%
		if (loginEmployee != null ) {
	%>
			<li class="nav-item"><a class="nav-link <%="board".equals(menu)? "active" : "" %>" href="/web-community/board/home.jsp">게시판</a></li>
	<%
		}	
		if (loginEmployee != null && "관리자".equals(loginEmployee.getType())) {
	%>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle <%="admin".equals(menu)? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					관리자
          		</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/web-community/admin/depts.jsp">부서/직위 관리</a></li>
					<li><a class="dropdown-item" href="/web-community/admin/employees.jsp">직원관리</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/web-community/admin/boards.jsp">게시판관리</a></li>
					<li><a class="dropdown-item" href="/web-community/admin/posts.jsp">게시글관리</a></li>
				</ul>
			</li> 
	<%
		}
	%>
		</ul>
<% 
	if (loginEmployee != null) {
%>
		<span class="navbar-text"><strong class="text-white"> <%=loginEmployee.getName() %></strong> 님 환영합니다.</span>
<%
	}
%>
		<ul class="navbar-nav">
<% 
	if (loginEmployee == null) {
%>
			<li class="nav-item"><a class="nav-link " href="/web-community/employee/loginform.jsp">로그인</a></li>
<%
	} else { 
			
%>
			<li class="nav-item"><a class="nav-link <%="employee".equals(menu) ? "active" : "" %> %>" href="/web-community/employee/home.jsp">내정보보기</a></li>
			<li class="nav-item"><a class="nav-link" href="/web-community/employee/logout.jsp">로그아웃</a></li>
<%
	}
%>

		</ul>
	</div>
</nav>