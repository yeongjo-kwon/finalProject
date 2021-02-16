package com.it.apt.mngcost.model;

import java.util.List;
import java.util.Map;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.energy.UtilityCostInfoVO;
import com.it.apt.household.model.HouseholdVO;


public interface MngcostService {
	//입주자
	List<MngcostMainCtgVO> selectMCtgList();
	List<MngcostSubCtgVO> selectSCtgList(int mngcostMCtgNo);
	List<MngcostPaymentListVO> selectPayList(String householdCode);
	List<MngcostInfoVO> selectMngcostInfoByClaim(InquiryInfoVO inqVo);
	List<AddFacilityInfoVO> plusAddInfo(InquiryInfoVO inqVo);
	List<MngcostPaymentListVO> selectUnpaidPaymentList(String householdCode);
	int updatePaymentListMulti(List<MngcostPaymentListVO> mngcostPaymentListList);
	
	//관리자
	List<MngcostInfoVO> adminSelectMngcostInfo(InquiryInfoVO inqVo);
	int cntAlreadyOrder(InquiryInfoVO inqVo);
	int insertMngcostInfoMulti(List<MngcostInfoVO> mngcostInfoList);
	int deleteMngcostInfoMulti(String[] mngcostNoArray);
	MngcostInfoVO selectMngcostInfoAddMCtgNo(int mngcostNo);
	int updateMngcostInfo(MngcostInfoVO mngcostInfoVo);
	List<Map<String, Object>> selectMngcostOrderList(int aptNo);
	int insertMngcostPaymentList(InquiryInfoVO inqVo);
	List<String> selectMyDongList(int aptNo);
	List<String> selectMyHoList(int aptNo);
	List<Map<String, Object>> selectMngcostPaymentList(HouseholdVO householdVo);
	List<HouseholdVO> selectHouseholdList(int aptNo);
	int insertUtilityCostInfoMulti(List<UtilityCostInfoVO> utilityCostList);
}
