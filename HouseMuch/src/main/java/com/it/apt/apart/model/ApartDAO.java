package com.it.apt.apart.model;

import java.util.List;
import java.util.Map;

import com.it.apt.adminLiving.notice.model.NoticeBoardVO;
import com.it.apt.common.SearchVO;

public interface ApartDAO {
	String selectAptNameById(String id);
	List<Map<String, Object>> selectAllApt(SearchVO searchVo);
	int selectAptTotalRecord(SearchVO searchVo);
	int insertApt(ApartVO vo);
	ApartVO selectAptByAptNo(int aptNo);
	int deleteApt(int aptNo);
	int updateApt(ApartVO apartVo);
	List<ApartExcelVO> excelApt();
	List<Map<String, Object>> selectMainNotice(int aptNo);
}
