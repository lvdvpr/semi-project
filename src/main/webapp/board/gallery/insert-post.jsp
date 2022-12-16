<%@page import="com.community.vo.File"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// boardNo, title, empName, important, content, file, writerNo
	
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	// 세션얻어서 진행하기
	int writerNo = 1;
	
	Gallery gallery = new Gallery();
	gallery.setBoardNo(boardNo);
	gallery.setTitle(title);
	gallery.setImportant(important);
	gallery.setContent(content);
	gallery.setWriterNo(writerNo);
	
	GalleryDao galleryDao = GalleryDao.getInstance();
	galleryDao.insertGalleryPost(gallery);
	
	// 파일 첨부하기
	String fileName = request.getParameter("fileName");
	
	File file = new File();
	file.setFileName(fileName);
	file.setFileNo(writerNo);
	// file.setFilePostNo(filePostNo); detail.jsp 받으면 거기에서 postNo로 꺼낼테니까 그거를 여기로 공유하는 방법으로 진행해보기
	// String fileName = request.getParameter("file");
	
	response.sendRedirect("list.jsp");
	
%>