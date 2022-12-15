package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.MyNoticeDto;
import com.community.util.SqlMapper;
import com.community.vo.Notice;

public class NoticeDao {
	
	@SuppressWarnings("unchecked")
	public List<MyNoticeDto> getNotices(Map<String, Object> param) {
		return (List<MyNoticeDto>)SqlMapper.selectList("mypages.getNotices", param);
	}
	// 직원번호를 전달 받아서 해당 직원에게 올 알람 갯수를 반환한다.
	public int getTotalNoticeRows(int empNo) {
		return (Integer)SqlMapper.selectOne("mypages.getTotalNoticeRows", empNo);
	}
	
	// 직원 번호를 전달 받아서 해당 직원에게 온 알람 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<Notice> getNoticesByReceiveEmpNo(int receiveEmpNo) {
		return (List<Notice>)SqlMapper.selectList("mypages.getNoticesByReceiveEmpNo", receiveEmpNo);
	}
	

}
