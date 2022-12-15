package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Notice;

public class AdminNoticeDao {
	
	private static AdminNoticeDao instance= new AdminNoticeDao();
	private AdminNoticeDao() {}
	public static AdminNoticeDao getInstance() {
		return instance;
	}
	
	//[관리자] 알림 추가 
	public void insertNotice(Notice notice) {
		SqlMapper.insert("posts.insertNotice", notice);
	}
}
