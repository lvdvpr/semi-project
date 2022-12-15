<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%

	String[] postNoArray = request.getParameterValues("postNo");
	// 여기
	// 게시글 사용자 번호 조회
	// 위에 postNo는 배열로 뺐는데 writerNo도 배열로 빼야하는 것 아닌지.
	int writerNo = StringUtils.stringToInt(request.getParameter("writerNo"));
	
	// 세션에서 가져온 로그인된 사용자 번호
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	int deleteUserNo = employee.getNo();
	
	// 여기
	// 로그인한 사용자의 아이디와 게시글 작성자의 아이디가 서로 다르면 게시글을 삭제할 수 없다.
	// if문을 살리면 writerNo를 list.jsp에서 가져와야하는데 checkbox에서 각 게시글의 writerNo를 어떻게 특정하는지
	// from문 / session객체 실행후 getNo / 안됨
//	if (writerNo == deleteUserNo) {
	
		QuestionDao questionDao = new QuestionDao();

		for (String postNoStr : postNoArray) {
			int no = Integer.parseInt(postNoStr);
			Question question = questionDao.getNoPost(no);
			
			question.setDeleted("D");
			questionDao.updatePost(question);	
//		}
	}
	
	// 오류 메세지 넣기

	response.sendRedirect("list.jsp");
%>
