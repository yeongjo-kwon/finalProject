package com.it.apt.voteBoard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.apt.userBoard.controller.UserBoardController;

@Controller
@RequestMapping("/voteBoard")
public class VoteBoardController {
   private static final Logger logger
   =LoggerFactory.getLogger(VoteBoardController.class);

   @RequestMapping("/voteBoardDetail.do")
   public void boardDetail() {
      logger.info("입주민투표 게시판 글 상세보기 - voteBoardDetail");
   }
   
   @RequestMapping("/voteBoardList.do")
   public void boardList() {
      logger.info("입주민투표 게시판 글 상세보기 - voteBoardList");
   }
}

