package com.it.apt.userBoard.model;

import java.util.List;
import java.util.Map;

import com.it.apt.common.SearchVO;

public interface UserBoardDAO {
	int insertUserBoard(UserBoardVO vo);
	List<Map<String, Object>> selectAllUserBoardView(SearchVO vo);
	int selectTotalRecordFromUserBoard(SearchVO vo);
	Map<String, Object> selectByNoUserBoard(int boardNo);
	int insertAnswer(boardCommentVO vo);
	List<Map<String, Object>> selectByNoComment(int boardNo);
	int updateComment(boardCommentVO vo);
	int deleteComment(int commNo);
	int deleteUserBoard(int boardNo);
	int updateBoardReadcount(int boardNo);
	int userBoardFileUpload(UserBoardVO vo);
	
}
