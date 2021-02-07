package com.it.apt.adminAll.model;

import java.util.List;

import com.it.apt.common.SearchVO;

public interface BoardCtgDAO {
	int insertBoardCtg(BoardCtgVO vo);
	List<BoardCtgVO> selectAllBoardCtg(SearchVO vo);
	int updateBoardCtg(int boardCtgNo);
	int deleteBoardCtg(int boardCtgNo);
	int selectTotalRecordFromBoardCategory(SearchVO vo);
	List<BoardCtgVO> selectAllCtg();
	
}
