package com.it.apt.adminLiving.add.model;

import java.util.List;
import java.util.Map;

public interface AddService {
	//부가시설 분류목록 조회
	List<AddCategoryVO> selectAddCategory();
	
	// 부가시설 목록 전체 조회
	List<AddFacilityInfoVO> selectAllAddFacility(AddFacilityInfoVO vo);
	
	//전체부가시설 수 (검색어로 검색된)
	int selectTotalRecord(AddFacilityInfoVO vo);

	//부가시설 정보 등록
	int insertAddInfo(AddFacilityInfoVO vo);
	
	//부가시설 상세조회
	Map<String, Object> selectAddInfoByAddNo(int addNo);

	//로그인한 회원의 권한 조회
	Map<String,Object> searchAuthCode(int memberNo);
	
	// 부가시설정보 수정
	int updateAddinfo(AddFacilityInfoVO vo);
	
	// 부가시설정보 삭제 (접수중단)
	int updateAddinfoOut(int addNo);
	
//*************************** 입주민 신청 ***************************

	//1. 이용중인지 체크
	int checkHouseholdCodeInUse(AddOrderVO vo);
	
	//2.부가시설 신청
	int insertAddOrder(AddOrderVO vo);
	
	//3.세대코드로 세대원정보 조회
	List<AddOrderVO> selectMemberInfoListByHouseholdCode(String householdCode);

	/*
	 * List<AddOrderVO> selectMemberInfoListByHouseholdCode(String householdCode);
	 */
	//4.세대코드로 세대원 조회 + 이용신청내역 조회
	List<AddOrderVO> selectAddOrderListByHouseholdCode(String householdCode);
	
	//5.회원번호로 신청/해지 내역 조회 
	List<AddOrderVO> selectAddOrderListByMemberNo(int memberNo);
	
	//6. 신청번호로 이용개월수 (이용료 납부횟수) 구하기 
	int getChargedMonthsByAddOrderListNo(int addOrderListNo);
	
	//7. 신청번호로 해지신청하기
	int updateOutdateByAddOrderListNo(int addOrderListNo);
	//7-1. 시설번호로 해지일자 null인 신청번호 구하기
	int getAddOrderListNo(AddOrderVO vo);
		
	
	// 8. 엑셀리스트 뽑아오기
	List<AddOrderExcelVO> selectAddOrderExcel(String householdCode);
}
