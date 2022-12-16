package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Reading;

public class AdminReadingDao {

	private static AdminReadingDao instance= new AdminReadingDao();
	private AdminReadingDao() {}
	public static AdminReadingDao getInstance() {
		return instance;
	}
	public void insertReading(Reading reading) {
		SqlMapper.insert("posts.insertReading", reading);
	}
}
