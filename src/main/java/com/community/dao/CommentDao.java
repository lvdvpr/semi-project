package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class CommentDao {
	
	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 댓글 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentsByCommentNo(int commentNo) {
		return (List<Comment>)SqlMapper.selectList("mypages.getCommentsByCommentNo", commentNo);
	}
	
	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 댓글 갯수를 반환한다.
	public int getTotalCommentRowsByEmpNo(int empNo) {
		return(Integer)SqlMapper.selectOne("mypages.getTotalCommentRows", empNo);
	}

}
