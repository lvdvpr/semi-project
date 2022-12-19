package com.community.dao;

import java.util.List;
import java.util.Map;
import com.community.dto.QnaDto;
import com.community.util.SqlMapper;
import com.community.vo.Question;

public class QuestionDao {
	
	private static QuestionDao instance = new QuestionDao();
	private QuestionDao() {}
	public static QuestionDao getInstance() {
		return instance;
	}

	@SuppressWarnings("unchecked")
	public List<QnaDto> getAllPost(Map<String, Object> param) {
		return (List<QnaDto>) SqlMapper.selectList("questions.getAllPosts", param);
	}
	
	// detail.jsp에 필요한 상세정보를 반환한다. - QnaDto
	public QnaDto getPostByNo(int postNo) {
		return (QnaDto) SqlMapper.selectOne("questions.getPostByNo", postNo);
	}
	
	// (pagination에 필요) deleted가 N인 게시글의 수를 반환한다.
	public int getTotalRows(Map<String, Object> param) {
		return (int) SqlMapper.selectOne("questions.getTotalRows", param);
	}
	
	// list.jsp에서 질문글 등록
	public void insertPost(Question question) {
		SqlMapper.insert("questions.insertPost", question);
	}
	
	// list.jsp에서 답글 등록
	public void insertPostAnswer(Question question) {
		SqlMapper.insert("questions.insertPostAnswer", question);
	}
	
	@SuppressWarnings("unchecked")
	public List<QnaDto> detailAnswer(int postNo) {
		return (List<QnaDto>) SqlMapper.selectList("questions.detailAnswer", postNo);
	}

	
	// 게시판 번호 no와 일치하는 객체 하나(게시글)를 가져온다. - 상세정보, Question 객체
	public Question getNoPost(int no) {
		return (Question) SqlMapper.selectOne("questions.getNoPost", no);
	}
	
	// 게시판 상세정보 삭제/수정
	public void updatePost(Question question) {
		SqlMapper.update("questions.updatePost", question);
	}
	
	public void deletedPost(Question question) {
		SqlMapper.update("questions.deletedPost", question);
	}
}
