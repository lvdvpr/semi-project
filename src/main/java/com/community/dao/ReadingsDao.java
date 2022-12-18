package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Reading;


public class ReadingsDao {

	private static ReadingsDao instance = new ReadingsDao();
	private ReadingsDao() {}
	public static ReadingsDao getInstance() {
		return instance;
	}
	
	public void insertPostReadings(Reading reading) {
		SqlMapper.update("postReadings.insertPostReadings", reading);
	}
}
