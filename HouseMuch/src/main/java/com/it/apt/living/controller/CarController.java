package com.it.apt.living.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/living/car")
public class CarController {

	private static final Logger logger = LoggerFactory.getLogger(CarController.class);
	
	
	@RequestMapping("/carRegister.do")
	public void carReg_show() {
		logger.info("방문차량 등록 화면 보여주기");
		
	}
}
