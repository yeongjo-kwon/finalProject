package com.it.apt.adminLiving.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.common.LivingFileUtil;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin/adminLiving/adminAdd")
public class AdminAddController {

	private static final Logger logger = LoggerFactory.getLogger(AdminAddController.class);
	@Autowired private AddService addService;
	@Autowired private MemberService memberService;
	@Autowired private LivingFileUtil livingFileUtil;
	
	@Resource(name="fileUploadProperties")	//-> context-common.xml 에 넣은 id랑 일치
	private Properties fileUploadProps;
	
	
//--------------------------------------------부가시설 정보 등록(+썸넬등록)-------------------------------	
	
	@RequestMapping(value = "/adminAddInfoRegister.do",method = RequestMethod.GET)
	public void InfoRegister() {
		logger.info("AddInfoRegister - 부가시설 등록 보여주기");
	}

	@RequestMapping(value = "/adminAddInfoRegister.do",method = RequestMethod.POST)
	public String InfoRegister_post(@ModelAttribute AddFacilityInfoVO vo
			 ,HttpServletRequest request
			 ,HttpSession session, Model model) {
		logger.info("부가시설 등록 처리, 파라미터 vo={},addinfoImgFile={}",vo);
		logger.info("아파트번호 받아오나 확인 : aptNo={}",vo.getAptNo());
		
		//등록할 때 필요한 정보 조회 : 세션에서 householdCode + 작성자 id 받아와서 aptNo조회 
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		String householdCode = memVo.getHouseholdCode(); 
		int writerAptNo = memberService.selectAptNo(memVo.getId());
		
		String msg="부가시설 정보 등록 실패",url="/admin/adminLiving/adminAdd/adminAddInfoRegister.do";
		
		//등록할 때 필요한 정보 vo에 넣기
		vo.setAptNo(writerAptNo);
		vo.setHouseholdCode(householdCode);
		logger.info("부가시설 등록 처리에 필요한 값 셋팅 : householdCode={},aptNo={}",vo.getHouseholdCode(),vo.getAptNo());
		
		//파일업로드 처리
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
       if (!multiRequest.getFile("addinfoImgFile").isEmpty()) { //이미지파일이 있으면
			try {
				
				/*
				 * [프로퍼티파일에서 행정용으로 지정한 경로]
				 *  ROOT_FILEPATH = D:\\apt_LivingFile
				 *	ADD_FILEPATH = \\apt_addFile
				 */
				String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("ADD_FILEPATH");
				AddFacilityInfoVO imgVo = livingFileUtil.addinfoImgUp(request, LivingFileUtil.IMAGE_TYPE, customPath);

				//업로드된 값이 있다면 담은값으로, 없다면 초기화한 값으로 vo에 셋팅
				vo.setAddinfoImgFilename(imgVo.getAddinfoImgFilename());
				vo.setAddinfoImgOriginalFilename(imgVo.getAddinfoImgOriginalFilename());
				 
				logger.info("업로드 성공후 set된 img파일 ====> addinfoImgFilename={}",imgVo.getAddinfoImgFilename());
				logger.info("set된 원본 img파일 ====> addinfoImgOriginalFilename={}",imgVo.getAddinfoImgOriginalFilename());
				
				logger.info("썸네일 업로드 성공");
			} catch (IllegalStateException e) {
				logger.info("파일업로드 실패!-IllegalState");
				e.printStackTrace();
			} catch (IOException e) {
				logger.info("파일업로드 실패!-IO");
				e.printStackTrace();
			}

	   }//파일if		
		
       
		//DB등록처리
		int result = addService.insertAddInfo(vo);
		if(result >0) {
			msg="부가시설 정보를 등록하였습니다.";
			url="/admin/adminLiving/adminAdd/adminAddInfoList.do";
		}
	
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
//-------------------------------------------- 부가시설 목록 + 페이징+ 검색  ----------------------------------------	
	@RequestMapping("/adminAddInfoList.do")
	public String adminNotiList(@ModelAttribute AddFacilityInfoVO vo
			,@RequestParam(required = false) String searchKeyword
			,Model model, HttpSession session) {
		logger.info("부가시설 리스트 조회 ,들어온직후 vo={} ",vo);

		//카테고리 리스트 가져오기
//		List<AddCategoryVO> addCtgList = addService.selectAddCategory();
//		model.addAttribute("addCtgList",addCtgList);
		
		
		//상속받은 searchVo에 검색어 파라미터 넣음
		if(searchKeyword!=null && !searchKeyword.isEmpty()) {
			vo.setSearchKeyword(searchKeyword);
		}
		logger.info("검색어 파람, searchKeyword={}",vo.getSearchKeyword());

		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		vo.setHouseholdCode(memVo.getHouseholdCode()); //해당 아파트NO 부가시설만 조회 
				
		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		PaginationInfo pager = new PaginationInfo();
		pager.setBlockSize(Utility.BLOCK_SIZE);
		pager.setRecordCountPerPage(10);	   //한페이지에 글 10줄씩 세팅
		pager.setCurrentPage(vo.getCurrentPage());
		logger.info("지금 pager에들어간 현재페이지 ,vo.getCurrentPage()={} ",vo.getCurrentPage());

		//[2] 검색어변수 noticeBoardVO에 셋팅
		vo.setRecordCountPerPage(10);
		vo.setFirstRecordIndex(pager.getFirstRecordIndex());
		
		
		
		List<AddFacilityInfoVO> list = addService.selectAllAddFacility(vo);
		logger.info("부가시설 전체 목록 list.size={}",list.size());
		
		//[3] [2]에서 검색어로 검색 된 + 로그인한회원의 HOUSEHOLDCODE로 조회한 APT_NO의 부가시설 총 레코드 수를 
		int totalRecord=addService.selectTotalRecord(vo);
		logger.info("부가시설 개수, totalRecord={}", totalRecord);		
		pager.setTotalRecord(totalRecord);		//-------------------> pager에 세팅
		
		
		model.addAttribute("list",list);
		model.addAttribute("pager", pager);

		
		return "admin/adminLiving/adminAdd/adminAddInfoList";
	}

	
	
	
}

