package com.it.apt.adminLiving.add.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddDAOMyBatis implements AddDAO{
	@Autowired private SqlSession sqlSession;
	private String namespace="config.mybatis.mapper.oracle.addFacilityInfo.";
	
	
	@Override
	public List<AddCategoryVO> selectAddCategory() {
		return sqlSession.selectList(namespace+"selectAddCategory");
	}
	@Override
	public List<AddFacilityInfoVO> selectAllAddFacility(AddFacilityInfoVO vo) {
		return sqlSession.selectList(namespace+"selectAllAddFacility",vo);
	}
	@Override
	public int selectTotalRecord(AddFacilityInfoVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",vo);
	}
	@Override
	public int insertAddInfo(AddFacilityInfoVO vo) {
		return sqlSession.insert(namespace+"insertAddInfo",vo);
	}
	@Override
	public Map<String, Object> selectAddInfoByAddNo(int addNo) {
		return sqlSession.selectOne(namespace+"selectAddInfoByAddNo",addNo);
	}
	@Override
	public Map<String, Object> searchAuthCode(int MemberNo) {
		return sqlSession.selectOne(namespace+"searchAuthCode",MemberNo);
	}
	
//*************************** 입주민 신청 ***************************
	
	@Override
	public int checkHouseholdCodeInUse(AddOrderVO vo) {
		return sqlSession.selectOne(namespace+"checkHouseholdCodeInUse",vo);
	}
	@Override
	public int insertAddOrder(AddOrderVO vo) {
		return sqlSession.insert(namespace+"insertAddOrder",vo);
	}
	@Override
	public List<AddOrderVO> selectMemberInfoListByHouseholdCode(String householdCode) {
		return sqlSession.selectList(namespace+"selectMemberInfoListByHouseholdCode", householdCode);
				//(namespace+"selectMemberInfoListByHouseholdCode",householdCode);
	}
	@Override
	public List<AddOrderVO> selectAddOrderListByHouseholdCode(String householdCode) {
		return sqlSession.selectList(namespace+"selectAddOrderListByHouseholdCode",householdCode);
	}
	@Override
	public List<AddOrderVO> selectAddOrderListByMemberNo(int memberNo) {
		return sqlSession.selectList(namespace+"selectAddOrderListByMemberNo",memberNo);
	}
	@Override
	public int getChargedMonthsByAddOrderListNo(int addOrderListNo) {
	 	return sqlSession.selectOne(namespace+"getChargedMonthsByAddOrderListNo",addOrderListNo);
	}
	@Override
	public int updateOutdateByAddOrderListNo(int addOrderListNo) {
		return sqlSession.update(namespace+"updateOutdateByAddOrderListNo",addOrderListNo);
	}
	@Override
	public List<AddOrderExcelVO> selectAddOrderExcel(String householdCode) {
		return sqlSession.selectList(namespace+"selectAddOrderExcel",householdCode);
	}
	
	
	
	
}
