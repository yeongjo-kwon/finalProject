package com.it.apt.living.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.it.apt.adminLiving.notice.model.NoticeBoardService;
import com.it.apt.adminLiving.notice.model.NoticeBoardVO;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberVO;	

@Controller
@RequestMapping("/living/noti")
public class NoticeController {
 
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired private NoticeBoardService noticeService;
	
	@Resource(name="fileUploadProperties")	//-> context-common.xml 에 넣은 id랑 일치
	private Properties fileUploadProps;

	
//*************************************  공지리스트 출력    ****************************************
	@RequestMapping("/noticeList.do")
	public String adminNotiList(@ModelAttribute NoticeBoardVO vo
			,@RequestParam(required = false) String searchKeyword
			,Model model, HttpSession session) {
		logger.info("[입주민]공지전체리스트 조회 ,들어온직후 vo={} ",vo);
		//searchVo의 searchKeyword로 파라미터로 받은 String dong 넣음
		if(searchKeyword!=null && !searchKeyword.isEmpty()) {
			vo.setSearchKeyword(searchKeyword);
		}
		logger.info("[입주민]검색어 파람, searchKeyword={}",vo.getSearchKeyword());

		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		//vo = new NoticeBoardVO();
		vo.setMemberNo(memVo.getMemberNo());
		vo.setHouseholdCode(memVo.getHouseholdCode()); //해당 아파트NO릐 공지리스트 조회 -> 서브쿼리로 xml에서 aptNo 조회
		logger.info("[입주민]공지전체리스트 조회 ,파라미터 vo={} ",vo);


		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		PaginationInfo pager = new PaginationInfo();
		pager.setBlockSize(Utility.BLOCK_SIZE);
		pager.setRecordCountPerPage(10);	   //한페이지에 글 10줄씩 세팅
		pager.setCurrentPage(vo.getCurrentPage());
		logger.info("[입주민]지금 pager에들어간 현재페이지 ,vo.getCurrentPage()={} ",vo.getCurrentPage());

		//[2] 검색어변수 noticeBoardVO에 셋팅
		vo.setRecordCountPerPage(10);
		vo.setFirstRecordIndex(pager.getFirstRecordIndex());


		List<NoticeBoardVO> list = noticeService.selectAllNoticeList(vo);
		logger.info("[입주민]공지전체리스트 list.size={}",list.size());

		/*ㅋㅋㅋㅋㅋㅋㅋㅋ무한루픜ㅋㅋㅋㅋㅋㅋㅋ왜지..?ㅋㅋㅋㅋ근데 noticeNo가 0이던데 ㅋㅋㅋ
		 * for (int i = 0; i < list.size() ; i++) {
		 * list.add(noticeService.selectNoticeStorageByNoticeNo(vo.getNoticeNo())); }
		 */
		
		//[3] [2]에서 검색어로 검색 된 + 로그인한회원의 HOUSEHOLDCODE로 조회한 APT_NO의 공지게시판의 + 총 레코드 수를 
		int totalRecord=noticeService.selectTotalRecord(vo);
		logger.info("[입주민]공지 글 개수, totalRecord={}", totalRecord);		
		pager.setTotalRecord(totalRecord);		//-------------------> pager에 세팅
		logger.info("[입주민]공지 글 개수, totalRecord={}", totalRecord);	
		
	
		model.addAttribute("list",list);
		model.addAttribute("pager", pager);


		return "living/noti/noticeList";
	}
	
//***************************************** 공지상세보기 출력 + 첨부파일 다운로드 *********************************************//
	
