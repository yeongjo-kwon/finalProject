package com.it.apt.adminOwner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.it.apt.adminOwner.model.AuthorityVO;
import com.it.apt.adminOwner.model.OwnerService;
import com.it.apt.member.model.MemberVO;

@Controller
@RequestMapping("/admin/adminOwner")
public class AdminOwnerController {
	private static final Logger logger = LoggerFactory.getLogger(AdminOwnerController.class);
	
	@Autowired OwnerService ownerService;
	
	@RequestMapping("/adminOwnerMain")
	public void ownerMain() {
		logger.info("Main 보여주기!");
	}

	@RequestMapping("/ownerManage")
	public void ownerManage(Model model) {
		logger.info("관리자 관리 화면 보여주기!");
	
		List<AuthorityVO> authList = ownerService.selectAllAuth();
	}
	
	@RequestMapping("/ownerResident.do")
	public void ownerResident() {
		logger.info("입주민 관리 화면 보여주기!");
	}
	
	@ResponseBody
	@RequestMapping(value="/excelUploadAjax.do", method = RequestMethod.POST)
	public ModelAndView excelUploadAjax(MultipartFile testFile, MultipartHttpServletRequest request, HttpServletRequest req) {
		HttpSession session=req.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("memVo");
		String id=memVo.getId();
		
		logger.info("업로드 진행, 실행중인 Id={}", id);
		
		MultipartFile excelFile = request.getFile("excelFile");
		
		logger.info("excelFile={}", excelFile);
		
		//컴퓨터 환경에 따라 파일 맞추기
		File destFile = new File("D:\\subin\\파이널프로젝트\\수빈폴더\\FinalPrj_4team_5"+excelFile.getOriginalFilename());
		
		try {
			excelFile.transferTo(destFile); //내가 설정한 위치에 내가 올린 파일 만들고
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		ownerService.excelUpload(destFile, id);
		
		//업로드 진행 후 다시 삭제
		destFile.delete();
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/residentList.do");	//나중ㅇ에 수정할거삼~~
		
		return view;
	}
	

	
}
