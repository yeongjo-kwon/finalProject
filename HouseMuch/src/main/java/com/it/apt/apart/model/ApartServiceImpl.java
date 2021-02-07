package com.it.apt.apart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.apt.common.SearchVO;

@Service
public class ApartServiceImpl implements ApartService{
	@Autowired ApartDAO apartDao;

	@Override
	public String selectAptNameById(String id) {
		return apartDao.selectAptNameById(id);
	}

	@Override
	public List<Map<String, Object>> selectAllApt(SearchVO searchVo) {
		return apartDao.selectAllApt(searchVo);
	}

	@Override
	public int selectAptTotalRecord(SearchVO searchVo) {
		return apartDao.selectAptTotalRecord(searchVo);
	}

	@Override
	public int insertApt(ApartVO vo) {
		return apartDao.insertApt(vo);
	}

	@Override
	public ApartVO selectAptByAptNo(int aptNo) {
		return apartDao.selectAptByAptNo(aptNo);
	}

	@Override
	public int deleteApt(int aptNo) {
		return apartDao.deleteApt(aptNo);
	}

	@Override
	public int updateApt(ApartVO apartVo) {
		return apartDao.updateApt(apartVo);
	}

	@Override
	public List<ApartExcelVO> excelApt() {
		return apartDao.excelApt();
	}

}
