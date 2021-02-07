package com.it.apt.suggestBoard.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.model.SuggestAnswerVO;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.suggestBoard.model.SuggestBoardVO;
import com.it.apt.suggestBoard.model.SuggestCategoryVO;

@Controller
@RequestMapping("/suggestBoard")
public class SuggestBoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(SuggestBoardController.class);
	
	@Autowired private SuggestBoardService suggService;
	@Autowired private MemberService memberService;

	@RequestMapping(value="/suggestBoardWrite.do",method = RequestMethod.GET)
	public void boardWrite_get(Model model) {
		logger.info("건의 게시판 글쓰기 화면 보여주기 - suggestBoardWrite");
		
		List<SuggestCategoryVO> scList
		=suggService.selectBySuggestCategory();
		logger.info("건의게시판 카테고리 scList.size={}", scList.size());	
		
		model.addAttribute("scList", scList);
	}

	@RequestMapping(value="/suggestBoardEdit.do",method = RequestMethod.GET)
	public String boardEdit_get(@RequestParam(defaultValue = "0") int suggBoardNo,
			Model model) {
		//1
		logger.info("건의 게시판 글수정 화면 보여주기, 파라미터 suggBoardNo={}",suggBoardNo);
		
		if(suggBoardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/suggestBoard/suggestBoardList.do");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map
			=suggService.selectByNoSuggestBoard(suggBoardNo);
		logger.info("건의게시판 글수정 화면 결과 map={}",map);
		
		List<SuggestCategoryVO> scList
		=suggService.selectBySuggestCategory();
		logger.info("건의게시판 카테고리 scList.size={}", scList.size());	
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("scList", scList);
		
		return "suggestBoard/suggestBoardEdit";
	}
	
	@RequestMapping(value="/suggestBoardEdit.do",method = RequestMethod.POST)
	public String boardEdit_post(@ModelAttribute SuggestBoardVO suggVo,
			HttpSession session,Model model) {
		//1
		logger.info("건의게시판 글 수정하기, 파라미터 suggVo={}",suggVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		suggVo.setMemberNo(memVo.getMemberNo());
		logger.info("세션값 memVo={}",memVo);
		
		//2
		int cnt=suggService.updateSuggestBoard(suggVo);
		logger.info("글 수정 결과 cnt={}",cnt);
		
		String msg="글 수정 실패!", url="/suggestBoard/suggestBoardDetail.do?suggBoardNo="+suggVo.getSuggBoardNo();
		if(cnt>0) {
			msg="건의글이 수정되었습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}

	/* 건의게시판 상세보기 */
	@RequestMapping(value="/suggestBoardDetail.do")
	public String boardDetail(@RequestParam(defaultValue = "0") int suggBoardNo,
			HttpSession session,Model model) {
		//1
		logger.info("건의게시판 상세보기, 파라미터 suggBoardNo={}",suggBoardNo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		int sessionMemberNo=memVo.getMemberNo();
		logger.info("세션값 sessionMemberNo={}",sessionMemberNo);
		
		//2
		Map<String, Object> map
			=suggService.selectByNoSuggestBoard(suggBoardNo);
		logger.info("건의게시판 상세보기 결과 map={}",map);
		
		Map<String,Object> authMap=suggService.searchAuthCode(sessionMemberNo);
		logger.info("접속회원의 권한등급 조회결과 authMap={}",authMap);
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("authMap", authMap);
		model.addAttribute("sessionMemberNo", sessionMemberNo);
		
		//4
		return "suggestBoard/suggestBoardDetail";
	}

	/* 건의게시판 글쓰기 */
	@RequestMapping(value="/suggestBoardWrite.do",method = RequestMethod.POST)
	public String boardWrite_post(@ModelAttribute SuggestBoardVO suggVo,
			HttpSession session, Model model) {
		//1
		logger.info("건의게시판 글쓰기, 파라미터 suggVo={}",suggVo);
		
		//세션에 값 담기
		MemberVO memVo=(MemberVO)session.getAttribute("memVo");
		logger.info("세션값 memVo={}",memVo);
		
		suggVo.setMemberNo(memVo.getMemberNo()); //회원번호
		String memberId=memVo.getId(); //회원아이디
		logger.info("세션값 memberId={}", memberId);
		
		//2
		int aptNo=memberService.selectAptNo(memberId);
		suggVo.setAptNo(aptNo);
		logger.info("아파트번호 불러오기 결과, aptNo={}", aptNo);
		
		int cnt=suggService.insertSuggestBoard(suggVo);
		logger.info("건의게시판 글쓰기 결과, cnt={}", cnt);

		String msg="글 등록 실패!", url="/suggestBoard/suggestBoardWrite.do";
		if(cnt>0) {
			msg="글이 등록되었습니다.";
			url="/suggestBoard/suggestBoardList.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	/* 건의게시판 목록 */
	@RequestMapping("/suggestBoardList.do")
	public String boardList(@ModelAttribute SearchVO searchVo,
			HttpSession session,Model model) {
		//1
		logger.info("건의 게시판 목록 보여주기, 파라미터 searchVo={}",searchVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		
		String id=memVo.getId();
		int aptNo=memberService.selectAptNo(id);
		searchVo.setAptNo(aptNo);
		
		int memberNo=memVo.getMemberNo();
		
		logger.info("세션값 memVo={}",memVo);
		
		//2
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
		
		List<Map<String, Object>> list
			=suggService.selectAllSuggestBoardView(searchVo);
		logger.info("건의 게시판 목록 결과, list.size={}",list.size());
		
		int totalRecord=suggService.selectTotalRecordFromSuggestBoard(searchVo);
		logger.info("건의 게시판 글 개수, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		Map<String, Object> authMap
			=suggService.searchAuthCode(memberNo);
		logger.info("로그인한 회원의 권한 등급 authMap={}",authMap);
		
		//3
		model.addAttribute("suggList", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("authMap", authMap);
		
		//4
		return "suggestBoard/suggestBoardList";
	}
	
	@RequestMapping("/suggestBoardDelete.do")
	public String boardDelete(@RequestParam int suggBoardNo,
			Model model) {
		//1
		logger.info("건의게시판 삭제하기, 파라미터 suggBoardNo={}",suggBoardNo);
		
		//2
		int cnt=suggService.deleteSuggestBoard(suggBoardNo);
		logger.info("건의게시판 삭제 결과 cnt={}", cnt);
		
		String msg="글  삭제 실패!", url="/suggestBoard/suggestBoardDetail.do";
		if(cnt>0) {
			msg="글이 삭제되었습니다.";
			url="/suggestBoard/suggestBoardList.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	/* SUGGEST_ANSWER 댓글 게시판 */
	@RequestMapping("/suggestAnswer.do")
	public void suggestAnswer(HttpSession session,
			Model model) {
		logger.info("건의게시판 댓글 화면 보여주기");
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		int sessionMemberNo=memVo.getMemberNo();
		logger.info("sessionMemberNo={}",sessionMemberNo);
		
		model.addAttribute("sessionMemberNo", sessionMemberNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/answerInsert.do",method = RequestMethod.POST)
	public int answerInsert(@ModelAttribute SuggestAnswerVO answVo,
			HttpSession session) {
		//1
		logger.info("건의게시판 댓글 달기,세션 전 => 파라미터 answVo={}",answVo);
		
		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		answVo.setMemberNo(memVo.getMemberNo());
		
		logger.info("건의게시판 댓글, memVo={}",memVo);
		
		//2
		int cnt=suggService.insertAnswer(answVo);
		logger.info("건의게시판 댓글 등록 결과, cnt={}",cnt);
		
		String answContent=answVo.getAnswContent();
		logger.info("answContent={}",answContent);
		
		//4
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/answerList.do")
	public Map<String, Object> answerList(@RequestParam(defaultValue = "0") int suggBoardNo) {
		logger.info("건의게시판 답변 리스트, 파라미터 suggBoardNo={}",suggBoardNo);
		
		Map<String, Object> map
			=suggService.selectByNoAnswer(suggBoardNo);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/answerEdit.do")
	public int answerEdit(@ModelAttribute SuggestAnswerVO suggAnswVo) {
		logger.info("건의게시판 답변 수정하기, 파라미터 suggAnswVo={}",suggAnswVo);
		
		int cnt=suggService.updateAnswer(suggAnswVo);
		
		//cnt 0보다 클 때 처리
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/answerDelete.do")
	public int answerDelete(@RequestParam(defaultValue = "0") int answNo) {
		logger.info("건의게시판 답변 삭제하기, 파라미터 answNo={}",answNo);
		
		int cnt=suggService.deleteAnswer(answNo);
		logger.info("건의게시판 답변 삭제 결과, cnt={}",cnt);
		
		return cnt;
	}
}
