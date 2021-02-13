package com.it.apt.mngcost.model;

import java.util.List;
import java.util.Map;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.energy.UtilityCostInfoVO;
import com.it.apt.household.model.HouseholdVO;

public interface MngcostDAO {
	List<MngcostMainCtgVO> selectMCtgList();
	List<MngcostSubCtgVO> selectSCtgList(int mngcostMCtgNo);
	List<MngcostPaymentListVO> selectPayList(String householdCode);
	List<MngcostInfoVO> selectMngcostInfoByClaim(InquiryInfoVO inqVo);
	List<AddFacilityInfoVO> plusAddInfo(InquiryInfoVO inqVo);
	
	//관리자
	List<MngcostInfoVO> adminSelectMngcostInfo(InquiryInfoVO inqVo);
	int cntAlreadyOrder(InquiryInfoVO inqVo);
	public int insertMngcostInfo(MngcostInfoVO mngcostInfoVo);
	int deleteMngcostInfo(int mngcostNo);
	MngcostInfoVO selectMngcostInfoAddMCtgNo(int mngcostNo);
	int updateMngcostInfo(MngcostInfoVO mngcostInfoVo);
	List<Map<String, Object>> selectMngcostOrderList(int aptNo);
	int insertMngcostPaymentList(InquiryInfoVO inqVo);
	List<String> selectMyDongList(int aptNo);
	List<String> selectMyHoList(int aptNo);
	List<Map<String, Object>> selectMngcostPaymentList(HouseholdVO householdVo);
	List<HouseholdVO> selectHouseholdList(int aptNo);
	int insertUtilityCostInfo(UtilityCostInfoVO utilityCostVo);
}
