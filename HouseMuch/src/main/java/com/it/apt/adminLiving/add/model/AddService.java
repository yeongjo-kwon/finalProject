package com.it.apt.adminLiving.add.model;

import java.util.List;

public interface AddService {
	//부가시설 분류목록 조회
	List<AddCategoryVO> selectAddCategory();
	
	// 부가시설 목록 전체 조회
	List<AddFacilityInfoVO> selectAllAddFacility(AddFacilityInfoVO vo);
	
	//전체부가시설 수 (검색어로 검색된)
	int selectTotalRecord(AddFacilityInfoVO vo);

	//부가시설 정보 등록
	int insertAddInfo(AddFacilityInfoVO vo);
}
