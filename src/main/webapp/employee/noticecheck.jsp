<%@page import="java.util.List"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dto.MyNoticeDto"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	// 알람번호 요청파라미터 정보를 조회한다.
	int noticeNo = StringUtils.stringToInt(request.getParameter("noticeNo"));

	// noticeNo에 해당하는 알람의 알람 열람여부를 확인으로 바꾼다.
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNoticeByNoticeNo(noticeNo);
	
	// 알람번호를 전달받아서 해당 게시글 정보 리스트를 반환한다.
	List<MyNoticeDto> myNoticeDto = noticeDao.getNoticeByNo(noticeNo); 
	
	/*
		{no:10022, readingStatus:'Y', updatedDate:'2022년 12월 19일'}
	*/
	String jsonText = "";
	out.write(jsonText);
%>