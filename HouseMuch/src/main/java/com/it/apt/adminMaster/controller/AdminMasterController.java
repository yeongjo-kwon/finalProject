package com.it.apt.adminMaster.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;

import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminMaster.model.ApartmentToSuperVO;
import com.it.apt.adminMaster.model.MasterService;
import com.it.apt.apart.model.ApartExcelVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.apart.model.ApartVO;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.household.model.HouseholdService;
import com.it.apt.household.model.HouseholdVO;

@Controller
@RequestMapping("/admin/adminMaster")
public class AdminMasterController {
	//사이트 운영자 컨트롤러 입니다 : 권한 ADMIN
	private static final Logger logger=LoggerFactory.getLogger(AdminMasterController.class);
	
	@Autowired MasterService masterService;
	@Autowired ApartService apartService;
	@Autowired HouseholdService householdService;
	
	@RequestMapping("/adminMaster.do")
	public void masterView(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("Main View! 출력 ~_~, searchVo={}", searchVo);
		
		searchVo.setRecordCountPerPage(11);
		searchVo.setFirstRecordIndex(0);
		List<Map<String, Object>> aptList = apartService.selectAllApt(searchVo);
		logger.info("등록된 아파트 aptList.size()={}", aptList.size());
		
		int msgCnt=masterService.countMsg();
		logger.info("확인되지 않은 메세지 msgCnt={}", msgCnt);
		
		//6개까지만 노출되게
		List<ApartmentToSuperVO> msgNList = masterService.selectNoReadMsg();
		logger.info("확인안한 쪽지함 msgNList.size()={}", msgNList.size());		
		
		model.addAttribute("aptList", aptList);
		model.addAttribute("msgCnt", msgCnt);
		model.addAttribute("msgNList", msgNList);
	}
	
