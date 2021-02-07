package com.it.apt.adminOwner.model;

import java.util.List;
import java.util.Map;

public interface OwnerDAO {
	List<AuthorityVO> selectAllAuth();
	List<ResidentVO> showResidentByid(String id);
	int insertExcelCode(Map<String, Object> map);
	int insertExcelCodeMem(Map<String, Object> map);
}
