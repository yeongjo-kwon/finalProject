package com.it.apt.household.model;

public interface HouseholdDAO {
	String selectCodeOwner(int aptNo);
	int insertCode(HouseholdVO vo);
}
