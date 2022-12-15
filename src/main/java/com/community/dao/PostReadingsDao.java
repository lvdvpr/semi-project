package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.PostReadings;

public class PostReadingsDao {

	private static PostReadingsDao instance = new PostReadingsDao();
	private PostReadingsDao() {}
	public static PostReadingsDao getInstance() {
		return instance;
	}
	
	public void updatePostReadings(PostReadings postReadings) {
		SqlMapper.update("postReadings.updatePostReadings", postReadings);
	}
}
