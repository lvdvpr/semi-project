
<%@page import="com.community.vo.Fileshares"%>
<%@page import="com.community.dao.FilesharesDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// boardNo, title, empName, important, content, file, writerNo
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\aa\\images");

	int boardNo = StringUtils.stringToInt(mr.getParameter("boardNo"));
	String title = mr.getParameter("title");
	String important = mr.getParameter("important");
	String content = mr.getParameter("content");
	
	// writerNo를 꺼내기 위한 session 객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	int writerNo = employee.getNo();
	
	GalleryDao galleryDao = GalleryDao.getInstance();
//	int sequence = galleryDao.getSequence();	
	
	Gallery gallery = new Gallery();
//	gallery.setNo(sequence);
	gallery.setBoardNo(boardNo);
	gallery.setTitle(title);
	gallery.setImportant(important);
	gallery.setContent(content);
	gallery.setWriterNo(writerNo);
	
	galleryDao.insertGalleryPost(gallery);
	
	// 파일 첨부하기
	
	String[] filenames = mr.getFilenames("fileName");
	for (String filename : filenames) {
		Fileshares fileShares = new Fileshares();
//		fileShares.setFilePostNo(sequence);
		fileShares.setFileName(filename);
		// ㅑㅜ
	}
	
	// fileNo 어떻게 받는지...? 게시글 등록 동시에 생성되는데...
	
	response.sendRedirect("list.jsp");
	
%>