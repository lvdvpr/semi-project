<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	int no = StringUtils.stringToInt(request.getParameter("no"));
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	// 추천자 꺼내서 비교
	Map<String, Integer> param = new HashMap<>();
	param.put("postNo", no);
	param.put("empNo", employee.getNo());
	
	SuggestionDao suggestionDao = new SuggestionDao();

	Suggestion suggestions = suggestionDao.selectSuggestion(param);
	
	if (suggestions != null) {
		response.sendRedirect("detail.jsp?no=" + no + "&error=deny");
		return;
	}
	
	GalleryDao galleryDao = GalleryDao.getInstance();

	// 추천수 등록
	Suggestion suggestion = new Suggestion();
	suggestion.setSuggestionPostNo(no);
	suggestion.setEmpNo(employee.getNo());
	suggestionDao.insertSuggestion(suggestion);
		
	Gallery gallery = galleryDao.getPostByNo(no);
	gallery.setSuggestionCount(gallery.getSuggestionCount() +1);
	galleryDao.updatedPost(gallery);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>