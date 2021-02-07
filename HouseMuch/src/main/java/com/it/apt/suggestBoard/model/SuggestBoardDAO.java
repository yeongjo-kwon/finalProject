package com.it.apt.suggestBoard.model;

import java.util.List;
import java.util.Map;

import com.it.apt.common.SearchVO;

public interface SuggestBoardDAO {
	int insertSuggestBoard(SuggestBoardVO vo);
	List<SuggestCategoryVO> selectBySuggestCategory();
	List<Map<String, Object>> selectAllSuggestBoardView(SearchVO vo);
	Map<String, Object> selectByNoSuggestBoard(int suggBoardNo);
	int updateSuggestBoard(SuggestBoardVO vo);
	int selectTotalRecordFromSuggestBoard(SearchVO vo);
	int insertAnswer(SuggestAnswerVO vo);
	Map<String, Object> selectByNoAnswer(int suggBoardNo);
	int updateAnswer(SuggestAnswerVO vo);
	int deleteAnswer(int answNo);
	Map<String, Object> searchAuthCode(int memberNo);
	int deleteSuggestBoard(int suggBoardNo);
}
