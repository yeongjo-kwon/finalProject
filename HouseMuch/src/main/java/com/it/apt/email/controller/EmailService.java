package com.it.apt.email.controller;

import com.it.apt.email.model.EmailVO;

public interface EmailService {
	public void sendMail(EmailVO vo);
}
