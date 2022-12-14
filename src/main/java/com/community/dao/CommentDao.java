package com.community.dao;

import java.util.List;

import com.commnuity.util.SqlMapper;
import com.community.dto.CommentDto;
import com.community.vo.Comment;

public class CommentDao {
	
	// comment 등록
	public void insertComment(Comment comment) {
		SqlMapper.insert("comments.insertComent", comment);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<CommentDto> getCommentsByPostNo(int postNo) {
		return (List<CommentDto>) SqlMapper.selectList("comments.getCommentsByPostNo", postNo);
	}
	
	// 상세정보 댓글 삭제시 필요한 comment번호 반환
	public Comment getCommentByNo(int commentNo) {
		return (Comment) SqlMapper.selectOne("comments.commentNo", commentNo);
	}
	
	public void updateComment(Comment comment) {
		SqlMapper.update("comments.updateComment", comment);
	}
}
