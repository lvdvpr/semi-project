package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.MyCommentDto;
import com.community.util.SqlMapper;

public class CommentDao {
	
	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 댓글 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<MyCommentDto> getComments(Map<String, Object> param) {
		return (List<MyCommentDto>)SqlMapper.selectList("mypages.getComments", param);
	}
	
	// 댓글 작성자, 직원번호를 전달 받아서 해당 직원번호의 사람이 작성한 댓글을 반환한다.
	public int getTotalCommentRows(Map<String, Object> param) {
		return (Integer)SqlMapper.selectOne("mypages.getTotalCommentRows", param);
	}
	
	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 댓글 갯수를 반환한다.
	public int getTotalCommentRowsByEmpNo(int empNo) {
		return(Integer)SqlMapper.selectOne("mypages.getTotalCommentRowsByEmpNo", empNo);
	}
	
	public void deleteCommentByCommentNo(int commentNo) {
		SqlMapper.update("mypages.deleteCommentByCommentNo", commentNo);
	}

}
