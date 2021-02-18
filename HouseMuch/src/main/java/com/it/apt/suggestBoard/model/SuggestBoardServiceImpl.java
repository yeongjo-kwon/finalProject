package com.it.apt.suggestBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.apt.common.SearchVO;

@Service
public class SuggestBoardServiceImpl implements SuggestBoardService{
	@Autowired private SuggestBoardDAO suggDao;

	@Override
	public int insertSuggestBoard(SuggestBoardVO vo) {
		return suggDao.insertSuggestBoard(vo);
	}

	@Override
	public List<SuggestCategoryVO> selectBySuggestCategory() {
		return suggDao.selectBySuggestCategory();
	}

	@Override
	public List<Map<String, Object>> selectAllSuggestBoardView(SearchVO vo) {
		return suggDao.selectAllSuggestBoardView(vo);
	}

	@Override
	public Map<String, Object> selectByNoSuggestBoard(int suggBoardNo) {
		return suggDao.selectByNoSuggestBoard(suggBoardNo);
	}

	@Override
	public int updateSuggestBoard(SuggestBoardVO vo) {
		return suggDao.updateSuggestBoard(vo);
	}

	@Override
	public int selectTotalRecordFromSuggestBoard(SearchVO vo) {
		return suggDao.selectTotalRecordFromSuggestBoard(vo);
	}

	@Override
	public int insertAnswer(SuggestAnswerVO vo) {
		return suggDao.insertAnswer(vo);
	}

	@Override
	public Map<String, Object> selectByNoAnswer(int suggBoardNo) {
		return suggDao.selectByNoAnswer(suggBoardNo);
	}

	@Override
	public int updateAnswer(SuggestAnswerVO vo) {
		return suggDao.updateAnswer(vo);
	}

	@Override
	public int deleteAnswer(int answNo) {
		return suggDao.deleteAnswer(answNo);
	}

	@Override
	public Map<String, Object> searchAuthCode(int memberNo) {
		return suggDao.searchAuthCode(memberNo);
	}

	@Override
	public int deleteSuggestBoard(int suggBoardNo) {
		return suggDao.deleteSuggestBoard(suggBoardNo);
	}

	@Override
	public List<Map<String, Object>> suggBoardProcessedCases(SearchVO vo) {
		return suggDao.suggBoardProcessedCases(vo);
	}

	@Override
	public List<Map<String, Object>> suggBoardUnprocessedCases(SearchVO vo) {
		return suggDao.suggBoardUnprocessedCases(vo);
	}

	@Override
	public int suggBoardNotNull(SearchVO vo) {
		return suggDao.suggBoardNotNull(vo);
	}

	@Override
	public int suggBoardNull(SearchVO vo) {
		return suggDao.suggBoardNull(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllByUserdashSugg(SearchVO vo) {
		return suggDao.selectAllByUserdashSugg(vo);
	}

	@Override
	public int selectTotalRecordUserdashSugg(SearchVO vo) {
		return suggDao.selectTotalRecordUserdashSugg(vo);
	}

	@Override
	public List<Map<String, Object>> selectSuggBoardOnlyFive(SuggestBoardVO vo) {
		return suggDao.selectSuggBoardOnlyFive(vo);
	}

	@Override
	@Transactional
	public int deleteSuggBoardMulti(String[] suggBoardNoArray) {
		int cnt=0;
		try {
			for(String suggBoardNo : suggBoardNoArray) {
				cnt=suggDao.deleteSuggestBoard(Integer.parseInt(suggBoardNo));
				System.out.println(suggBoardNo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	
}
