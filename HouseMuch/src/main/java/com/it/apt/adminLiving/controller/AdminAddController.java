package com.it.apt.adminLiving.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Session;
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

import com.it.apt.adminLiving.add.model.AddCategoryVO;
import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.adminLiving.add.model.AddService;
import com.it.apt.adminLiving.notice.model.NoticeBoardService;
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
	@Autowired private NoticeBoardService livingService;
	
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
		logger.info("검색어 있으면, searchKeyword={}",searchKeyword);

		//카테고리 리스트 가져오기
		List<AddCategoryVO> addCtgList = addService.selectAddCategory();
		model.addAttribute("addCtgList",addCtgList);
		
		
		//상속받은 searchVo에 검색어 파라미터 넣음
		if(searchKeyword!=null && !searchKeyword.isEmpty()) {
			vo.setSearchKeyword(searchKeyword);
		}
		logger.info("검색어 파람, searchKeyword={}",vo.getSearchKeyword());

//		if(addCtgNo!=0) {
//			vo.setAddCtgNo(addCtgNo);
//			addCtgNo = vo.getAddCtgNo();
//			logger.info("카테고리로 검색, addCtgNo={}",addCtgNo);
//		}
//		
		
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

	
	@RequestMapping(value = "/adminAddEdit.do",method = RequestMethod.GET)
	public String adminAddEdit(@RequestParam(defaultValue = "0")int addNo
			,HttpServletRequest request ,Model model) {
		//http://localhost:9090/apt/admin/adminLiving/adminAdd/adminAddEdit.do?addNo=12
		
/*      
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		int memberNo = memVo.getMemberNo();
		
어차피 권한안맞으면 못들어옴
		Map<String, Object> authMap =  addService.searchAuthCode(memberNo);
		logger.info("접속회원의 권한등급 조회결과 authMap={}",authMap);
	
		//aptNo로 조회한 AUTH_CODE='LIVING_MNG'
		Object authCode = authMap.get("AUTH_CODE");
		if( !(authCode.equals("LIVING_MNG"))) {
			model.addAttribute("msg","수정권한이 없습니다");
			model.addAttribute("url","수정권한이 없습니다");
		}
		model.addAttribute("authMap", authMap);
*/		
		
		//1
		logger.info("부가시설 수정화면, 파라미터 addNo={}", addNo);
		if(addNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/adminLiving/adminAdd/adminAddEdit.do?addNo="+addNo);
			return "common/message";
		}
		
		
		//시설정보 불러오기 
		Map<String, Object> map = addService.selectAddInfoByAddNo(addNo);
		logger.info("부가시설 상세 결과 map={}",map);
		
		
		//썸넬파일정보 
		Object oldImgFileinfo = map.get("ADDINFO_IMG_ORIGINAL_FILENAME");
		//model에 담아서 보내기
		model.addAttribute("map", map);
		model.addAttribute("oldImgFileinfo", oldImgFileinfo);
		return "admin/adminLiving/adminAdd/adminAddEdit";
	
	}
	
	
	@RequestMapping(value = "/adminAddEdit.do",method = RequestMethod.POST)
	public String adminAddEdit_post(@ModelAttribute AddFacilityInfoVO vo,
			@RequestParam (required = false)String oldImgFileinfo, HttpServletRequest request,HttpSession session, Model model) {
		logger.info("부가시설 수정 처리, 파라미터 vo={},oldImgFileinfo={}", vo,oldImgFileinfo);
		
		//첨부파일있으면 
		String addinfoImgFilename="thumbnail-default.svg", addinfoImgOriginalFilename="thumbnail-default.svg";
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
		
		//2
		vo.setAddinfoImgFilename(addinfoImgFilename);
		vo.setAddinfoImgOriginalFilename(addinfoImgOriginalFilename);

		String msg="부가시설정보 수정 실패", url="/admin/adminLiving/adminAdd/adminAddEdit.do?addNo="+vo.getAddNo();
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		int memberNo = memVo.getMemberNo();
		Map<String, Object> authMap = addService.searchAuthCode(memberNo);
		String authCode = (String)authMap.get("AUTH_CODE");
		if(authCode.equals("LIVING_MNG")){	//권한체크
			
		
			
			int cnt = addService.updateAddinfo(vo);//권한맞으면 수정처리
			logger.info("부가시설 수정 결과, cnt={}", cnt);
	
			if(cnt>0) {
				msg="부가시설 정보가 수정되었습니다.";
				url="/living/add/addFacilityDetail.do?addNo="+vo.getAddNo();
				
//				// 새로 업로드한 경우, 업데이트까지 성공 후 기존파일 삭제
//				if( !fileName.isEmpty() || fileName!=null ) {
//					String upPath = fileUtil.getUploadPath(FileUploadUtil.PDS_TYPE, request);
//					File oldFile = new File(upPath, oldFileName);
//					if(oldFile.exists()) {
//						boolean bool = oldFile.delete();
//						logger.info("기존파일 삭제여부 :{}", bool);
//					}
//				}
			}//if
		}else {//권한 틀리면
			msg="부가시설 정보 수정 권한이 없습니다.행정관리과로 문의하세요.";	
		}	

		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/adminAddDel.do")
	public String addDel(@RequestParam(defaultValue = "0")int addNo,HttpSession session,Model model) {
		//http://localhost:9090/apt/admin/adminLiving/adminAdd/adminAddDel.do?addNo=11
		if(addNo==0) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("url","/admin/adminLiving/adminAdd/adminAddInfoList.do");
			
		}
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		int memberNo = memVo.getMemberNo();
		
		Map<String, Object> authMap =  addService.searchAuthCode(memberNo);
		logger.info("접속회원의 권한등급 조회결과 authMap={}",authMap);
	
		//aptNo로 조회한 AUTH_CODE='LIVING_MNG'
		Object authCode = authMap.get("AUTH_CODE");
		if( !(authCode.equals("LIVING_MNG"))) {
			model.addAttribute("msg","시설 운영 중단 권한이 없습니다");
			model.addAttribute("url","/admin/adminLiving/adminAdd/adminAddInfoList.do");
		}
		model.addAttribute("authMap", authMap);
		
		int cnt = addService.updateAddinfoOut(addNo);
		logger.info("부가시설 운영중단, 결과cnt={}",cnt);
		
		String msg="운영중단 처리 실패하였습니다.",url="/admin/adminLiving/adminAdd/adminAddInfoList.do";
		if(cnt>0) {
			msg="운영 중단 되었습니다. 현 시점부터 새로운 이용신청을 받을 수 없습니다.";
			url="/admin/adminLiving/adminAdd/adminAddInfoList.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
//	@RequestMapping("/adminAddDelList.do")
//	public String addDelList(Model model, HttpSession session) {
//		운영중단시설
//	}
	
}

