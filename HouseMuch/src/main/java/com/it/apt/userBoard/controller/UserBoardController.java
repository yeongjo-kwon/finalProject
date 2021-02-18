package com.it.apt.userBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.it.apt.adminAll.model.BoardCtgService;
import com.it.apt.adminAll.model.BoardCtgVO;
import com.it.apt.common.BoardUtility;
import com.it.apt.common.FileUploadUtil;
import com.it.apt.common.PaginationInfo;
import com.it.apt.common.SearchVO;
import com.it.apt.common.Utility;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;
import com.it.apt.suggestBoard.model.SuggestBoardService;
import com.it.apt.suggestBoard.model.SuggestCategoryVO;
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
	public String boardWrite_post(@ModelAttribute UserBoardVO userVo, MultipartHttpServletRequest multiRequest, 
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
			/*
			MultipartFile tempFile = req.getFile("upfile"); //뷰페이지에서 input file의 name
			logger.info("tempFile={}", tempFile);

			if(!tempFile.isEmpty()) { //업로드 된 경우
				//저장할 곳
				String uploadPath1=request.getSession().getServletContext().getRealPath("file.upload.path");
				String uploadPath=fileuploadProperties.getProperty("file.upload.path.test");
				logger.info("uploadPath1={}, uploadPath={}", uploadPath1, uploadPath);
	
				File dest = new File(uploadPath);
				logger.info("dest={}", dest);
	
				String originName=tempFile.getOriginalFilename();
				long fileSize=tempFile.getSize();
				String fileName=fileUtil.getUniqueFileName(originName);
				logger.info("originName={}", originName);
				logger.info("fileSize={}", fileSize);
				logger.info("fileName={}", fileName);
	
				try {
					File myfile=new File(uploadPath,fileName);
					logger.info("업로드 된 파일, myfile={}", myfile);
					tempFile.transferTo(myfile); //파일 전송
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
			*/
			multiRequest = (MultipartHttpServletRequest) request;

			//결과를 저장할 리스트! VO대신 Map 사용. long타입은 Object로 넣음
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

			//getFileMap() 이용해서 Map을 받아온다! & 여러가지 파일 업로드를 받아옴
			Map<String, MultipartFile> filesMap =multiRequest.getFileMap();

			//keySet()으로 Iterator 받아오기
			Iterator<String> keyIter=filesMap.keySet().iterator();
			while(keyIter.hasNext()) {
				String key=keyIter.next(); //key가 inputType file의 name
				logger.info("file의 이름, key={}",key);
				MultipartFile tempFile=filesMap.get(key);
				//=> 업로드 된 파일을 임시파일 형태로 제공 - 이용해서 업로드 파일 된 정보(fileSize, originalFileName..)도 구할 수 있음
				
				logger.info("tempFile={}",tempFile);
				boolean bool=tempFile.isEmpty();
				logger.info("tempFile.isEmpty, true or false?={}",bool);
				if(!tempFile.isEmpty()) {	//업로드 된 경우
					//파일 크기
					long fileSize = tempFile.getSize();
					String originName = tempFile.getOriginalFilename();

					//변경된 파일 이름 구하기	getUniqueFileName은 메서드. 메서드 추가해줘야 함
					String fileName = fileUtil.getUniqueFileName(originName);

					//파일 전송-업로드 처리 => 파일 객체 생성
					//업로드 된 경로, 변경된 파일 이름
					String upPath = fileuploadProperties.getProperty("file.upload.path.test");
					File file = new File(upPath, fileName);
					try {
						tempFile.transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
						logger.info("업로드 에러!! - IillegalState");
					} catch (IOException e) {
						e.printStackTrace();
						logger.info("업로드 에러!! - IOE");
					}	//업로드 처리!! transferTo()

					//결과를 VO 혹은 MAP 으로 담아올 수 있음. 둘 다 가능하지만, MAP 으로!!
					Map<String, Object> map = new HashMap<String, Object>();
					//맵에서의 key가 vo의 멤버변수와 같은 역할
					map.put("originalFileName", originName);
					map.put("fileName", fileName);
					map.put("fileSize", fileSize);

					list.add(map);
				}//if
			}//while

			logger.info("list.size={}",list.size());
			if(list.size()>0) {
				String boardFilename="", boardOriginalFilename="";
				long boardFilesize=0;
				for(Map<String, Object> map : list) {
					boardOriginalFilename=(String) map.get("originalFileName");
					boardFilename=(String) map.get("fileName");
					boardFilesize=(Long) map.get("fileSize");
				}
	
				userVo.setBoardFilename(boardFilename);
				userVo.setBoardOriginalFilename(boardOriginalFilename);
				userVo.setBoardFilesize(boardFilesize);

				int result=userService.userBoardFileUpload(userVo);
				logger.info("파일업로드 결과, result={}",result);
			}
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
		pagingInfo.setBlockSize(BoardUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVo 세팅
		searchVo.setRecordCountPerPage(BoardUtility.RECORD_COUNT);
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

	@RequestMapping(value="/userBoardEdit.do",method = RequestMethod.GET)
	public String boardEdit_get(@RequestParam(defaultValue = "0") int boardNo,
			Model model) {
		//1
		logger.info("입주민 게시판 글수정 화면 보여주기, 파라미터 boardNo={}",boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/userBoard/userBoardList.do");

			return "common/message";
		}

		//2
		Map<String, Object> map
		=userService.selectByNoUserBoard(boardNo);
		logger.info("입주민게시판 글수정 화면 결과 map={}",map);

		List<BoardCtgVO> ctgList=ctgService.selectAllCtg();
		logger.info("입주민게시판 카테고리 조회 결과, ctgList.size={}",ctgList.size());

		//3
		model.addAttribute("map", map);
		model.addAttribute("ctgList", ctgList);

		return "userBoard/userBoardEdit";
	}

	@RequestMapping(value="/userBoardEdit.do",method = RequestMethod.POST)
	public String boardEdit_post(@ModelAttribute UserBoardVO userBoardVo
			,@RequestParam String oldFilename
			,MultipartHttpServletRequest multiRequest
			,HttpServletRequest request
			,HttpSession session
			,Model model) {
		//1
		logger.info("입주민게시판 글 수정하기, 파라미터 userBoardVo={},oldFilename={}",userBoardVo,oldFilename);

		MemberVO memVo=(MemberVO) session.getAttribute("memVo");
		int memberNo=memVo.getMemberNo();
		userBoardVo.setMemberNo(memberNo); //로그인 한 회원번호 세팅

		String id=memVo.getId();
		logger.info("입주민게시판 로그인 한 회원정보, memVo={}",memVo);

		int aptNo=memberService.selectAptNo(id);
		userBoardVo.setAptNo(aptNo); //로그인 한 회원 아파트번호 세팅
		logger.info("입주민게시판 로그인 한 회원 아파트 번호, aptNo={}",aptNo);

		//2. DB 작업
		int result=userService.updateUserBoard(userBoardVo);
		logger.info("입주민게시판 글 수정 결과, result={}", result);

		String msg="글 수정 실패!", url="/userBoard/userBoardDetail.do?boardNo="+userBoardVo.getBoardNo();
		if(result>0) {
			msg="글이 수정되었습니다.";

			/*파일업로드*/
			MultipartFile tempFile = multiRequest.getFile("upfile"); //뷰페이지에서 input file의 name
			logger.info("tempFile={}", tempFile);

			if(!tempFile.isEmpty()) { //업로드 된 경우
				//저장할 곳
				String uploadPath1=request.getSession().getServletContext().getRealPath("file.upload.path");
				String uploadPath=fileuploadProperties.getProperty("file.upload.path.test");
				logger.info("uploadPath1={}, uploadPath={}", uploadPath1, uploadPath);

				File dest = new File(uploadPath);
				logger.info("dest={}", dest);

				String originName=tempFile.getOriginalFilename();
				long fileSize=tempFile.getSize();
				String fileName=fileUtil.getUniqueFileName(originName);
				logger.info("originName={}", originName);
				logger.info("fileSize={}", fileSize);
				logger.info("fileName={}", fileName);

				try {
					File myfile=new File(uploadPath,fileName);
					logger.info("새로 업로드, myfile={}", myfile);
					tempFile.transferTo(myfile); //파일 전송
				}catch(IllegalStateException e) {
					logger.info("파일 업로드 실패!");
					e.printStackTrace();
				}catch(IOException e) {
					logger.info("파일 업로드 실패!2");
					e.printStackTrace();
				}
				userBoardVo.setBoardFilename(fileName);
				userBoardVo.setBoardFilesize(fileSize);
				userBoardVo.setBoardOriginalFilename(originName);

				int cnt=userService.updateFileUpload(userBoardVo);
				logger.info("입주민게시판 글 수정 - 파일업로드 결과, cnt={}", cnt);

				/* 새로 업로드 하는 경우, 기존 업로드한 파일 삭제 처리 */
				if(fileName!=null && !fileName.isEmpty()) {
					File oldFile=new File(uploadPath,oldFilename);
					logger.info("기존 업로드된 파일, oldFile={}", oldFile);
					if(oldFile.exists()) {
						boolean flag=oldFile.delete();
						logger.info("기존 파일 삭제 여부, flag={}", flag);
					}
				}//
			}//업로드했을 경우 if

		}//글 수정 성공한 경우 if

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}

	/* 입주민게시판 상세보기 */
	@RequestMapping("/userBoardDetail.do")
	public String boardDetail_get(@RequestParam(defaultValue = "0") int boardNo, HttpSession session, 
			HttpServletRequest request, Model model) {
		// 1
		logger.info("입주민 게시판 글 상세보기, 파라미터 boardNo={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg","잘못된 url입니다.");
			model.addAttribute("url","/userBoard/userBoardList.do");

			return "common/message";
		}

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
	public String userBoardDelete(@RequestParam(defaultValue = "0") int boardNo
			,@RequestParam String boardFilename
			,HttpServletRequest request
			,Model model) {
		// 1
		logger.info("입주민게시판 글 삭제하기, 파라미터 boardNo={}, boardFilename={}"
				, boardNo, boardFilename);

		// 2
		int cnt = userService.deleteUserBoard(boardNo);
		logger.info("입주민게시판 글 삭제 결과, cnt={}"+cnt);

		String msg = "글  삭제 실패!", url = "/userBoard/userBoardDetail.do";
		if (cnt > 0) {
			msg = "글이 삭제되었습니다.";
			url = "/userBoard/userBoardList.do";

			//int result=userService.deleteUserBoardFile(boardNo);
			//2logger.info("업로드된 파일 삭제, 결과 result={}"+result);

			//기존 파일이 존재하면 기존 파일 삭제
			String uploadLastPath=fileuploadProperties.getProperty("file.upload.path");
			logger.info("uploadLastPath={}"+uploadLastPath);

			String savePath1=request.getSession().getServletContext().getRealPath(uploadLastPath);
			String savePath=fileuploadProperties.getProperty("file.upload.path.test");
			logger.info("savePath1={},savePath={}"+savePath1,savePath);

			//업로드된 파일이 있는 경우에만 삭제
			if(boardFilename!=null && !boardFilename.isEmpty()) {
				File myfile=new File(savePath,boardFilename);
				if(myfile.exists()) {
					boolean flag=myfile.delete();
					logger.info("기존 파일 삭제 여부 flag={}"+flag);
				}
			}//안쪽 if

		}//바깥 if

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}
	
	/*
	 * @RequestMapping("/deleteUserBoardMulti.do") public String
	 * deleteUserBoardMulti(@RequestParam("boardNoArray[]") String[] boardNoArray
	 * ,@RequestParam String boardFilename ,HttpServletRequest request ,Model model)
	 * { logger.info("입주민게시판 다중 선택 삭제하기, 파라미터 boardNoArray={}",boardNoArray);
	 * 
	 * int cnt=userService.deleteUserBoardMulti(boardNoArray);
	 * logger.info("입주민게시판 다중 선택 삭제 결과, cnt={}",cnt);
	 * 
	 * String msg="글 삭제 실패!", url="/userBoard/userBoardList.do"; if(cnt>0) {
	 * msg="삭제되었습니다.";
	 * 
	 * //기존 파일이 존재하면 기존 파일 삭제 String
	 * uploadLastPath=fileuploadProperties.getProperty("file.upload.path");
	 * logger.info("uploadLastPath={}"+uploadLastPath);
	 * 
	 * String
	 * savePath1=request.getSession().getServletContext().getRealPath(uploadLastPath
	 * ); String savePath=fileuploadProperties.getProperty("file.upload.path.test");
	 * logger.info("savePath1={},savePath={}"+savePath1,savePath);
	 * 
	 * //업로드된 파일이 있는 경우에만 삭제 if(boardFilename!=null && !boardFilename.isEmpty()) {
	 * File myfile=new File(savePath,boardFilename); if(myfile.exists()) { boolean
	 * flag=myfile.delete(); logger.info("기존 파일 삭제 여부 flag={}"+flag); } }//안쪽 if }
	 * 
	 * model.addAttribute("msg", msg); model.addAttribute("url", url);
	 * 
	 * return "common/message"; }
	 */

	@RequestMapping("/fileDownload.do")
	public ModelAndView fileDownload(@RequestParam(defaultValue = "0") int bStorageNo, String boardFilename,
			HttpServletRequest request, Model model) {
		//1
		logger.info("파일 다운로드하기, 파라미터 bStorageNo={}, boardFilename={}",
				bStorageNo, boardFilename);

		//2
		//3
		Map<String, Object> map = new HashMap<String, Object>();
		
		String uploadLastPath=fileuploadProperties.getProperty("file.upload.path");
		String savePath1
		=request.getSession().getServletContext().getRealPath(uploadLastPath);

		String savePath=fileuploadProperties.getProperty("file.upload.path.test");
		logger.info("savePath1={}, savePath={}",savePath1,savePath);

		File myfile=new File(savePath,boardFilename);
		map.put("file", myfile);
		ModelAndView mav = new ModelAndView("downloadView",map);
		logger.info("파일 다운로드 결과, map.size={}",map.size());

		//4
		return mav;
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
