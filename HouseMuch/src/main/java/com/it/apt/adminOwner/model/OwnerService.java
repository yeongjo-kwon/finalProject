package com.it.apt.adminOwner.model;

import java.io.File;
import java.util.List;

public interface OwnerService {
	List<AuthorityVO> selectAllAuth();
	List<ResidentVO> showResidentByid(String id);
	void excelUpload(File destFile, String id);

}
