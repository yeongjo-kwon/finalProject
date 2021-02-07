package com.it.apt.userBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.apt.adminAll.model.BoardCtgService;
import com.it.apt.adminAll.model.BoardCtgVO;
import com.it.apt.common.FileUploadUtil;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.userBoard.model.UserBoardService;
import com.it.apt.userBoard.model.UserBoardVO;
import com.it.apt.userBoard.model.boardCommentVO;

@Controller
@RequestMapping("/userBoard")
public class UserBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserBoardController.class);

	@Autowired
	private UserBoardService userService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardCtgService ctgService;
	@Autowired
	private SuggestBoardService suggService;
	@Autowired
	private FileUploadUtil fileUtil;

	@Resource(name = "fileUploadProperties")
	Properties fileuploadProperties;

	@RequestMapping(value = "/userBoardWrite.do", method = RequestMethod.GET)
	public void boardWrite_get(Model model) {
		logger.info("입주민 게시판 글쓰기 화면 보여주기 - userBoardWrite");

		List<BoardCtgVO> ctgList = ctgService.selectAllCtg();
		logger.info("입주민 게시판 카테고리 전체조회 결과, ctgList.size={}", ctgList.size());

		model.addAttribute("ctgList", ctgList);
	}

	/*
	 * @RequestMapping(value = "/userBoardWrite.do", method = RequestMethod.POST)
	 * public String boardWrite_post(@ModelAttribute UserBoardVO userVo, HttpSession
	 * session, HttpServletRequest request, Model model) { // 파일업로드를 위한 request 매개변수
	 * 추가 // 1 logger.info("입주민 게시판 글쓰기, 파라미터 userVo={}", userVo);
	 * 
	 * MemberVO memVo = (MemberVO) session.getAttribute("memVo");
	 * userVo.setMemberNo(memVo.getMemberNo()); // 회원번호 세팅 String id =
	 * memVo.getId(); logger.info("session값, memVo={}", memVo);
	 * 
	 * // 2 int aptNo = memberService.selectAptNo(id); userVo.setAptNo(aptNo); //
	 * 아파트번호 세팅 logger.info("현재 로그인되어있는 회원의 아파트 번호 aptNo={}", aptNo);
	 * 
	 * int cnt = userService.insertUserBoard(userVo);
	 * logger.info("입주민 게시판 글쓰기 결과, cnt={}", cnt);
	 * 
	 * String msg = "글 등록 실패!", url = "/userBoard/userBoardWrite.do"; if (cnt > 0) {
	 * msg = "글이 등록되었습니다."; url = "/userBoard/userBoardList.do";
	 * 
	 * 파일업로드 List<Map<String, Object>> fileList=null; String originName="",
	 * fileName=""; long fileSize=0; try { fileList=fileUtil.fileUpload(request,
	 * FileUploadUtil.PDS_TYPE); logger.info("파일업로드, fileList.size={}",
	 * fileList.size());
	 * 
	 * for(Map<String, Object> fileMap : fileList) { originName=(String)
	 * fileMap.get("originalFileName"); fileName=(String) fileMap.get("fileName");
	 * fileSize=(Long)fileMap.get("fileSize"); }//for
	 * 
	 * } catch (IllegalStateException e) { logger.info("파일 업로드 실패!");
	 * e.printStackTrace(); } catch (IOException e) { logger.info("파일 업로드 실패!");
	 * e.printStackTrace(); }
	 * 
	 * userVo.setBoardOriginalFilename(originName);
	 * userVo.setBoardFilename(fileName); userVo.setBoardFilesize(fileSize);
	 * 
	 * int result=userService.userBoardFileUpload(userVo); logger.info("result={}",
	 * result);
	 * 
	 * }
	 * 
	 * // 3 model.addAttribute("userVo", userVo); model.addAttribute("msg", msg);
	 * model.addAttribute("url", url);
	 * 
	 * // 4 return "common/message"; }
	 */
	 @RequestMapping(value = "/userBoardWrite.do", method = RequestMethod.POST)
     public String boardWrite_post(@ModelAttribute UserBoardVO userVo, MultipartHttpServletRequest req, 
           HttpServletRequest request, Model model) { // 파일업로드를 위한 request 매개변수 추가
        // 1
        logger.info("입주민 게시판 글쓰기, 파라미터 userVo={}", userVo);

        HttpSession session=request.getSession();
        MemberVO memVo = (MemberVO) session.getAttribute("memVo");
        String id=memVo.getId();
        userVo.setMemberNo(memVo.getMemberNo());
        logger.info("session값, memVo={}", memVo);

        // 2
        int aptNo = memberService.selectAptNo(id);
        userVo.setAptNo(aptNo); // 아파트번호 세팅
        logger.info("현재 로그인되어있는 회원의 아파트 번호 aptNo={}", aptNo);

        int cnt = userService.insertUserBoard(userVo);
        logger.info("입주민 게시판 글쓰기 결과, cnt={}", cnt);

        String msg = "글 등록 실패!", url = "/userBoard/userBoardWrite.do";
        if (cnt > 0) {
           msg = "글이 등록되었습니다.";
           url = "/userBoard/userBoardList.do";
           
           /*파일업로드*/
           MultipartFile file = req.getFile("upfile");
           logger.info("file={}", file);
           
           //저장할 곳
           File dest = new File("저장할곳파일경로"+file.getOriginalFilename());
           String originName=file.getOriginalFilename();
           long fileSize=file.getSize();
           String fileName=fileUtil.getUniqueFileName(originName);
           
           try {
              file.transferTo(dest);
           }catch(IllegalStateException e) {
              logger.info("파일 업로드 실패!");
              e.printStackTrace();
           }catch(IOException e) {
              logger.info("파일 업로드 실패!2");
              e.printStackTrace();
           }
           
           //그다음 setting 해주고 insert 작업 
           userVo.setBoardFilename(fileName);
           userVo.setBoardOriginalFilename(originName);
           userVo.setBoardFilesize(fileSize);
           
           int result=userService.userBoardFileUpload(userVo);
           logger.info("파일업로드 결과, result={}",result);
        }

        // 3
        model.addAttribute("userVo", userVo);
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        // 4
        return "common/message";
     }

	@RequestMapping("/userBoardList.do")
	public String boardList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		// 1
		logger.info("입주민 게시판 목록 보여주기, 파라미터 searchVo={}", searchVo);

		MemberVO memVo = (MemberVO) session.getAttribute("memVo");

		String id = memVo.getId();
		int aptNo = memberService.selectAptNo(id);
		searchVo.setAptNo(aptNo);

		int memberNo = memVo.getMemberNo();
		logger.info("세션값 memVo={}", memVo);

		// 2
		// 페이징 처리 관련 세팅
		// [1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		// 블록 당 보여질 페이지수, 페이지 당 보여질 레코드 수 상수 처리한 거 가져오기
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVo 세팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> userList = userService.selectAllUserBoardView(searchVo);
		logger.info("입주민 게시판 목록 결과, userList.size={}", userList.size());

		int totalRecord = userService.selectTotalRecordFromUserBoard(searchVo);
		logger.info("입주민 게시판 글 개수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		Map<String, Object> authMap = suggService.searchAuthCode(memberNo);
		logger.info("로그인한 회원의 권한 등급 authMap={}", authMap);

		// 3
		model.addAttribute("userList", userList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("authMap", authMap);

		// 4
		return "userBoard/userBoardList";
	}

	@RequestMapping("/userBoardEdit.do")
	public void boardEdit() {
		logger.info("입주민 게시판 글수정 화면 보여주기 - userBoardEdit");
	}

	@RequestMapping(value = "/userBoardDetail.do", method = RequestMethod.GET)
	public String boardDetail_get(@RequestParam(defaultValue = "0") int boardNo, HttpSession session, Model model) {
		// 1
		logger.info("입주민 게시판 글 상세보기, 파라미터 boardNo={}", boardNo);

		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		int sessionMemberNo = memVo.getMemberNo();
		logger.info("세션값 sessionMemberNo={}", sessionMemberNo);

		// 2
		Map<String, Object> map = userService.selectByNoUserBoard(boardNo);
		logger.info("입주민 게시판 글 상세보기 결과, map={}", map);

		/*
		 * 로그인한 memberNo와 글작성한 memberNo 비교해서 != 일때 조회수 증가시키기 String memberNo=(String)
		 * map.get("memberNo"); logger.info("map에서 꺼낸 memberNo={}",memberNo);
		 */

		int cnt = userService.updateBoardReadcount(boardNo);
		logger.info("입주민 게시판 글 조회수 증가 결과, cnt={}", cnt);

		Map<String, Object> authMap = suggService.searchAuthCode(sessionMemberNo);
		logger.info("접속회원의 권한등급 조회결과 authMap={}", authMap);

		// 3
		model.addAttribute("map", map);
		model.addAttribute("authMap", authMap);
		model.addAttribute("sessionMemberNo", sessionMemberNo);

		// 4
		return "userBoard/userBoardDetail";
	}

	@RequestMapping("/userBoardDelete.do")
	public String userBoardDelete(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		// 1
		logger.info("입주민게시판 글 삭제하기, 파라미터 boardNo={}", boardNo);

		// 2
		int cnt = userService.deleteUserBoard(boardNo);

		String msg = "글  삭제 실패!", url = "/userBoard/userBoardDetail.do";
		if (cnt > 0) {
			msg = "글이 삭제되었습니다.";
			url = "/userBoard/userBoardList.do";
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}

	/* 입주민게시판 댓글 */
	@RequestMapping("/boardComment.do")
	public void boardComment(HttpSession session, Model model) {
		logger.info("입주민게시판 댓글 화면 보여주기 - boardComment");

		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		int sessionMemberNo = memVo.getMemberNo();
		logger.info("현재 로그인한 회원 번호, sessionMemberNo={}", sessionMemberNo);

		model.addAttribute("sessionMemberNo", sessionMemberNo);
	}

	@ResponseBody
	@RequestMapping("/commentWrite.do")
	public int commentWrite(@ModelAttribute boardCommentVO commVo, HttpSession session) {
		// 1
		logger.info("입주민게시판 댓글 작성하기, 파라미터 commVo={}", commVo);

		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		commVo.setMemberNo(memVo.getMemberNo());
		logger.info("세션값 memVo={}", memVo);

		// 2
		int cnt = userService.insertAnswer(commVo);
		logger.info("입주민게시판 댓글 작성 결과 cnt={}", cnt);

		// 3
		// 4
		return cnt;
	}

	@ResponseBody
	@RequestMapping("/commentList.do")
	public List<Map<String, Object>> commentList(@RequestParam int boardNo, Model model) {
		// 1
		logger.info("입주민게시판 댓글 조회하기, 파라미터 boardNo={}", boardNo);

		// 2
		List<Map<String, Object>> commList = userService.selectByNoComment(boardNo);
		logger.info("입주민게시판 댓글 조회 결과, commList.size={}", commList.size());

		// 3
		// 4
		return commList;
	}

	@ResponseBody
	@RequestMapping("/commentEdit.do")
	public int commentEdit(@ModelAttribute boardCommentVO commVo) {
		logger.info("입주민게시판 댓글 수정하기, 파라미터 commNo={}", commVo);

		int cnt = userService.updateComment(commVo);

		return cnt;
	}

	@ResponseBody
	@RequestMapping("/commentDelete.do")
	public int commentDelete(@RequestParam(defaultValue = "0") int commNo) {
		logger.info("입주민게시판 댓글 삭제하기, 파라미터 commNo={}", commNo);

		int cnt = userService.deleteComment(commNo);

		return cnt;
	}

	/*
	 * @RequestMapping("/test.do") public void test() {
	 * logger.info("입주민 게시판 글쓰기 화면 보여주기 - test"); }
	 */
}
