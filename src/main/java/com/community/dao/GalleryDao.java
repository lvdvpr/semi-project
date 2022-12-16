package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.GalleryDto;
import com.community.util.SqlMapper;
import com.community.vo.Gallery;

public class GalleryDao {

	private static GalleryDao instance = new GalleryDao();
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		return instance;
	}
	
	// 전체 게시물 반환
	@SuppressWarnings("unchecked")
	public List<GalleryDto> getAllGallery(Map<String, Object> param) {
		return (List<GalleryDto>) SqlMapper.selectList("galleries.getAllGallery", param);
	}
	
	// 전체 게시물 수 반환
	public int getTotalRows() {
		return (int) SqlMapper.selectOne("galleries.getTotalRows");
	}
	
	public void insertGalleryPost(Gallery gallery) {
		SqlMapper.insert("galleries.insertGalleryPost", gallery);
	}
}
