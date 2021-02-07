package com.it.apt.adminMaster.model;

import java.util.List;

import com.it.apt.common.SearchVO;

public interface MasterService {
	int insertMsg(ApartmentToSuperVO msgVo);
	List<ApartmentToSuperVO> selectAllMsg(SearchVO searchVo);
	ApartmentToSuperVO selectMsgByIdx(int idx);
	int readMsgFlag(int idx);
	int deleteMsg(int idx);
	int countMsg();
	List<ApartmentToSuperVO> selectNoReadMsg();
	int selectTotalRecord();

}
