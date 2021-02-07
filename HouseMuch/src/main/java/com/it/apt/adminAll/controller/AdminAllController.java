package com.it.apt.adminAll.controller;

import java.util.List;

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

import com.it.apt.adminAll.model.BoardCtgService;
import com.it.apt.adminAll.model.BoardCtgVO;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.controller.SuggestBoardController;

@Controller
@RequestMapping("/admin/adminAll")
public class AdminAllController {
	private static final Logger logger
	=LoggerFactory.getLogger(SuggestBoardController.class);

	@Autowired BoardCtgService ctgService;
	@Autowired MemberService memberService;

	@RequestMapping("/adminAllMain.do")
	public void adminAll() {
		logger.info("관리자 공통메인뷰페이지 보여주기 - adminAllMain");
	}

	/* 입주민 게시판 카테고리 관리 */
	@RequestMapping("/adminBoardCtg.do")
	public void ctgList(@ModelAttribute SearchVO searchVo,
			HttpSession session,Model model) {
		logger.info("입주민게시판 카테고리 목록 조회화면, 파라미터 searchVo={}"+searchVo);

		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();

		int aptNo=memberService.selectAptNo(id);
		searchVo.setAptNo(aptNo);
		logger.info("세션 조회 결과 memVo={}"+memVo);
		
		searchVo.setSearchCondition("BOARD_CTG_NAME");
		logger.info("searchVo에 담긴 searchCondition값={}"+searchVo.getSearchCondition());

		//페이징 처리 관련 세팅
		//[1] PaginationInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		//블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE); 
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVo 세팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<BoardCtgVO> ctgList
			=ctgService.selectAllBoardCtg(searchVo);
		logger.info("입주민 게시판 카테고리 목록 조회 결과, ctgList.size={}",ctgList.size());

		int totalRecord=ctgService.selectTotalRecordFromBoardCategory(searchVo);
		logger.info("입주민 게시판 카테고리 개수, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("ctgList", ctgList);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	@RequestMapping("/adminBoardCtgInsert.do") 
	public String ctgInsert(@ModelAttribute BoardCtgVO ctgVo,
			HttpSession session,Model model) { 
		//1
		logger.info("관리자 공통메뉴 - 게시판 카테고리 추가, 파라미터 ctgVo={}",ctgVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();
		int aptNo=memberService.selectAptNo(id);
		ctgVo.setAptNo(aptNo);
		logger.info("session값 조회 결과, memVo={}",memVo);
		
		//2
		int cnt=ctgService.insertBoardCtg(ctgVo);
		logger.info("게시판 카테고리 등록 결과, cnt={}",cnt);
		
		String msg="카테고리 등록 실패!", url="/admin/adminAll/adminBoardCtg.do";
		if(cnt>0) {
			msg="카테고리가 등록되었습니다.";
			url="/admin/adminAll/adminBoardCtg.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}

}
