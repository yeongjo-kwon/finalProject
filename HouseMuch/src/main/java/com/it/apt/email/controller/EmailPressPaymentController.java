package com.it.apt.email.controller;

import java.text.DecimalFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.apt.email.model.EmailVO;
import com.it.apt.mngcost.model.MngcostPaymentListVO;
import com.it.apt.mngcost.model.MngcostService;

@Controller
@RequestMapping("/email")
public class EmailPressPaymentController {
	private static final Logger logger
		=LoggerFactory.getLogger(EmailPressPaymentController.class);
	
	@Autowired private EmailService emailService;
	@Autowired private MngcostService mngcostService;
	
	@ResponseBody
	@RequestMapping(value = "/sendPressPayment.do", produces ="application/text; charset=utf8")
	public String sendPressPayment(@ModelAttribute MngcostPaymentListVO mngcostPaymentListVo) {
		logger.info("미납 건,  MngcostPaymentListVO={}", mngcostPaymentListVo);
		
		String email
			=mngcostService.selectEmailUnpaidHousehold(mngcostPaymentListVo.getHouseholdCode());
		logger.info("해당 세대 수신메일 조회 email={}", email);
		
		String msg="";
		if(email==null || email.isEmpty()) {
			msg="해당 세대에 수신가능한 email이 존재하지 않습니다.";
		}else {
			EmailVO eVo = new EmailVO();
			eVo.setSenderName("HOUSEMUCH");
			eVo.setSenderMail("info@housemuch.com");
			eVo.setReceiveMail(email);//수신 이메일
			eVo.setSubject("HOUSEMUCH 관리비 미납 안내");
			
			DecimalFormat df=new DecimalFormat("#,###");
			String message="<hr><h1>미납 안내</h1><br> ";
			message+="<p>귀 세대의 관리비가 미납되어 안내드립니다.<br>";
			message+="미납 내용 : "+mngcostPaymentListVo.getMngcostClaimdate().toString().split(" ")[0]+" 청구 관리비<br>";
			message+="미납 원금 : "+df.format(mngcostPaymentListVo.getMngcostTotalPrice())+"원<br>";
			message+="납부 기한 : "+mngcostPaymentListVo.getMngcostLimitdate()+"<br><br>";
			message+="<span>HOUSEMUCH를 이용해 주셔서 감사합니다.<br>더욱 편리한 서비스를  제공하기 위해 항상 최선을 다하겠습니다.</span>";
			eVo.setMessage(message);
			
			try {
				emailService.sendMail(eVo);
				msg="미납 안내 이메일 발송에 성공했습니다.";
			}catch(Exception e) {
				logger.info("이메일 발송 실패");
				e.printStackTrace();
				msg="미납 안내 이메일 발송에 실패했습니다.";
			}
		}
		return msg; // src/main/resources-config-spring => context-common.xml 계정입력
	}
}
