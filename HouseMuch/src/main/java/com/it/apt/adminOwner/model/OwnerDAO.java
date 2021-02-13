package com.it.apt.adminOwner.model;

import java.util.List;
import java.util.Map;

import com.it.apt.household.model.HouseholdMemVo;
import com.it.apt.household.model.HouseholdVO;

public interface OwnerDAO {
	List<AuthorityVO> selectAdminAuth();
	List<ResidentVO> showResidentByid(String id);
	int insertExcelCode(Map<String, Object> map);
	int insertExcelCodeMem(Map<String, Object> map);
	int delAllResInfo(int aptNo);
	List<String> selectHo(HouseholdVO vo);
	List<AdminAllVO> selectAdminLv2(int aptNo);
}
