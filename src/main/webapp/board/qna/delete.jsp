<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	String[] postNoArray = request.getParameterValues("postNo");

	// (로그인 구현) postNo와 일치하는 번호 가져와서 서로 비교하고 맞는지 확인
	
	
	// (로그인 구현) 로그인한 사용자의 아이디와 게시글 작성자의 아이디가 서로 다르면 게시글을 삭제할 수 없다.
	// (로그인 구현) detail.jsp를 재요청하는 URL을 응답으로 보낸다.
	
	QuestionDao questionDao = new QuestionDao();

	for (String postNoStr : postNoArray) {
		int no = Integer.parseInt(postNoStr);
		Question question = questionDao.getNoPost(no);
		
		question.setDeleted("D");
		questionDao.updatePost(question);
		
	}

	response.sendRedirect("list.jsp");
%>
