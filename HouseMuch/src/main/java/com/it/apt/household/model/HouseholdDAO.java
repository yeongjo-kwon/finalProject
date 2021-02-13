package com.it.apt.household.model;


public interface HouseholdDAO {
	String selectCodeOwner(int aptNo);
	int insertCode(HouseholdVO vo);
	String findHouseholdCode(HouseholdVO vo);
	int insertHouseholdMember(HouseholdMemVo vo);
	int updateAdmin(HouseholdVO vo);
	int deleteAdmin(String householdCode);
	HouseholdVO selectByCode(String householdCode);
}
