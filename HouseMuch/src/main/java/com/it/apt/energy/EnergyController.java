package com.it.apt.energy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.living.controller.NoticeController;

@Controller
@RequestMapping("/energy")
public class EnergyController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("/energyChart.do")
	private void energyChart() {
		logger.info("에너지 차트  보여주기");
	}
	
	
	//http://localhost:9090/apt/energy/energyChart.do
}
