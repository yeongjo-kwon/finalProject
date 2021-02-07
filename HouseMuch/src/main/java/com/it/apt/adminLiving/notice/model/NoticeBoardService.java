package com.it.apt.adminLiving.notice.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface NoticeBoardService {
	//기본공지등록 
	int insertNotice(NoticeBoardVO vo);

	

	// 일정 테이블에 일정만 등록하는 메서드 + 트랜잭션에도 사용, 따로도 사용
	// startDate 와 endDate가 들어있는 NoticeBoardVO 를 매개변수로 넣어서사용
	int insertScheduler(NoticeBoardVO vo); 

	//전체 공지 목록 조회
	List<NoticeBoardVO> selectAllNoticeList(NoticeBoardVO vo);
	// 페이징에필요 : 전체레코드 수 조회
	int selectTotalRecord(NoticeBoardVO vo);
	
	// 공지글 조회수 증가(입주민조회수만 카운트)
	int updateReadCount(int noticeNo);
	

	// 수정화면 보여줄 때 번호로 공지글 가져오기
	NoticeBoardVO selectNoticeByNo(int noticeNo);
	
	
	// 공지 업데이트하면서 일정까지 같이 업데이트 , 트랜잭션처리
	//int updateNotice(NoticeBoardVO vo); 일반공지 수정하는 메서드  -> 트랜잭션 안에서 사용
	int updateNoticeAndScd(NoticeBoardVO vo) ;
	//일정공지라면 해당 공지의 일정관련 내용 조회해오는 메서드  -> 트랜잭션 안에서 사용
	//NoticeBoardVO selectScdByNoticeNo(int noticeNo);
	
	//일정만 삭제 -> 트랜잭션 안에서 사용
	//int deleteScdByNoticeNo(int noticeNo);

	//공지 삭제 : 공지삭제할때 일정이 있으면 한꺼번에 삭제, 없으면 공지만 삭제하는 메서드 (테스트완료) 
	int deleteNoticeWithScdAndFileByNoticeNo(int noticeNo);
	
	
	
	//-----------------공지게시판자료실 관련

	
	//NORICE_STORAGE테이블에 파일업로드하는 메서드
	
	
	/////파일첨부  
	int insertNoticeStorage(NoticeBoardVO vo);

	/////파일조회 : 공지글번호로 해당되는 파일 전부 조회 (NoticeBoardServiceImpl에서 getFileInfo해서 값이 있을 경우에만 호출)
	NoticeBoardVO selectNoticeStorageByNoticeNo(int noticeNo);
	
	//***** 첨부파일 수정 시 *****파일 있는지 확인 후 파일정보 가져오는 메서드
	public String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request);
	
	//***** 첨부파일 수정 시 *****파일PK 번호로 1개만 삭제 : 파일 수정시 새로운 파일 첨부 하면 사용
	int deleteForEditNoticeStorage(int OLDnStorageNo);//그전에 있던 파일을 삭제
	
////파일수정처리
	int updateNoticeStorage(NoticeBoardVO vo);
	
	
	//// 공지글번호로 전부 삭제
	int deleteForDeleteNoticeStorage(int noticeNo);
	

	//***********월에해당되는 일정리스트 가져오기 : 캘린더
	List<NoticeBoardVO> selectScdByMonth(NoticeBoardVO vo);
	
	
	
	
}
