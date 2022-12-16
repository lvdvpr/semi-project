<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// 관리자 게시글 조회
	// 요청 파라미터로 originalNo, boardNo, title, WriterNo, important, content 조회
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));
	String important = request.getParameter("important");
	
	int writerNo = 1002; // 세션 합치고 바꿀 것!!!!!!!!!!!!!!
	
	Post answerPost = new Post();
	
	answerPost.setBoardNo(boardNo);
	answerPost.setTitle(title);
	answerPost.setContent(content);
	answerPost.setOriginalNo(originalNo);
	answerPost.setImportant(important);
	answerPost.setWriterNo(writerNo);
	
	AdminPostDao postDao = AdminPostDao.getInstance();
	postDao.insertAnswer(answerPost); // 답변 게시글 등록
	
	// 원글 번호로 글 정보 조회하기
	Post orginalPost =postDao.getPostByNo(originalNo);
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(originalNo);
	notice.setSendEmpNo(1001); // 추후 세션에서 꺼내서 작업
	notice.setReceiveEmpNo(orginalPost.getWriterNo());
	notice.setContent("[답글] " + originalNo + "번 글에 답변이 등록되었습니다.");
	
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("posts.jsp?boardNo="+boardNo);
	
			
	
%>