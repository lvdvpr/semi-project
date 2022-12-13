package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Post;

public class PostDao {

	// 작성자 직원번호를 전달 받아서 해당 직원 번호의 사람이 작성한 게시글 리스트를 반환한다.
	@SuppressWarnings("unchecked")
	public List<Post> getPostsByWriterNo(int writerNo) {
		return (List<Post>)SqlMapper.selectList("mypages.getPostsByWriterNo", writerNo);
	}
	
	// 작성자 직원번호를 전달받아서 해당 직원 번호의 사람이 작성한 게시글 갯수를 반환한다.
	public int getTotalPostRows(int empNo) {
		return (Integer)SqlMapper.selectOne("mypages.getTotalPostRows", empNo);
	}
}
