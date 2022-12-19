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
	public int getTotalRows(Map<String, Object> param) {
		return (int) SqlMapper.selectOne("galleries.getTotalRows", param);
	}
	
	// 게시물 등록
	public void insertGalleryPost(Gallery gallery) {
		SqlMapper.insert("galleries.insertGalleryPost", gallery);
	}
	
	// postNo로 조회되는 게시물 반환
	public Gallery getPostByNo(int no) {
		return (Gallery) SqlMapper.selectOne("galleries.getPostByNo", no);
	}
	
	// 게시물 삭제
	public void deletedPost(Gallery gallery) {
		SqlMapper.update("galleries.deletedPost", gallery);
	}
	
	// postNo에 따른 상세정보 반환 - Dto
	public GalleryDto getGalleryDtoByNo(int no) {
		return (GalleryDto) SqlMapper.selectOne("galleries.getGalleryDtoByNo", no);
	}
	
	// 파일 번호 반환을 위한 게시글 번호 조회
	public int getSequence(Gallery gallery) {
		return (int) SqlMapper.selectOne("galleries.getSequence", gallery);
	}
	
	// 갤러리 수정
	public void updatedPost(Gallery gallery) {
		SqlMapper.update("galleries.updatedPost", gallery);
	}
}
