package com.community.dao;

public class FileDao {

	private static FileDao instance = new FileDao();
	private FileDao() {}
	public static FileDao getInstance() {
		return instance;
	}
}
