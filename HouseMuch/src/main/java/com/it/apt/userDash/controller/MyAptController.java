package com.it.apt.userDash.controller;

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

import com.it.apt.adminAll.model.BoardCtgService;
import com.it.apt.adminAll.model.BoardCtgVO;
import com.it.apt.common.BoardUtility;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.userBoard.model.UserBoardService;

@Controller
@RequestMapping("/userDash")
public class MyAptController {
	private static final Logger logger
	=LoggerFactory.getLogger(MyAptController.class);
	
	@Autowired UserBoardService userBoardService;
	@Autowired MemberService memberService;
	@Autowired BoardCtgService ctgService;
	@Autowired SuggestBoardService suggBoardService;
	
	/* 내 게시판 목록 조회 - 입주민게시판 */
	@RequestMapping("/boardList.do")
	public void boardList(HttpSession session
			,@ModelAttribute SearchVO searchVo
			,Model model) {
		logger.info("입주민 대시보드 - 내 게시판 목록 조회하기, 파라미터 searchVo={}",searchVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		logger.info("로그인한 회원 정보 memVo={}",memVo);
		
		String id = memVo.getId();
		int aptNo = memberService.selectAptNo(id);
		searchVo.setAptNo(aptNo);

		int memberNo = memVo.getMemberNo();
		searchVo.setMemberNo(memberNo);
		
		// 페이징 처리 관련 세팅
		// [1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		// 블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfo.setBlockSize(BoardUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	
		// [2] SearchVo 세팅
		searchVo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<Map<String, Object>> list
			=userBoardService.selectAllByUserdash(searchVo);
		logger.info("입주민 대시보드 내 게시판 조회 결과, list.size={}",list.size());
		
		int totalRecord=userBoardService.selectTotalRecordUserdash(searchVo);
		logger.info("입주민 대시보드 내 글 개수, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("userList", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	/* 내 게시판 목록 조회 - 건의게시판 */
	@RequestMapping("/suggList.do")
	public void suggList(@ModelAttribute SearchVO searchVo
			,HttpSession session
			,Model model) {
		logger.info("입주민 대시보드 - 내 건의 게시판 조회하기, searchVo={}",searchVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		logger.info("로그인한 회원의 정보, memVo={}",memVo);
		
		String id=memVo.getId();
		int aptNo=memberService.selectAptNo(id);
		int memberNo=memVo.getMemberNo();

		searchVo.setAptNo(aptNo);
		searchVo.setMemberNo(memberNo);;
		
		//페이징 처리 관련 세팅
		//[1] PaginationInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		//블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfo.setBlockSize(BoardUtility.BLOCK_SIZE); 
		pagingInfo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 세팅
		searchVo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list
			=suggBoardService.selectAllByUserdashSugg(searchVo);
		logger.info("입주민 대시보드 - 건의 게시판 목록 결과, list.size={}",list.size());
		
		int totalRecord=suggBoardService.selectTotalRecordUserdashSugg(searchVo);
		logger.info("입주민 대시보드 - , totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("suggList", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	
}
