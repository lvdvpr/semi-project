package com.community.dao;

import com.commnuity.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {

	public void updateSuggestion(Suggestion suggestion) {
		SqlMapper.update("suggestions.updateSuggestion", suggestion);
	}
}
