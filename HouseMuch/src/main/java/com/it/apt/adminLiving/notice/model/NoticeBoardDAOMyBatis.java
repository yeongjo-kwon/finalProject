package com.it.apt.adminLiving.notice.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeBoardDAOMyBatis implements NoticeBoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.noticeBoard.";

	//=========================================등록
	@Override
	public int insertNotice(NoticeBoardVO vo) {
		return sqlSession.insert(namespace+"insertNotice",vo);
	}

	@Override
	public int insertScheduler(NoticeBoardVO vo) {
		return sqlSession.insert(namespace+"insertScheduler",vo);
	}
	
	
	//=========================================조회
	@Override
	public List<NoticeBoardVO> selectAllNoticeList(NoticeBoardVO vo) {
		return sqlSession.selectList(namespace+"selectAllNoticeList",vo);
	}

	//=========================================수정(+한개 글 조회)
	
	@Override
	public NoticeBoardVO selectNoticeByNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"selectNoticeByNo",noticeNo);
	}

	@Override
	public NoticeBoardVO selectScdByNoticeNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"selectScdByNoticeNo",noticeNo);
	}
	
	@Override
	public int updateNotice(NoticeBoardVO vo) {
		return sqlSession.update(namespace+"updateNotice",vo);
	}

	@Override
	public int updateScdByScdNo(NoticeBoardVO vo) {
		return sqlSession.update(namespace+"updateScdByScdNo",vo);
	}

	//=========================================삭제
	@Override
	public int deleteScdByNoticeNo(int noticeNo) {
		return sqlSession.delete(namespace+"deleteScdByNoticeNo",noticeNo);
	}

	@Override
	public int deleteNoticeWithScdAndFileByNoticeNo(int noticeNo) {
		return sqlSession.delete(namespace+"deleteNoticeWithScdAndFileByNoticeNo",noticeNo);
	}

	@Override
	public int updateReadCount(int noticeNo) {
		return sqlSession.update(namespace+"updateReadCount",noticeNo);
	}

	@Override
	public int selectTotalRecord(NoticeBoardVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",vo);
	}

	
	//=========================================파일첨부
	@Override
	public int insertNoticeStorage(NoticeBoardVO vo) {
		return sqlSession.insert(namespace+"insertNoticeStorage",vo);
	}

	@Override
	public NoticeBoardVO selectNoticeStorageByNoticeNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"selectNoticeStorageByNoticeNo",noticeNo);
	}

	@Override
	public int deleteForEditNoticeStorage(int OLDnStorageNo) {
		return sqlSession.delete(namespace+"deleteForEditNoticeStorage",OLDnStorageNo);
	}//얘는 수정할 때 사용

	@Override
	public int deleteForDeleteNoticeStorage(int noticeNo) {
		return sqlSession.delete(namespace+"deleteForDeleteNoticeStorage",noticeNo);
	}

	@Override
	public int updateNoticeStorage(NoticeBoardVO vo) {
		return sqlSession.update(namespace+"updateNoticeStorage",vo);
	}

	@Override
	public List<NoticeBoardVO> selectScdByMonth(NoticeBoardVO vo) {
		return sqlSession.selectList(namespace+"selectScdByMonth",vo);
	}


	
	
	
	
}
