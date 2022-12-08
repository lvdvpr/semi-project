<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	//  요청 파라미터로 직원번호와 비밀번호 값 조회
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String password = request.getParameter("password");

	// EmployeeDao 객체 생성
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	// no로 Employee객체 조회
	Employee employee = employeeDao.getEmployeeByNo(no);
	// employee가 null이면 loginform.jsp?error="fail"로 응답
	if (employee == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	// 추후 삭제된 사용자면 로그인 거절하는 코드 추가하기

	// 관리자 회원관리 페이지 완성후 처리예정
	//String salt = employee.getId() + employee.getEmail();
	//String secretPassword = DigestUtils.sha256Hex(salt + password);
	//if (!employee.getPassword().equals(secretPassword)) {
	//	response.sendRedirect("loginform.jsp?error=fail");
	//	return;
	//}
	

	session.setAttribute("LOGIN_EMPLOYEE_NO", employee.getNo());
	session.setAttribute("LOGIN_EMPLOYEE_NAME", employee.getName());
	
	response.sendRedirect("../home.jsp");
%>