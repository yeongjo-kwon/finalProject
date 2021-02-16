package com.it.apt.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.adminLiving.notice.model.NoticeBoardVO;
import com.it.apt.apart.model.ApartService;
import com.it.apt.member.model.MemberService;
import com.it.apt.member.model.MemberVO;

@Controller
public class IndexController {

   private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

   @Autowired ApartService apartService;
   @Autowired MemberService memberService;
   
   @RequestMapping("/user/chat/chat.do")
   public void chat() {
	   logger.info("chat 화면 띄우기..");
   }
   
   @RequestMapping(value = "/user/mydash/userDash.do", method = RequestMethod.GET)
   public void index() {
      logger.info("에러가 안나라 얍!!");
   }   
   
   @RequestMapping("/main/index.do")
   public void index_main() {
      logger.info("비회원 메인 화면 전체 보여주기");
   }   

   @RequestMapping("/main/main.do")
   public void main(HttpServletRequest req,Model model) {
      logger.info("메인 화면 보여주기");
      
      HttpSession session = req.getSession();
      MemberVO memVo = (MemberVO) session.getAttribute("memVo");
      String aptName = apartService.selectAptNameById(memVo.getId());
      
      logger.info("로그인 한 id={}, 해당 회원의 아파트 이름 aptName={}", memVo.getId(), aptName);
      
      model.addAttribute("aptName",aptName);
   }
   
   @RequestMapping("/main/mainNotice.do")
   public void mainNotice(HttpServletRequest req,Model model) {
	   logger.info("메인화면에 보여줄 최근 Notice");
	   
	   HttpSession session = req.getSession();
	   MemberVO memVo = (MemberVO) session.getAttribute("memVo");
	   
	   int aptNo=memberService.selectAptNo(memVo.getId());
	   logger.info("aptNo={}", aptNo);

	   List<Map<String, Object>> noticeList=apartService.selectMainNotice(aptNo);
	   logger.info("noticeList.size()={}", noticeList.size());
	   
	   model.addAttribute("noticeList", noticeList);
   }
   
   @RequestMapping("/main/mainScheduler.do")
   public void mainScheduler() {
	   logger.info("메인에 보여줄 스케쥴러");
   }
   
   @ResponseBody
   @RequestMapping("/main/covid19.do")
   public void ajaxZipcode(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
	   logger.info("COVID19 API 실행!");
	   
	   String serviceKey = req.getParameter("serviceKey");
	   logger.info("serviceKey={}", serviceKey);
	   
	   // OPEN API 호출 URL 정보 설정
	   String apiUrl = "https://api.corona-19.kr/korea/?serviceKey="+serviceKey;
	   //URL 클래스 객체 생성 => 빨대 꽂았다고 생각
	   URL url = new URL(apiUrl);

	   BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
	   	    	
		//String 안쓰고 StringBuffer 사용하면 객체 매번 생성 X append만 하면 됨
		StringBuffer sb = new StringBuffer(); 
		String tempStr = null;
		while(true){
			tempStr = br.readLine();
			if(tempStr == null) break;
			sb.append(tempStr);
		}
	   	
	   	br.close();
	   	response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write(sb.toString());			// 응답결과 반환
		logger.info("AJAX COVID 실행 완료??????????????? {}",sb.toString());
	}   
   
}
