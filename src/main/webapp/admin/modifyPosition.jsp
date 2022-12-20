<%@page import="com.community.vo.Position"%>
<%@page import="com.community.dao.PositionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// 폼입력값 조회
	int positionNo = Integer.parseInt(request.getParameter("positionNo"));
	int seq = Integer.parseInt(request.getParameter("seq"));
	String name = request.getParameter("name");
	
	// 직위번호로 직위이름을 조회
	PositionDao positionDao = new PositionDao();
	Position position = positionDao.getPositionByNo(positionNo);
	
	// 데이터베이스에 조회한 직위목록을 수정폼에서 제출한 값으로 변경
	position.setSeq(seq);
	position.setName(name);
	
	// PositionDao 객체의 updatePosition(Position position) 메소드를 실행해서 변경된 직위정보를 반영시킴
	positionDao.updatePosition(position);
	
	response.sendRedirect("depts.jsp");
%>