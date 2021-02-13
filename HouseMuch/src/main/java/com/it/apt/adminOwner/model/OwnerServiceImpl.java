package com.it.apt.adminOwner.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.apt.common.ExcelRead;
import com.it.apt.common.ExcelReadOption;
import com.it.apt.household.model.HouseholdVO;
import com.it.apt.member.model.MemberService;

@Service
public class OwnerServiceImpl implements OwnerService{
	private final static Logger logger = LoggerFactory.getLogger(OwnerServiceImpl.class);
	
	@Autowired private OwnerDAO ownerDao;
	@Autowired private MemberService memberService;

	@Override
	public List<AuthorityVO> selectAdminAuth() {
		return ownerDao.selectAdminAuth();
	}

	@Override
	public List<ResidentVO> showResidentByid(String id) {
		return ownerDao.showResidentByid(id);
	}

	@Override
	@Transactional
	public void excelUpload(File destFile, String id) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
		logger.info("파일경로:{}",destFile.getAbsolutePath());
		//파일경로 추가
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        
        //추출할 컬럼 명 추가
        excelReadOption.setOutputColumns("A","B","C","D","E","F");
      
        // 시작 행
        excelReadOption.setStartRow(2);

        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
        
        logger.info("excelContent.size()={}",excelContent.size());
        logger.info("excelContent={}",excelContent);
        
        int aptNo=memberService.selectAptNo(id);
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("excelContent", excelContent);
        paramMap.put("aptNo", aptNo);
        
        logger.info("paramMap={}",paramMap);
        
        //여기서부터 작업 시작
        int cnt=0;
        try {
        	//insert 작업
        	cnt=ownerDao.insertExcelCode(paramMap);
        	logger.info("@@@@@@@@@@@ [1] 번째 작업 cnt={}", cnt);
        	
        	cnt=ownerDao.insertExcelCodeMem(paramMap);
        	logger.info("@@@@@@@@@@@@@ [2] 번째 작업 cnt={}", cnt);
        } catch (Exception e) {
        	e.printStackTrace();
        }	

		
	}

	@Override
	public int delAllResInfo(int aptNo) {
		return ownerDao.delAllResInfo(aptNo);
	}

	@Override
	public List<String> selectHo(HouseholdVO vo) {
		return ownerDao.selectHo(vo);
	}

	@Override
	public List<AdminAllVO> selectAdminLv2(int aptNo) {
		return ownerDao.selectAdminLv2(aptNo);
	}
	
	
}
