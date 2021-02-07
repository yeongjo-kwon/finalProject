package com.it.apt.adminOwner.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.apt.common.ExcelRead;
import com.it.apt.common.ExcelReadOption;
import com.it.apt.member.model.MemberService;

@Service
public class OwnerServiceImpl implements OwnerService{
	@Autowired private OwnerDAO ownerDao;
	@Autowired private MemberService memberService;

	@Override
	public List<AuthorityVO> selectAllAuth() {
		return ownerDao.selectAllAuth();
	}

	@Override
	public List<ResidentVO> showResidentByid(String id) {
		return ownerDao.showResidentByid(id);
	}

	@Override
	public void excelUpload(File destFile, String id) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
		System.out.println("파일경로:"+destFile.getAbsolutePath());
		//파일경로 추가
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        
        //추출할 컬럼 명 추가
        excelReadOption.setOutputColumns("A","B","C","D","E","F");
      
        // 시작 행
        excelReadOption.setStartRow(2);

        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
        
        System.out.println("excelContent.size()="+excelContent.size());
        System.out.println("excelContent="+excelContent);
        
        int aptNo=memberService.selectAptNo(id);
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("excelContent", excelContent);
        paramMap.put("aptNo", aptNo);
        
        System.out.println("paramMap="+paramMap);
        
        //여기서부터 작업 시작
        
        try {
        	//insert 작업
        	ownerDao.insertExcelCode(paramMap);
        	ownerDao.insertExcelCodeMem(paramMap);
        	
        } catch (Exception e) {
        	e.printStackTrace();
        }	

		
	}
	
	
}
