package com.it.apt.living.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
//	@Autowired
//	private com.it.apt.member.model.MemberService memService;
//	@Autowired
//	private com.it.apt.common.LivingFileUtil livingFileUtil;
	
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

	
	
	
	
	
	
	
//	@RequestMapping("/noticeList.do")
//	public String noticeList(Model model, HttpSession session) {
//		logger.info("입주민 - 공지 전체리스트 조회 처리");
//		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
//		if(memVo==null) {
//			model.addAttribute("msg", "로그인이 필요합니다.");
//			model.addAttribute("url", "/login/login.do");
//			
//			return "common/message";
//		}
//		NoticeBoardVO vo = new NoticeBoardVO();
//		vo.setMemberNo(memVo.getMemberNo());
//		vo.setHouseholdCode(memVo.getHouseholdCode()); //해당 아파트NO릐 공지리스트 조회 -> 서브쿼리로 xml에서 aptNo 조회
//		
//		List<NoticeBoardVO> list = noticeService.selectAllNoticeList(vo);
//		logger.info("공지전체리스트 list.size={}",list.size());
//		
//		model.addAttribute("list",list);
//		
//		return "living/noti/noticeList";
//	}

	
	
	//************************* 아파트일정 출력  *****************************//
	@RequestMapping("/ynCalendar.do")
	public void ynCalendar() {
		logger.info("이나달력보여주기");
		
		
	}
	
	@RequestMapping("/aptScheduler.do")
	public void aptCalendar() {
		logger.info("달력보여주기");
		
		
	}
	
	/*
	
	@RequestMapping(value = "/ynCalendar.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "living/noti/ynCalendar";
	}
	
	*/
	
	@RequestMapping("/noticeDetail.do")
	public void noticeDetail() {
		logger.info("공지상세페이지");
		
		
	}

}
