
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
	// 이미지하나 이상 경고 뜨고 난 이후에 게시물은 등록됨 나중에 error 코드 처리하기
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\APP\\web-workspace\\web-community\\src\\main\\webapp\\resources\\images");
	String[] filenames = mr.getFilenames("fileName");
	
	
	if (filenames == null) {
		response.sendRedirect("list.jsp?error=invalid");
		return;
	}

		int boardNo = StringUtils.stringToInt(mr.getParameter("boardNo"));
		String title = mr.getParameter("title");
		String important = mr.getParameter("important");
		String content = mr.getParameter("content");
		
		// writerNo를 꺼내기 위한 session 객체
		Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		
		Gallery gallery = new Gallery();
		gallery.setBoardNo(boardNo);
		gallery.setTitle(title);
		gallery.setImportant(important);
		gallery.setContent(content);
		gallery.setWriterNo(employee.getNo());
		
		galleryDao.insertGalleryPost(gallery);
	
		int sequence = galleryDao.getSequence(gallery);
		
		// 파일 첨부하기
		for (String filename : filenames) {
			Fileshares fileShares = new Fileshares();
			fileShares.setFilePostNo(sequence);
			fileShares.setFileName(filename);	
		
		FilesharesDao fileSharesDao = FilesharesDao.getInstance();
		fileSharesDao.insertFile(fileShares);
		
		}
		
		response.sendRedirect("list.jsp");
	
	
	
%>