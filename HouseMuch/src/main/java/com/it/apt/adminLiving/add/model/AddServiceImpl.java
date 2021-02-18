package com.it.apt.adminLiving.add.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddServiceImpl implements AddService{
	@Autowired
	private AddDAO addDao;

	@Override
	public List<AddCategoryVO> selectAddCategory() {
		return addDao.selectAddCategory();
	}

	@Override
	public List<AddFacilityInfoVO> selectAllAddFacility(AddFacilityInfoVO vo) {
		return addDao.selectAllAddFacility(vo);
	}

	@Override
	public int selectTotalRecord(AddFacilityInfoVO vo) {
		return addDao.selectTotalRecord(vo);
	}

	@Override
	public int insertAddInfo(AddFacilityInfoVO vo) {
		return addDao.insertAddInfo(vo);
	}

	@Override
	public Map<String, Object> selectAddInfoByAddNo(int addNo) {
		return addDao.selectAddInfoByAddNo(addNo);
	}


	@Override
	public Map<String, Object> searchAuthCode(int memberNo) {
		return addDao.searchAuthCode(memberNo);
	}
	
	@Override
	public int updateAddinfo(AddFacilityInfoVO vo) {
		return addDao.updateAddinfo(vo);
	}
	@Override
	public int updateAddinfoOut(int addNo) {
		return addDao.updateAddinfoOut(addNo);
	}

//*************************** 입주민 신청 ***************************	
	@Override
	public int checkHouseholdCodeInUse(AddOrderVO vo) {
		return addDao.checkHouseholdCodeInUse(vo);
	}

	@Override
	public int insertAddOrder(AddOrderVO vo) {
		return addDao.insertAddOrder(vo);
	}
	

	@Override
	public 	List<AddOrderVO> selectMemberInfoListByHouseholdCode(String householdCode) {
		return addDao.selectMemberInfoListByHouseholdCode(householdCode);
	}

	@Override
	public List<AddOrderVO> selectAddOrderListByHouseholdCode(String householdCode) {
		return addDao.selectAddOrderListByHouseholdCode(householdCode);
	}

	@Override
	public List<AddOrderVO> selectAddOrderListByMemberNo(int memberNo) {
		return addDao.selectAddOrderListByMemberNo(memberNo);
	}

	@Override
	public int getChargedMonthsByAddOrderListNo(int addOrderListNo) {
		return addDao.getChargedMonthsByAddOrderListNo(addOrderListNo);
	}

	@Override
	public int updateOutdateByAddOrderListNo(int addOrderListNo) {
		return addDao.updateOutdateByAddOrderListNo(addOrderListNo);
	}
	@Override
	public int getAddOrderListNo(AddOrderVO vo) {
		return addDao.getAddOrderListNo(vo);
	}

	///엑셀리스트 만드는애
	@Override
	public List<AddOrderExcelVO> selectAddOrderExcel(String householdCode) {
		return addDao.selectAddOrderExcel(householdCode);
	}



	
	
}
