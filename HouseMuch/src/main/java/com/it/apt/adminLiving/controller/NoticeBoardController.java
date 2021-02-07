package com.it.apt.adminLiving.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
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

import com.it.apt.adminLiving.notice.model.NoticeBoardService;
import com.it.apt.adminLiving.notice.model.NoticeBoardVO;
import com.it.apt.common.LivingFileUtil;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin/adminLiving/adminNoti")
public class NoticeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	@Autowired
	private NoticeBoardService noticeService;
	@Autowired
	private com.it.apt.member.model.MemberService memService;
	@Autowired
	private com.it.apt.common.LivingFileUtil livingFileUtil;
	
	@Resource(name="fileUploadProperties")	//-> context-common.xml 에 넣은 id랑 일치
	private Properties fileUploadProps;
	//String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");
	


	@RequestMapping("/adminNotiRegister.do")
	public void adminNotice() {
		logger.info("adminNotiRegister 화면보여주기");
	}

	//***************** 공지 등록  (기본 공지 등록  + 일정 공지 등록 + 파일 첨부 ) ***************************//

	@SuppressWarnings("null")
	@RequestMapping(value = "/adminNotiRegister.do",method = RequestMethod.POST)
	public String adminNotice_post(@ModelAttribute NoticeBoardVO vo
			, HttpServletRequest request
			, Model model, HttpSession session) {
		logger.info("공지등록 처리, 처음들어온 vo={}",vo);

		//session에서 작성자 정보 가져와서 vo에 넣기
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		vo.setMemberNo(memVo.getMemberNo());
		vo.setHouseholdCode(memVo.getHouseholdCode());
		logger.info("공지등록 처리, 작성자 정보 들어간 vo={}",vo);


		/*
		 *  공지 분류가 3이고 + 일정값이 있으면 일정등록 먼저 하고나서 공지등록
		 *  일정값이 null이 아니면 -> 공지등록 메서드 호출 , null이면 if안타고 바로 일반공지 등록 메서드 호출
		 */
		int nCtgNo = vo.getnCtgNo();
		String startDateStr = vo.getStartDateStr();
		String endDateStr = vo.getEndDateStr();

		int result = noticeService.insertNotice(vo);
		logger.info("공지등록 처리 vo={}",vo);

		String msg="",url="";
		msg="등록 실패";
		url="/admin/adminLiving/adminNoti/adminNotiRegister.do";
		if(result>0){
			// 공지등록성공
			logger.info("공지등록 성공 후 반환된 result={}",result);
			msg="등록 성공";
			url="/admin/adminLiving/adminNoti/adminNotiList.do";
			logger.info("if안에서 url={}",url);

			// [공지등록성공 후 1]---------------------------------------> 1. 일정내용 있으면 일정등록
			if(nCtgNo==1) {	// 일정공지(분류번호1)
				//일정공지카테고리 No일 때만
				if( (startDateStr!=null || !startDateStr.isEmpty()) 
						&& (endDateStr!=null || !endDateStr.isEmpty()) ){
					// string인 날짜들을 java.sql.date로 변환해서 

					//일정 등록
					int scdResult = noticeService.insertScheduler(vo); 

					//일정등록 실패시  msg바뀜
					if(scdResult<=0){
						msg="일정 등록은 실패";
					}
					logger.info("일정등록 처리, scdResult={}",scdResult);
				}
			}//일정공지등록 if끝


			// [공지 + 일정까지 등록성공 후 2] -------------------------------------------> 2. 파일업로드 있으면 파일업로드 
			try {
				
				/*
				 * [프로퍼티파일에서 행정용으로 지정한 경로]
				 *  ROOT_FILEPATH = D:\\apt_LivingFile
				 *	ADD_FILEPATH = \\apt_addFile
				 *	NOTI_FILEPATH =\\apt_notiFile
				 */
				
				String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");
				List<Map<String, Object>> fileList
				 = livingFileUtil.fileUpload(request, LivingFileUtil.PDS_TYPE, customPath);
				//LivingFileUtil안에 있는 fileUpload가  (공지등록에서첨부요청한파일은 ,  LivinFileUtil클래스의  PDS_TYPE(일반파일분류)고 , 프로퍼티에있는 ROOT+NOTI_FILEPATH 경로로) 업로드해줌 

				int fileResult =0;
				logger.info("파일리스트 fileList.size()={}",fileList.size());
				//첨부한거 다 가져와
				for (Map<String, Object> fileMap : fileList) {
					String noticeOriginalFilename = (String)fileMap.get("originalFileName");
					String noticeFilename = (String)fileMap.get("fileName");
					long noticeFilesize = (Long)fileMap.get("fileSize");
					
					//업로드된 값이 있다면 담은값으로, 없다면 초기화한 값으로 vo에 셋팅
					vo.setNoticeFilename(noticeFilename);
					vo.setNoticeFilesize(noticeFilesize);
					vo.setNoticeOriginalFilename(noticeOriginalFilename);
					
					
					fileResult = noticeService.insertNoticeStorage(vo);
					logger.info("파일엽로드 결과 fileResult()={}",fileResult);
					
				}//for
				 
				
			} catch (IllegalStateException e) {
				logger.info("파일업로드 실패!-IllegalState");
				e.printStackTrace();

			} catch (IOException e) {
				logger.info("파일업로드 실패!-IO");
				e.printStackTrace();
			}
		


		}//기본공지 등록성공 후 if끝

		logger.info("model에 담기 직전 url={}",url);
		logger.info("model에 담기 직전 vo={}",vo);
		model.addAttribute("vo",vo);	//----------->기본 공지  + 일정 공지 + 다중 파일 : 있으면 정보 다 담긴 vo 
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}

	//*************************************  공지 조회  ********************************************//
	@RequestMapping("/adminNotiList.do")
	public String adminNotiList(@ModelAttribute NoticeBoardVO vo
			,@RequestParam(required = false) String searchKeyword
			,Model model, HttpSession session) {
		logger.info("공지전체리스트 조회 ,들어온직후 vo={} ",vo);
		//searchVo의 searchKeyword로 파라미터로 받은 String dong 넣음
		if(searchKeyword!=null && !searchKeyword.isEmpty()) {
			vo.setSearchKeyword(searchKeyword);
		}
		logger.info("검색어 파람, searchKeyword={}",vo.getSearchKeyword());

		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		//vo = new NoticeBoardVO();
		vo.setMemberNo(memVo.getMemberNo());
		vo.setHouseholdCode(memVo.getHouseholdCode()); //해당 아파트NO릐 공지리스트 조회 -> 서브쿼리로 xml에서 aptNo 조회
		logger.info("공지전체리스트 조회 ,파라미터 vo={} ",vo);


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


		List<NoticeBoardVO> list = noticeService.selectAllNoticeList(vo);
		logger.info("공지전체리스트 list.size={}",list.size());

		/*ㅋㅋㅋㅋㅋㅋㅋㅋ무한루픜ㅋㅋㅋㅋㅋㅋㅋ왜지..?ㅋㅋㅋㅋ근데 noticeNo가 0이던데 ㅋㅋㅋ
		 * for (int i = 0; i < list.size() ; i++) {
		 * list.add(noticeService.selectNoticeStorageByNoticeNo(vo.getNoticeNo())); }
		 */
		
		//[3] [2]에서 검색어로 검색 된 + 로그인한회원의 HOUSEHOLDCODE로 조회한 APT_NO의 공지게시판의 + 총 레코드 수를 
		int totalRecord=noticeService.selectTotalRecord(vo);
		logger.info("공지 글 개수, totalRecord={}", totalRecord);		
		pager.setTotalRecord(totalRecord);		//-------------------> pager에 세팅
		logger.info("공지 글 개수, totalRecord={}", totalRecord);	
		
	
		model.addAttribute("list",list);
		model.addAttribute("pager", pager);


		return "admin/adminLiving/adminNoti/adminNotiList";
	}


	//*************************************   공지 수정   ********************************************//
	@RequestMapping(value = "/adminNotiEdit.do",method = RequestMethod.GET)
	public String adminNotiEdit(@RequestParam(defaultValue = "0") int noticeNo
			, Model model, HttpServletRequest request) {


		logger.info("공지 수정 화면보여주기,파라미터 글번호 noticeNo={}",noticeNo);
		if(noticeNo==0) {
			model.addAttribute("msg","존재하지 않는 공지글입니다");
			model.addAttribute("url","/admin/adminLiving/adminNoti/adminNotiList.do");
			return "common/message";
		}


		//DB작업
		NoticeBoardVO vo = noticeService.selectNoticeByNo(noticeNo);// 공지정보 담고, 
		logger.info("파일조회 전 공지글번호로 조회결과 ,vo={}",vo);

		//vo = noticeService.selectNoticeStorageByNoticeNo(noticeNo);//파일정보도 같은 vo에 담고
		String fileInfo 
		= noticeService.getFileInfo(vo.getNoticeOriginalFilename(), vo.getNoticeFilesize(), request); //여기서 자꾸nullpointer야...아침에 갑자기그냥 됨 ㅋㅋㅋ
		logger.info("파일인포fileInfo={}", fileInfo);
		logger.info("파일조회 까지 한 공지글번호로 조회결과 ,vo={}",vo);

		model.addAttribute("fileInfo",fileInfo);
		model.addAttribute("vo",vo);
		return "admin/adminLiving/adminNoti/adminNotiEdit";
	}


	@RequestMapping(value = "/adminNotiEdit.do",method = RequestMethod.POST)
	public String adminNotiEdit_post(@RequestParam (defaultValue = "0")int noticeNo
			,@RequestParam (required = false)String oldFileName
			, HttpServletRequest request
			,@ModelAttribute NoticeBoardVO vo, Model model,HttpSession session) {
		logger.info("공지 수정 처리,vo={}",vo);
		logger.info("공지 수정 처리,파라미터 noticeNo={}, oldFileName={}",noticeNo,oldFileName);
		//session에서 작성자 정보 가져와서 vo에 넣기
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		vo.setMemberNo(memVo.getMemberNo());
		vo.setHouseholdCode(memVo.getHouseholdCode());
		logger.info("공지등록 처리, 작성자 정보 들어간 noticeNo={},vo={}",noticeNo,vo);		

		int fileResult =0;
		
		String msg="공지 수정 실패";
		String url="/admin/adminLiving/adminNoti/adminNotiEdit.do?noticeNo="+noticeNo+"&noticeFilename="+oldFileName;
		
		
		// [1] 글수정시 업로드처리 ---> 기존에 없었으면 공백이랑 0 으로 들어갈 예정
		String noticeFilename="", noticeOriginalFilename="";
		long noticeFilesize=0;
		try {
			String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");
			List<Map<String, Object>> fileList = livingFileUtil.fileUpload(request, LivingFileUtil.PDS_TYPE,customPath);		
			for (Map<String, Object> fileMap : fileList) {
				noticeOriginalFilename = (String)fileMap.get("originalFileName");
				noticeFilename = (String)fileMap.get("fileName");
				noticeFilesize = (Long)fileMap.get("fileSize");
				
				//업로드된 값이 있다면 담은값으로, 없다면 초기화한 값으로 vo에 셋팅
				vo.setNoticeFilename(noticeFilename);
				vo.setNoticeFilesize(noticeFilesize);
				vo.setNoticeOriginalFilename(noticeOriginalFilename);
				
				
				fileResult +=noticeService.updateNoticeStorage(vo);
				
			}//for
			logger.info("글수정시  파일업로드 성공 fileResult={}",fileResult);
			 
			
		} catch (IllegalStateException e) {
			logger.info("글수정시  파일업로드 실패");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("글수정시  파일업로드 실패");
			e.printStackTrace();
		}
	

		
		
		
		//DB 수정처리		
		int result=noticeService.updateNoticeAndScd(vo);
		logger.info("공지 수정 처리 결과, result={}",result);

		if(result>0) {
			msg="공지 수정 성공";
			url="/admin/adminLiving/adminNoti/adminNotiList.do";
			
			// 새로 업로드한 경우, 업데이트까지 성공 후 물리경로에서 파일 삭제
			if( !noticeFilename.isEmpty() || noticeFilename!=null ) {
				String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");
				File oldFile = new File(customPath, oldFileName); //customPath경로에있는 oldFileName파일을
				if(oldFile.exists()) {
					boolean bool = oldFile.delete();
					logger.info("기존파일 삭제여부 :{}", bool);
				}
			}//물리경로에서 파일 삭제
			
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";

	}


	//*******************************************  공지 삭제 (일정+첨부파일 같이 삭제 )  *******************************************//

	@RequestMapping(value = "/adminNotiDel.do", method =RequestMethod.GET)
	public void delNotice(@RequestParam(defaultValue = "0") int noticeNo,@RequestParam (required = false) String oldFileName) {
		logger.info("공지+일정 글 삭제 화면 보여주기");
	}

	@RequestMapping(value = "/adminNotiDel.do", method =RequestMethod.POST)
	public String delNotice(@RequestParam(defaultValue = "0") int noticeNo
			,@RequestParam(required = false) String oldFileName, HttpServletRequest request
			,@RequestParam String userPwd
			,HttpSession session 
			,Model model) {
		logger.info("글삭제 처리, 파라미터 noticeNo={}, oldFileName={}", noticeNo,oldFileName);
		
		String msg="공지 삭제 실패하였습니다."
				, url="/admin/adminLiving/adminNoti/adminNotiDel.do?noticeNo="+noticeNo
				+"&oldFileName="+oldFileName;
		
		MemberVO memVo = (MemberVO)session.getAttribute("memVo");
		String memid = memVo.getId();//세션에서 가져온 찐Pwd
																			//userPwd는 입력받은 Pwd
		logger.info("비번확인 후 (공지+일정) 삭제 처리 : 파라미터, noticeNo={},userPwd={}",noticeNo,userPwd);

		//입력받은 pwd로 비번체크
		int result = memService.loginCheck(memid, userPwd); // 입력받은 userPwd로 체크해서 
		if(result==1){	//LOGIN_OK -> 비번일치 => 삭제진행
			
			noticeService.deleteNoticeWithScdAndFileByNoticeNo(noticeNo);
			logger.info("공지+일정은 삭제됨");
			noticeService.deleteForDeleteNoticeStorage(noticeNo);
			logger.info("파일도 삭제됨");
			
			//기존 파일이 존재하면 기존 파일 삭제
			String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");
			File oldFile = new File(customPath, oldFileName);
			if(oldFile.exists()) {
				boolean bool=oldFile.delete();
				logger.info("공지삭제 후 기존 파일 삭제 여부 :{}", bool);
			}
			msg="공지와 스케줄을 삭제하였습니다.";
			url="/admin/adminLiving/adminNoti/adminNotiList.do";
		}else{
			msg="비밀번호를 확인하세요";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";

	}
	
	
	
}






