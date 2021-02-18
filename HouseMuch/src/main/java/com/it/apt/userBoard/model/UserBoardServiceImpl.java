package com.it.apt.userBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.apt.common.SearchVO;

@Service
public class UserBoardServiceImpl implements UserBoardService{
	@Autowired private UserBoardDAO userBoardDao;

	@Override
	public int insertUserBoard(UserBoardVO vo) {
		return userBoardDao.insertUserBoard(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllUserBoardView(SearchVO vo) {
		return userBoardDao.selectAllUserBoardView(vo);
	}

	@Override
	public int selectTotalRecordFromUserBoard(SearchVO vo) {
		return userBoardDao.selectTotalRecordFromUserBoard(vo);
	}

	@Override
	public Map<String, Object> selectByNoUserBoard(int boardNo) {
		return userBoardDao.selectByNoUserBoard(boardNo);
	}

	@Override
	public int insertAnswer(boardCommentVO vo) {
		return userBoardDao.insertAnswer(vo);
	}

	@Override
	public List<Map<String, Object>> selectByNoComment(int boardNo) {
		return userBoardDao.selectByNoComment(boardNo);
	}

	@Override
	public int updateComment(boardCommentVO vo) {
		return userBoardDao.updateComment(vo);
	}

	@Override
	public int deleteComment(int commNo) {
		return userBoardDao.deleteComment(commNo);
	}

	@Override
	public int deleteUserBoard(int boardNo) {
		return userBoardDao.deleteUserBoard(boardNo);
	}

	@Override
	public int updateBoardReadcount(int boardNo) {
		return userBoardDao.updateBoardReadcount(boardNo);
	}

	@Override
	public int userBoardFileUpload(UserBoardVO vo) {
		return userBoardDao.userBoardFileUpload(vo);
	}

	@Override
	public int updateUserBoard(UserBoardVO vo) {
		return userBoardDao.updateUserBoard(vo);
	}

	@Override
	public int updateFileUpload(UserBoardVO vo) {
		//파일업로드 테이블에 있는지 체크
		int cnt=userBoardDao.selectByNoBoardStorage(vo.getBoardNo());
		
		int result=0;
		if(cnt>0) { //기존에 있으면 업데이트
			result=userBoardDao.updateFileUpload(vo);
		}else { //없으면 추가
			result=userBoardDao.userBoardFileUpload(vo);
		}
		
		return result;
	}

	@Override
	public List<Map<String, Object>> selectAllByUserdash(SearchVO vo) {
		return userBoardDao.selectAllByUserdash(vo);
	}

	@Override
	public int selectTotalRecordUserdash(SearchVO vo) {
		return userBoardDao.selectTotalRecordUserdash(vo);
	}

	@Override
	@Transactional
	public int deleteUserBoardMulti(String[] boardNoArray) {
		int cnt=0;
		try {
			for(String boardNo : boardNoArray) {
				cnt=userBoardDao.deleteUserBoard(Integer.parseInt(boardNo));
				System.out.println(boardNo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	
	
}