	@RequestMapping("/adminMasterMsg.do")
	public void masterMsgView(@RequestParam(defaultValue="0")int idx,@ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("Msg View!, idx={}, searchVo={}", idx, searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(9);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(9);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ApartmentToSuperVO> msgList = masterService.selectAllMsg(searchVo);
		logger.info("받은 쪽지함 msgList.size()={}", msgList.size());
		
		int totalRecord=masterService.selectTotalRecord();
		logger.info("받은 쪽지 갯수 Y,N={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@ResponseBody
	@RequestMapping("/msgDetail.do")
	public ApartmentToSuperVO showDetail(@RequestParam(defaultValue="0") int idx) {
		logger.info("확인할 쪽지 idx={}", idx);
		
		int readFlag = masterService.readMsgFlag(idx);
		logger.info("읽음 확인 표시 readFlag={}", readFlag);
		
		ApartmentToSuperVO msgVo = masterService.selectMsgByIdx(idx);
		logger.info("선택한 msgVo={}", msgVo);
		
		return msgVo;
	}
	
	@RequestMapping("/delMsg.do")
	public String deleteMsg(@RequestParam(defaultValue="0")int idx, Model model) {
		logger.info("Msg 삭제, idx={}", idx);
		
		int cnt = masterService.deleteMsg(idx);
		logger.info("Msg 삭제 결과 cnt={}", cnt);
		
		String msg="메세지가 삭제 실패..", url="/admin/adminMaster/adminMasterMsg.do";
		if(cnt>0) {
			msg="메세지가 삭제되었습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping(value="/adminMasterApt.do")
	public void masterApt(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("Apt 전체 조회 View!, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(9);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());		
		
		searchVo.setRecordCountPerPage(9);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> aptList = apartService.selectAllApt(searchVo);
		logger.info("등록된 아파트 aptList.size()={}", aptList.size());
		
		int totalRecord = apartService.selectAptTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("aptList", aptList);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCode.do")
	public String findCode(@RequestParam(defaultValue="0")int aptNo) {
		logger.info("확인 할 code의 aptNo={}", aptNo);
		
		String code=householdService.selectCodeOwner(aptNo);
		logger.info("code={}", code);
		
		return code;
	}
	
	@RequestMapping(value="/adminMasterRegister.do", method = RequestMethod.GET)
	public void masterRegView() {
		logger.info("Register View!");
	}

	@RequestMapping(value="/adminMasterRegister.do", method = RequestMethod.POST)
	public String masterReg(ApartVO vo, Model model) {
		logger.info("아파트 등록!, aptVo={}", vo);
		
		int aptCnt = apartService.insertApt(vo);
		logger.info("아파트 등록 성공! cnt1={}", aptCnt);
		
		String houseCode=RandomStringUtils.randomAlphanumeric(10);
		logger.info("houseCode={}", houseCode);
		
		HouseholdVO hVo = new HouseholdVO();
		hVo.setAptNo(vo.getAptNo());
		hVo.setAuthCode("OWNER");
		hVo.setHouseholdCode(houseCode);
		
		logger.info("HouseholdVo={}", hVo);
		int cnt = householdService.insertCode(hVo);
		logger.info("Household insert cnt={}", cnt);
		
		String msg="아파트 등록 실패..", url="/admin/adminMaster/adminMasterRegister.do";
		if(cnt>0) {
			msg="아파트 등록이 되었습니다. 해당 아파트의 세대 코드는 "+ houseCode + "입니다.";
			url="/admin/adminMaster/adminMasterApt.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminAptDel.do")
	public String aptDel(@RequestParam(defaultValue="0")int aptNo) {
		logger.info("삭제 할 aptNo={}", aptNo);
		
		int cnt=apartService.deleteApt(aptNo);
		logger.info("삭제 여부 cnt={}", cnt);
		
		return "redirect:/admin/adminMaster/adminMasterApt.do";
	}
	
	@RequestMapping(value="/adminAptEdit.do", method=RequestMethod.GET)
	public void aptUpdateView(@RequestParam(defaultValue="0")int aptNo, Model model) {
		logger.info("수정화면 보여주기 aptNo={}", aptNo);
		
		ApartVO apartVo = apartService.selectAptByAptNo(aptNo);
		logger.info("해당 aptNo의 aptVo={}",apartVo);
		
		model.addAttribute("apartVo", apartVo);
	}

	@RequestMapping(value="/adminAptEdit.do", method=RequestMethod.POST)
	public String aptUpdate(@ModelAttribute ApartVO apartVo, Model model) {
		logger.info("수정할 aptVo={}", apartVo);
		
		int cnt=apartService.updateApt(apartVo);
		logger.info("수정 여부 cnt={}", cnt);
		
		String msg="수정 실패..", url="/admin/adminMaster/adminAptEdit.do";
		if(cnt>0) {
			msg="수정 되었습니다.";
			url="/admin/adminMaster/adminMasterApt.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/zipcode.do")
	public void zipcode() {
		logger.info("우편번호 조회");
	}
	
	@RequestMapping("/zipcodeAjax.do")
	public void zipcodeAjax(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception {
		logger.info("우편번호 조회");
		
		String currentPage = req.getParameter("currentPage");
		String countPerPage = req.getParameter("countPerPage");
		String confmKey = req.getParameter("confmKey");
		
		String keyword = req.getParameter("searchKeyword");
		
		logger.info("zipcode-keyword={}", keyword);
		String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;
		
		URL url = new URL(apiUrl);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		
		StringBuffer sb = new StringBuffer();
		String tempStr=null;
		while(true) {
			tempStr=br.readLine();
			if(tempStr == null) break;
			sb.append(tempStr);
		}
		
		br.close();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		
		response.getWriter().write(sb.toString());
	}
	
	//엑셀 출력 - 정석 POI방식
	@RequestMapping(value = "/excelDown.do")
	public void excelDown(HttpServletResponse response, Model model) throws Exception {
		logger.info("아파트 전체 목록 엑셀 출력!!");
		// 아파트 전체 조회 
		//=> 아파트번호, 아파트이름, 우편번호, 주소, 상세주소, 전체 세대수, 세대코드(소유주 기준), 
		//	소유주이름, 소유주 연락처123, 이메일
	    List<ApartExcelVO> aptList = apartService.excelApt();
	    
	    // 워크북 생성 - 시트, 행, 셀 세가지 기억
	    //Excel 2007이전버전 = HSSFWorkbook - 2007이상버전 = XSSFWorkbook
	    XSSFWorkbook wb = new XSSFWorkbook();	//엑셀 생성
	    XSSFSheet sheet = wb.createSheet("HOUSEMUCH_아파트_리스트");	//워크시트 생성 - 시트명 기입
	    XSSFRow row = null;	//행 생성
	    XSSFCell cell=null;	//셀 생성
	    
	    //폰트 설정 - 굵게, 기울게, 취소선, 글자색 등 지정 가능
	    XSSFFont font = wb.createFont();
	    font.setFontHeightInPoints((short) 14);	//글자 크기 설정
	    font.setBold(true);	//굵기
	    font.setFontName("맑은고딕");	//폰트 설정
	    
	    //셀스타일 지정 - 제목 스타일에 폰트 적용 
	    XSSFCellStyle styleHd = wb.createCellStyle();	//제목 스타일 생성
	    styleHd.setFont(font);	//위에 만들어 놓은 폰트 적용
	    //정렬
		styleHd.setAlignment(HorizontalAlignment.CENTER);
		styleHd.setVerticalAlignment(VerticalAlignment.CENTER);
	    
	    
	    sheet.autoSizeColumn(14); //사이즈 자동 설정해주는 메서드
	    
		int rowCount=0;
		int cellCount=0;
		
	    //행 제작 (1행 - th부분)
	    row=sheet.createRow(rowCount++);	//1행 생성
	    row.setHeight((short) 0x150);	//행 높이 지정
	    //셀에 데이터 넣기
	    cell = row.createCell(cellCount++);
	    cell.setCellValue("아파트 번호");
	    cell.setCellStyle(styleHd);
	    
	    cell = row.createCell(cellCount++);
	    cell.setCellValue("아파트 이름");
	    cell.setCellStyle(styleHd);
	    
	    cell = row.createCell(cellCount++);
	    cell.setCellValue("주소");
	    cell.setCellStyle(styleHd);
	    
	    cell = row.createCell(cellCount++);
	    cell.setCellValue("세대 수");
	    cell.setCellStyle(styleHd);
	    
	    cell = row.createCell(cellCount++);
	    cell.setCellValue("소유주 이름");
	    cell.setCellStyle(styleHd);

	    cell = row.createCell(cellCount++);
	    cell.setCellValue("연락처");
	    cell.setCellStyle(styleHd);

	    cell = row.createCell(cellCount++);
	    cell.setCellValue("이메일");
	    cell.setCellStyle(styleHd);
	    
	    //셀 생성할때, cell=null 대신에 row.createCell(cellCount++).setCellValue("제목"); 으로도 가능
	    
	    //
	    for(ApartExcelVO vo : aptList) {
	    	row = sheet.createRow(rowCount++);
	    	cellCount = 0;
	    	cell=row.createCell(cellCount++);
	    	cell.setCellValue(vo.getAptNo());

	    	cell=row.createCell(cellCount++);
	    	cell.setCellValue(vo.getAptName());
	    	
	    	cell=row.createCell(cellCount++);
	    	cell.setCellValue("["+vo.getZipcodeSeq()+"] "+vo.getAddress()+" "+vo.getAddressDetail());
	    	
	    	cell=row.createCell(cellCount++);
	    	cell.setCellValue(vo.getTotalHousehold());
	    	
	    	cell=row.createCell(cellCount++);
	    	if(vo.getMemberName()==null || vo.getMemberName().isEmpty()) {
	    		vo.setMemberName("미등록");
	    	}
	    	cell.setCellValue(vo.getMemberName());
	    	
	    	cell=row.createCell(cellCount++);
	    	String hp=vo.getHp1()+"-"+vo.getHp2()+"-"+vo.getHp3();
	    	if(vo.getHp1()==null || vo.getHp1().isEmpty()) {
	    		hp=" ";
	    	}
	    	cell.setCellValue(hp);
	    	
	    	cell=row.createCell(cellCount++);
	    	if(vo.getEmail()==null || vo.getEmail().isEmpty()) {
	    		vo.setEmail("미등록");
	    	}
	    	cell.setCellValue(vo.getEmail());
	    }
	    
	    
	    
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=HouseMuchApt.xlsx");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();

	}
}
