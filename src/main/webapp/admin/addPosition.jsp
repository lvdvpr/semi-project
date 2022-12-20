<%@page import="com.community.dao.PositionDao"%>
<%@page import="com.community.vo.Position"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// 요청객체에 저장된 요청파라미터값을 가져오기
	String name = request.getParameter("name");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	// Position 객체를 생성해서 전달받은 직위이름, 직위 번호 순서를 객체에 담기
	Position position = new Position();
	position.setName(name);
	position.setSeq(seq);
	
	// Position 객체를 생성하고, 직위이름, 직위 번호 순서를 저장하는 메소드를 실행시킴
	PositionDao positionDao = new PositionDao();
	positionDao.insertPosition(position);
	
	response.sendRedirect("depts.jsp");
	
%>	