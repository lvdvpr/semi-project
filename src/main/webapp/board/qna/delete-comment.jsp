<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.commnuity.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<% 
	// 댓글 삭제 구현
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int commentNo = StringUtils.stringToInt(request.getParameter("cno"));
	
	CommentDao commentDao = new CommentDao();
	Comment comment = commentDao.getCommentByNo(commentNo);
	
	comment.setCommentDeleted("Y");
	commentDao.updateComment(comment);
	
	// 댓글 수 -1 감소시키기
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	question.setCommentCount(question.getCommentCount() -1);
	questionDao.updatePost(question);

	response.sendRedirect("detail.jsp?no=" + no);
	
	
%>