package com.it.apt.household.model;

public interface HouseholdService {
	String selectCodeOwner(int aptNo);
	int insertCode(HouseholdVO vo);

}
