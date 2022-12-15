package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class AdminSuggestionDao {
	
	private static AdminSuggestionDao instance= new AdminSuggestionDao();
	private AdminSuggestionDao() {}
	public static AdminSuggestionDao getInstance() {
		return instance;
	}
	public void insertSuggestion(Suggestion suggestion) {
		SqlMapper.insert("posts.insertSuggestion", suggestion);
	}
}
