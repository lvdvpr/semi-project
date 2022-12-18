package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Fileshares;

public class FilesharesDao {

	private static FilesharesDao instance = new FilesharesDao();
	private FilesharesDao() {}
	public static FilesharesDao getInstance() {
		return instance;
	}
	
	public void insertFile(Fileshares file) {
		SqlMapper.insert("fileshares.insertFile", file);
	}
}
