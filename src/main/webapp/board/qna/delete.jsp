<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<%
	// 게시글 사용자 번호 조회
	String[] postNoArray = request.getParameterValues("postNo");
	
	// 세션에서 가져온 로그인된 사용자 번호
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	int deleteUserNo = employee.getNo();
	
	QuestionDao questionDao = QuestionDao.getInstance();

	for (String postNoStr : postNoArray) {
			int no = Integer.parseInt(postNoStr);
			Question question = questionDao.getNoPost(no);
				
		if (question.getWriterNo() == deleteUserNo)	{
				question.setDeleted("D");
				questionDao.deletedPost(question);
			} else if (question.getWriterNo() != deleteUserNo) { 
				response.sendRedirect("list.jsp?error=deny");
				return;			
			}	
		}

	response.sendRedirect("list.jsp");
%>
