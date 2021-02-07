package com.it.apt.adminAll.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.apt.common.SearchVO;

@Service
public class BoardCtgServiceImpl implements BoardCtgService{
	@Autowired private BoardCtgDAO boardCtgDao;

	@Override
	public int insertBoardCtg(BoardCtgVO vo) {
		return boardCtgDao.insertBoardCtg(vo);
	}

	@Override
	public List<BoardCtgVO> selectAllBoardCtg(SearchVO vo) {
		return boardCtgDao.selectAllBoardCtg(vo);
	}

	@Override
	public int updateBoardCtg(int boardCtgNo) {
		return boardCtgDao.updateBoardCtg(boardCtgNo);
	}

	@Override
	public int deleteBoardCtg(int boardCtgNo) {
		return boardCtgDao.deleteBoardCtg(boardCtgNo);
	}

	@Override
	public int selectTotalRecordFromBoardCategory(SearchVO vo) {
		return boardCtgDao.selectTotalRecordFromBoardCategory(vo);
	}

	@Override
	public List<BoardCtgVO> selectAllCtg() {
		return boardCtgDao.selectAllCtg();
	}
	
	
}
