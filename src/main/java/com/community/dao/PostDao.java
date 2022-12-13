package com.community.dao;

import java.util.List;

import java.util.Map;
import com.community.dto.MyPostDto;
import com.community.util.SqlMapper;

public class PostDao {

	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 게시글 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<MyPostDto> getPosts(Map<String, Object> param) {
		return (List<MyPostDto>)SqlMapper.selectList("mypages.getPosts", param);
	}
	
	// 작성자, 키워드, 직원번호를 전달 받아서 해당 직원번호의 사람이 작성한 게시글을 반환한다.
	public int getTotalPostRows(Map<String, Object> param) {
		return (Integer)SqlMapper.selectOne("mypages.getTotalPostRows", param);
	}
	
	// 작성자 직원번호를 전달받아서 해당 직원 번호의 사람이 작성한 게시글 갯수를 반환한다.
	public int getTotalPostRowsByEmpNo(int empNo) {
		return (Integer)SqlMapper.selectOne("mypages.getTotalPostRowsByEmpNo", empNo);
	}
}
