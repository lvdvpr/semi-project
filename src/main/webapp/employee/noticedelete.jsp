<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	
	// 게시글 알림 번호(요청 객체)에서 요청파라미터 정보를 조회한다.
	int noticeNo = StringUtils.stringToInt(request.getParameter("noticeNo"));

	// noticeNo에 해당하는 알림을 삭제한다.
	// 알림 삭제 여부를 'N"을 'Y'로 변환하는 쿼리를 반환한다.
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNoticeByNoticeNo(noticeNo);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("mynotice.jsp");
	
%>