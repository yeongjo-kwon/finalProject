package com.it.apt.adminLiving.notice.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface NoticeBoardDAO {
	//기본공지등록
	int insertNotice(NoticeBoardVO vo);
	
	// 페이징에필요 : 전체레코드 수 조회
	int selectTotalRecord(NoticeBoardVO vo);
	
	//전체 공지 목록 조회
	List<NoticeBoardVO> selectAllNoticeList(NoticeBoardVO vo);
	// 공지글 조회수 증가(입주민조회수만 카운트)
	int updateReadCount(int noticeNo);
	
	// 수정화면 보여줄 때 번호로 공지글 가져오기
	NoticeBoardVO selectNoticeByNo(int noticeNo);
	
	// 기본공지 수정
	int updateNotice(NoticeBoardVO vo); 
	
	// 일정 테이블에 일정만 등록하는 메서드
	// startDate 와 endDate가 들어있는 NoticeBoardVO 를 매개변수로 넣어서사용
	int insertScheduler(NoticeBoardVO vo); 
	
	//일정공지라면 해당 공지의 일정관련 내용 조회해오는 메서드
	NoticeBoardVO selectScdByNoticeNo(int noticeNo);
	
	//일정만 업데이트
	int updateScdByScdNo(NoticeBoardVO vo);
	
	//일정만 삭제
	int deleteScdByNoticeNo(int noticeNo);
	
	//공지 삭제 시 일정도 같이 삭제
	int deleteNoticeWithScdAndFileByNoticeNo(int noticeNo);
	
	/////파일첨부  
	int insertNoticeStorage(NoticeBoardVO vo);

	/////파일조회 : 공지글번호로 해당되는 파일 전부 조회 (NoticeBoardServiceImpl에서 getFileInfo해서 값이 있을 경우에만 호출)
	NoticeBoardVO selectNoticeStorageByNoticeNo(int noticeNo);
	//일단 리스트 안하고 단일로함 
	
	
	///// 파일PK 번호로 1개만 삭제 : 파일 수정시 새로운 파일 업데이트 하면 사용
	int deleteForEditNoticeStorage(int OLDnStorageNo);
	
	////파일수정처리
	int updateNoticeStorage(NoticeBoardVO vo);
	
	//// 공지글번호로 전부 삭제
	int deleteForDeleteNoticeStorage(int noticeNo);
	
	//***********월에해당되는 일정리스트 가져오기
	List<NoticeBoardVO> selectScdByMonth(NoticeBoardVO vo);
	

}
