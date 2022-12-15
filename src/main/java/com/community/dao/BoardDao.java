package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Board;

public class BoardDao {

	private static BoardDao instance = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	public List<Board> getAllBoards() {
		return (List<Board>)SqlMapper.selectList("boards.getAllBoards");
	}
	
	
	
}
