package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Gallery;

public class GalleryDao {

	// 전체 게시물 반환
	@SuppressWarnings("unchecked")
	public List<Gallery> getAllGallery() {
		return (List<Gallery>) SqlMapper.selectList("galleries.getAllGallery");
	}
}
