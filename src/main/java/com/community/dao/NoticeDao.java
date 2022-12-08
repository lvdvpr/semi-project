package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Notice;

public class NoticeDao {
	
	// 직원 번호를 전달 받아서 해당 직원에게 온 알람 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<Notice> getNoticesByReceiveEmpNo(int receiveEmpNo) {
		return (List<Notice>)SqlMapper.selectList("mypages.getNoticesByReceiveEmpNo", receiveEmpNo);
	}
	
	public int getTotalNoticeRows() {
		return (Integer)SqlMapper.selectOne("mypages.getTotalNoticeRows");
	}

}
