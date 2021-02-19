package com.it.apt.adminAll.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.apt.adminAll.model.BoardCtgService;
import com.it.apt.adminAll.model.BoardCtgVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.apart.model.ApartVO;
import com.it.apt.common.BoardUtility;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.controller.SuggestBoardController;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.suggestBoard.model.SuggestCategoryVO;

@Controller
@RequestMapping("/admin/adminAll")
public class AdminAllController {
	private static final Logger logger
	=LoggerFactory.getLogger(SuggestBoardController.class);

	@Autowired BoardCtgService ctgService;
	@Autowired MemberService memberService;
	@Autowired SuggestBoardService suggService;
	@Autowired ApartService aptService;

	@RequestMapping("/adminAllMain.do")
	public void adminAll(HttpSession session, Model model) {
		logger.info("관리자 공통메인뷰페이지 보여주기 - adminAllMain");
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();
		logger.info("세션값 memVo={}",memVo);
		
		int aptNo=memberService.selectAptNo(id);
		logger.info("로그인한 회원의 아파트번호, aptNo={}",aptNo);
		
		ApartVO aptVo=aptService.selectAptByAptNo(aptNo);
		logger.info("===> 아파트 정보 aptVo={}",aptVo);
		
		model.addAttribute("aptVo", aptVo);
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
	
	@RequestMapping("/adminBoardCtgDelete.do")
	public String ctgDelete(@RequestParam(defaultValue = "0") int boardCtgNo
			, Model model) {
		logger.info("입주민게시판 카테고리 삭제하기, 파라미터 boardCtgNo={}", boardCtgNo);
		
		String msg="", url="";
		if(boardCtgNo==0) {
			msg="잘못된 url입니다.";
			url="/admin/adminAll/adminBoardCtg.do";
		}
		
		int cnt=ctgService.deleteBoardCtg(boardCtgNo);
		logger.info("카테고리 삭제 결과, cnt={}", cnt);
		
		msg="카테고리 삭제 실패!";
		url="/admin/adminAll/adminBoardCtg.do";
		if(cnt>0) {
			msg="카테고리가 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminBoardCtgEdit.do")
	public String ctgEdit(@ModelAttribute BoardCtgVO ctgVo, Model model) {
		//1
		logger.info("입주민 게시판 카테고리 수정하기, 파라미터 ctgVo={}",ctgVo);
		
		//2
		int cnt=ctgService.updateBoardCtg(ctgVo);
		logger.info("카테고리 수정 결과 cnt={}",cnt);
		
		String msg="카테고리 수정 실패!", url="/admin/adminAll/adminBoardCtg.do";
		if(cnt>0) {
			msg="카테고리가 수정되었습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	/* 건의게시판 관리 */
	@RequestMapping("/adminSuggBoard.do")
	public String adminSuggBoard(@ModelAttribute SearchVO searchVo
			,@ModelAttribute SearchVO searchVoN
			,HttpSession session
			,Model model){
		logger.info("건의게시판 관리화면 보여주기, 파라미터 처리완료된 searchVo={}, 미처리된 searchVoN={}"
				,searchVo,searchVoN);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		
		String id=memVo.getId();
		int aptNo=memberService.selectAptNo(id);
		searchVo.setAptNo(aptNo);
		
		int memberNo=memVo.getMemberNo();
		
		logger.info("세션값 memVo={}",memVo);
		
		//2
		//페이징 처리 관련 세팅
		//[1] PaginationInfo
		
		//###########################처리 완료 건 ###########################
		/*PaginationInfo pagingInfo=new PaginationInfo();
		//블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfo.setBlockSize(BoardUtility.BLOCK_SIZE); 
		pagingInfo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 세팅
		searchVo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());*/
		
		
		//###########################미처리 건 ###########################
		PaginationInfo pagingInfoN=new PaginationInfo();
		//블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfoN.setBlockSize(BoardUtility.BLOCK_SIZE); 
		pagingInfoN.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		pagingInfoN.setCurrentPage(searchVoN.getCurrentPage());
		
		//[2] SearchVo 세팅
		searchVoN.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		searchVoN.setFirstRecordIndex(pagingInfoN.getFirstRecordIndex());
		
		
		/*########################### 처리 완료 건 ###########################*/
		/*List<Map<String, Object>> list
			=suggService.suggBoardProcessedCases(searchVo);
		logger.info("건의 게시판 처리 완료 건 조회 결과, list.size={}",list.size());
		
		int totalRecord=suggService.suggBoardNotNull(searchVo);
		logger.info("건의 게시판 글 개수(처리완료 건), totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);*/
		
		/*########################### 미처리 건 ###########################*/
		List<Map<String, Object>> unList
			=suggService.suggBoardUnprocessedCases(searchVoN);
		logger.info("건의 게시판 미처리 건 조회 결과, unList.size={}",unList.size());
		
		int totalRecordN=suggService.suggBoardNull(searchVoN);
		logger.info("건의 게시판 글 개수(미처리 건), totalRecordN={}",totalRecordN);
		pagingInfoN.setTotalRecord(totalRecordN);
		
		
		Map<String, Object> authMap
			=suggService.searchAuthCode(memberNo);
		logger.info("로그인한 회원의 권한 등급 authMap={}",authMap);
		
		List<SuggestCategoryVO> scList
		=suggService.selectBySuggestCategory();
		logger.info("건의게시판 카테고리 scList.size={}", scList.size());	
		
		//3
		//model.addAttribute("suggList", list); //처리완료
		//model.addAttribute("pagingInfo", pagingInfo); //처리완료
		model.addAttribute("suggUnList", unList); //미처리
		model.addAttribute("pagingInfoN", pagingInfoN); //미처리
		model.addAttribute("authMap", authMap);
		model.addAttribute("scList", scList);
		
		return "admin/adminAll/adminSuggBoard";
	}
	

}
