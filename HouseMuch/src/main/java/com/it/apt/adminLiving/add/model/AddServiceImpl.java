package com.it.apt.adminLiving.add.model;

import java.util.List;

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
	
}
