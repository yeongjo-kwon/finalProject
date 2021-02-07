package com.it.apt.adminMaster.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.apt.common.SearchVO;

@Service
public class MasterServiceImpl implements MasterService{
	@Autowired MasterDAO masterDao;

	@Override
	public int insertMsg(ApartmentToSuperVO msgVo) {
		return masterDao.insertMsg(msgVo);
	}

	@Override
	public List<ApartmentToSuperVO> selectAllMsg(SearchVO searchVo) {
		return masterDao.selectAllMsg(searchVo);
	}

	@Override
	public ApartmentToSuperVO selectMsgByIdx(int idx) {
		return masterDao.selectMsgByIdx(idx);
	}

	@Override
	public int readMsgFlag(int idx) {
		return masterDao.readMsgFlag(idx);
	}

	@Override
	public int deleteMsg(int idx) {
		return masterDao.deleteMsg(idx);
	}

	@Override
	public int countMsg() {
		return masterDao.countMsg();
	}

	@Override
	public List<ApartmentToSuperVO> selectNoReadMsg() {
		return masterDao.selectNoReadMsg();
	}

	@Override
	public int selectTotalRecord() {
		return masterDao.selectTotalRecord();
	}
}
