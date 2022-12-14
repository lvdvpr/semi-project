package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.AdminPostDto;
import com.community.dto.PostListDto;
import com.community.util.SqlMapper;

import com.community.vo.Post;

public class AdminPostDao {

	private static AdminPostDao instance= new AdminPostDao();
	private AdminPostDao() {}
	public static AdminPostDao getInstance() {
		return instance;
	}
	
	// [관리자] 전체게시물 리스트 조회 
	@SuppressWarnings("unchecked")
	public List<PostListDto> getAllPosts(Map<String, Object> param) {
		return (List<PostListDto>)SqlMapper.selectList("posts.getAllPosts", param);
	}
	
	// [관리자]게시물 업데이트
	public void updatePost(Post post) {
		SqlMapper.update("posts.updatePost", post);
	}
	
	// [관리자] 전체 게시물 페이징 사용
	public int getTotalRows(Map<String, Object> param) {
		return (Integer)SqlMapper.selectOne("posts.getTotalRows", param);
	}
	
	// [관리자] 전체 게시물 페이징 사용
	public AdminPostDto getDetailPostByNo(int no) {
		return (AdminPostDto)SqlMapper.selectOne("posts.getDetailPostByNo", no);
	}
	// [관리자] post객체획득
	public Post getPostByNo(int no) {
		return (Post)SqlMapper.selectOne("posts.getPostByNo", no);
	}
	
	public void insertAnswer(Post post) {
		SqlMapper.insert("posts.insertAnswer", post);
	}
	
	
}