	@RequestMapping(value = "/noticeDetail.do",method = RequestMethod.GET)
	public String noticeDetail(@RequestParam(defaultValue = "0") int noticeNo
			,HttpServletRequest request, Model model) {
		logger.info("공지상세페이지 화면보여주기,파라미터 글번호 noticeNo={}",noticeNo);
		if(noticeNo==0) {
			model.addAttribute("msg","존재하지 않는 공지글입니다");
			model.addAttribute("url","/living/notice/noticeList.do");
			return "common/message";
		}

		//[1]번호를 받아서 공지를 조회
		NoticeBoardVO vo = noticeService.selectNoticeByNo(noticeNo);
		logger.info("파일조회 전 공지글번호로 조회결과 ,vo={}",vo);
		//------------------------------------------------------------------여기까지 공지정보 가져오는데 
		//[2]파일정보는 새로생성한 fileVo에 담고
		//NoticeBoardVO fileVo = noticeService.selectNoticeStorageByNoticeNo(noticeNo);
		//---------------------------------여기서 새로 담기는게 아니라 파일정보만 들어가고 나머지 null들어감-> 새 vo로 조회만했는데 알아서 vo에 전부다들어감
		
		//파일명 가공해서model에 담음
		String fileInfo 
		= noticeService.getFileInfo(vo.getNoticeOriginalFilename(), vo.getNoticeFilesize(), request); //여기서 자꾸nullpointer야...아침에 갑자기그냥 됨 ㅋㅋㅋ
		logger.info("파일인포fileInfo={}", fileInfo);
		
		logger.info("@@@@@@@파일조회 까지 한 공지글번호로 조회결과 ,vo={}",vo);//나는 분명 새로운 fileVo를 만들었는데 여기에 다 담김 ,,뭐쥨ㅋㅋㅋㅋ
		//logger.info("@@@@@@@파일만 조회한,fileVo={}",fileVo);

		//작성자 이메일 안나와서 이메일 조회함-> 안함귀찮아
		
		
		
		model.addAttribute("fileInfo",fileInfo);
		model.addAttribute("vo",vo);//그냥다담김
		//model.addAttribute("fileVo",fileVo);//그냥 따로 보내자
		return "living/noti/noticeDetail";
		
	}
	
	
//************************************* 공지상세보기에서 파일다운로드 ****************************************************
	//다운로드처리하는 뷰페이지는 기존jsp페이지가 아니라 뷰페이지(ModelAndView 상속받는) 클래스, 여기서는 그 뷰페이지클래스로 보낸다
	@RequestMapping(value="/download.do", method = RequestMethod.GET)
	public ModelAndView download(@RequestParam(defaultValue = "0") int noticeNo, 
			@RequestParam String noticeFilename, HttpServletRequest request) {
		//1
		logger.info("[입주민]공지 상세보기에서 다운로드처리 페이지 , 매개변수 noticeNo={}, noticeFilename={}", noticeNo, noticeFilename);
		
		
		//2 다운로드 수 증가 : 안해
		
		//3
		Map<String, Object> map = new HashMap<String, Object>();
		//파일경로 구하기 
		String customPath=fileUploadProps.getProperty("ROOT_FILEPATH")+fileUploadProps.getProperty("NOTI_FILEPATH");

		//새로운 파일 만들어서 담음
		File file = new File(customPath, noticeFilename);
		map.put("file", file);
		logger.info("공지게시판 파일 저장경로 : customPath={}", customPath);
				
		// ModelAndView mav = new ModelAndView(viewName, Map<String,?> model);
		ModelAndView mav = new ModelAndView("livingDownloadView",map);

		//4
		return mav;
	}
	

	
//***************************************** 아파트일정 출력  *********************************************//
		
	@RequestMapping(value = "/aptScheduler.do",method = RequestMethod.GET)
	public void aptScheduler(@RequestParam(defaultValue = "0") int noticeNo) {
		logger.info("달력보여주기");
		
	}
	
	

	@ResponseBody
	@RequestMapping("/aptSchedulerList.do")
	public List<NoticeBoardVO> aptSchedulerList(@ModelAttribute NoticeBoardVO vo) {
		logger.info("달력에 일정 보여주기");
		/*
		 {  id: 999,
	        title: '시작일=종료',
	        start: '2021-02-01',
	        display: 'background',
	        color: '#000'
	      } 
		 */
		
		//몇월을 검색하는지 가져올 때 : HOUSEHOLD_CODE, searchMonth 받아옴
		List<NoticeBoardVO> scdList =  noticeService.selectScdByMonth(vo);
		logger.info("달력에 보여줄 일정 가져옴 일정 보여주기");
		return scdList;
		
	}
		
	

}
