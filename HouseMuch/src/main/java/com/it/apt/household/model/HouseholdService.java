package com.it.apt.household.model;

import java.util.List;

public interface HouseholdService {
	String selectCodeOwner(int aptNo);
	int insertCode(List<HouseholdVO> vo);
	String findHouseholdCode(HouseholdVO vo);
	int insertHouseholdMember(List<HouseholdMemVo> hMemList);
	int updateAdmin(HouseholdVO vo);
	int deleteAdmin(String householdCode);
	HouseholdVO selectByCode(String householdCode);

}
