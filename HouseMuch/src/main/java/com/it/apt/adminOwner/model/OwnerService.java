package com.it.apt.adminOwner.model;

import java.io.File;
import java.util.List;

import com.it.apt.household.model.HouseholdVO;

public interface OwnerService {
	List<AuthorityVO> selectAdminAuth();
	List<ResidentVO> showResidentByid(String id);
	void excelUpload(File destFile, String id);
	int delAllResInfo(int aptNo);
	List<String> selectHo(HouseholdVO vo);
	List<AdminAllVO> selectAdminLv2(int aptNo);

}
