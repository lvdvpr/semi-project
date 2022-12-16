package com.community.dao;

import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {

	public void insertSuggestion(Suggestion suggestion) {
		SqlMapper.update("suggestions.insertSuggestion", suggestion);
	}
	
	public Suggestion selectSuggestion(Map<String, Integer>  param) {
		return (Suggestion) SqlMapper.selectOne("suggestions.selectSuggestion", param);
	}
}
