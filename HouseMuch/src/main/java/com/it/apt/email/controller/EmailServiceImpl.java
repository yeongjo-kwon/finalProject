package com.it.apt.email.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.it.apt.email.model.EmailVO;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Autowired private JavaMailSender mailSender;

	@Override
	public void sendMail(EmailVO vo) {		
		try {
			//이메일 객체
			MimeMessage msg = mailSender.createMimeMessage();
			
			//받는 사람 설정 - 수신자, 받는 사람의 이메일 주소 객체 생성해서 수신자 이메일 주소를 담음
			msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getReceiveMail()));
			
			/*
			createMimeMessage() : MimeMessage 객체 생성 (이걸 이용해서 메세지 구성한 뒤 메일 발송)
			addRecipient() : 메세지 발신자를 설정
			InternetAddress() : 이메일 주소
			getReceiveMail() : 수신자 이메일 주소
			*/
			
			//보내는 사람 (이메일 주소 + 이름) - 이메일 발신자
			msg.addFrom(new InternetAddress[] { new InternetAddress(vo.getSenderMail(), vo.getSenderName())});
			
			msg.setSubject(vo.getSubject(), "utf-8");
			
			msg.setText(vo.getMessage(), "utf-8","html");
			
			//이메일 전송
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
