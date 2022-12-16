package com.community.dao;

import java.util.List;

import com.community.dto.CommentDto;
import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class CommentDao {
	
	public void insertComment(Comment comment) {
		SqlMapper.insert("comments.insertComment", comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<CommentDto> getCommentsByPostNo(int postNo) {
		return (List<CommentDto>) SqlMapper.selectList("comments.getCommentsByPostNo", postNo);
	}
	
	public Comment getCommentByCno(int commentNo) {
		return (Comment) SqlMapper.selectOne("comments.commentNo", commentNo);
	}
	
	public void deleteComment(int commentNo) {
		SqlMapper.delete("comments.deleteComment", commentNo);
	}
	
	public void updateComment(Comment comment) {
		SqlMapper.update("comments.updateComment", comment);
	}
}
