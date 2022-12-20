package com.community.dao;

import java.util.List;

import com.community.dto.AdminCommentDto;
import com.community.util.SqlMapper;
import com.community.vo.Comment;

public class AdminCommentDao {

	private static AdminCommentDao instance = new AdminCommentDao();
	private AdminCommentDao() {}
	public static AdminCommentDao getInstance() {
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdminCommentDto> getCommentsByPostNo(int postNo) {
		return (List<AdminCommentDto>)SqlMapper.selectList("posts.getCommentsByPostNo", postNo);
	}
	
	
	public void insertComment(Comment comment) {
		SqlMapper.insert("posts.insertComment", comment);
	}
	
	public AdminCommentDto getCommentByCno(int cno) {
		return (AdminCommentDto)SqlMapper.selectOne("posts.getCommentByCno", cno);
	}
	
	public void updateComment(Comment comment) {
		SqlMapper.update("posts.updateComment", comment);
	}
}