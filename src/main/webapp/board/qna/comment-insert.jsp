<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<%
	// 게시글 번호, 내용, 직원번호
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String commentContent = request.getParameter("content");
	
	if (commentContent.isEmpty()) {
		response.sendRedirect("detail.jsp?no=" + no + "&error=invalid");
		return;
	}
	
	// empNo를 가지고 오는 session객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	Comment comment = new Comment();
	
	comment.setContent(commentContent);
	comment.setEmpNo(employee.getNo());
	comment.setPostNo(no);
	
	// comment 등록
	CommentDao commentDao = new CommentDao();	
	commentDao.insertComment(comment);
	
	// 게시물 추천수 +1 증가
	QuestionDao questionDao = QuestionDao.getInstance();
	Question question = questionDao.getNoPost(no);
	
	question.setCommentCount(question.getCommentCount() +1);
	questionDao.updatePost(question);
	
	// 내게 온 알림
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(no);
	notice.setSendEmpNo(employee.getNo());
	notice.setReceiveEmpNo(question.getWriterNo());
	notice.setContent("[댓글] " + no + "번 글에 댓글이 등록되었습니다.");
		
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("detail.jsp?no=" + no);
	
%>