package com.it.apt.mngcost.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.household.model.HouseholdVO;

@Repository
public class MngcostDAOMybatis implements MngcostDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.mngcost.";
	
	//입주자
	@Override
	public List<MngcostMainCtgVO> selectMCtgList() {
		return sqlSession.selectList(namespace+"selectMCtgList");
	}

	@Override
	public List<MngcostSubCtgVO> selectSCtgList(int mngcostMCtgNo) {
		return sqlSession.selectList(namespace+"selectSCtgList", mngcostMCtgNo);
	}

	@Override
	public List<MngcostPaymentListVO> selectPayList(String householdCode) {
		return sqlSession.selectList(namespace+"selectPayList", householdCode);
	}

	@Override
	public List<MngcostInfoVO> selectMngcostInfoByClaim(InquiryInfoVO inqVo) {
		return sqlSession.selectList(namespace+"selectMngcostInfoByClaim", inqVo);
	}
	
	@Override
	public List<AddFacilityInfoVO> plusAddInfo(InquiryInfoVO inqVo) {
		return sqlSession.selectList(namespace+"plusAddInfo", inqVo);
	}
	
	
	//관리자
	@Override
	public List<MngcostInfoVO> adminSelectMngcostInfo(InquiryInfoVO inqVo) {
		return sqlSession.selectList(namespace+"adminSelectMngcostInfo", inqVo);
	}

	@Override
	public int cntAlreadyOrder(InquiryInfoVO inqVo) {
		return sqlSession.selectOne(namespace+"cntAlreadyOrder", inqVo);
	}

	@Override
	public int insertMngcostInfo(MngcostInfoVO mngcostInfoVo) {
		return sqlSession.insert(namespace+"insertMngcostInfo", mngcostInfoVo);
	}

	@Override
	public int deleteMngcostInfo(int mngcostNo) {
		return sqlSession.delete(namespace+"deleteMngcostInfo", mngcostNo);
	}

	@Override
	public MngcostInfoVO selectMngcostInfoAddMCtgNo(int mngcostNo) {
		return sqlSession.selectOne(namespace+"selectMngcostInfoAddMCtgNo", mngcostNo);
	}

	@Override
	public int updateMngcostInfo(MngcostInfoVO mngcostInfoVo) {
		return sqlSession.update(namespace+"updateMngcostInfo", mngcostInfoVo);
	}

	@Override
	public List<Map<String, Object>> selectMngcostOrderList(int aptNo) {
		return sqlSession.selectList(namespace+"selectMngcostOrderList", aptNo);
		
	}

	@Override
	public int insertMngcostPaymentList(InquiryInfoVO inqVo) {
		return sqlSession.insert(namespace+"insertMngcostPaymentList", inqVo);
	}

	@Override
	public List<String> selectMyDongList(int aptNo) {
		return sqlSession.selectList(namespace+"selectMyDongList", aptNo);
	}

	@Override
	public List<String> selectMyHoList(int aptNo) {
		return sqlSession.selectList(namespace+"selectMyHoList", aptNo);
	}

	@Override
	public List<Map<String, Object>> selectMngcostPaymentList(HouseholdVO householdVo) {
		return sqlSession.selectList(namespace+"selectMngcostPaymentList", householdVo);
	}
}
