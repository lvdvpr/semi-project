package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.PostDto;
import com.community.util.SqlMapper;
import com.community.vo.FreeBoard;

public class FreeDao {
	
	private static FreeDao instance = new FreeDao();
	private FreeDao() {}
	public static FreeDao getInstance() {
		return instance;
	}

	public void insertPost(FreeBoard freeBoard) {
		SqlMapper.insert("freeboards.insertPost", freeBoard);
	}
	
	@SuppressWarnings("unchecked")
	public List<PostDto> getPosts(Map<String,Object> param) {
		return (List<PostDto>) SqlMapper.selectList("freeboards.getPosts", param);
	}
	
	public int getTotalRows(Map<String,Object> param) {
		return (Integer) SqlMapper.selectOne("freeboards.getTotalRows", param);
	}
	
	public FreeBoard getPostByNo(int postNo) {
		return (FreeBoard) SqlMapper.selectOne("freeboards.getPostByNo", postNo);
	}

	public PostDto getPostDtoByNo(int postNo) {
		return (PostDto) SqlMapper.selectOne("freeboards.getPostDtoByNo", postNo);
	}
	
	public void updatePost(FreeBoard freeBoard) {
		SqlMapper.update("freeboards.updatePost", freeBoard);
	}
	
	public void deletePostByNo(int postNo) {
		SqlMapper.delete("freeboards.deletePostByNo", postNo);
	}
}
