package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {

	public void updateSuggestion(Suggestion suggestion) {
		SqlMapper.update("suggestions.updateSuggestion", suggestion);
	}
}
