package com.it.apt.email.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.email.model.EmailVO;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired private EmailService emailService;
	
	///indexMail.do - index에서 아래 문의하기 이메일
	@RequestMapping("/indexMail.do")
	public String sendByIndex(@ModelAttribute EmailVO vo, Model model) {
		//제 이메일임다 ... 테스트 하는 이메일 설정 해줍사
		vo.setReceiveMail("salllena33@gmail.com");
		
		logger.info("문의하는 email 전송! vo={}", vo);
		
		model.addAttribute("url", "/main/index.do");
		
		//알아볼 수 있도록 구분하기 위한 작업
		//사용자가 입력한 제목
		String subject = vo.getSubject();
		//사용자가 입력한 내용
		String message = vo.getMessage();
		
		//구분
		vo.setSubject("HOUSEMUCH 문의메일"); //이메일에서 제목 구분
		message = "<h1>제목"+subject+"<h1> <br> <h2>보내는 이 "+vo.getSenderMail()+"<br>"+vo.getSenderName()+"님+<br></h2>" 
				 + "<br>" +"<h2>내용</h2><br>" + message; 
		vo.setMessage(message);
	
		try {
			emailService.sendMail(vo);
			model.addAttribute("msg", "해당 문의를 확인후 답변 드리겠습니다.");
		}catch(Exception e) {
			logger.info("이메일 발송 실패..");
			e.printStackTrace();
			model.addAttribute("msg", "이메일 발송 실패..");
		}
		return "common/message";
	}

}
