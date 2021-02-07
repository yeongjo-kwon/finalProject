package com.it.apt.adminLiving.notice.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.it.apt.member.model.MemberVO;

public class NoticeBoardVO extends MemberVO{
	//NOTICE_BOARD
	private int noticeNo;
	private int nCtgNo;		/*  1 일정 공지 / 2 시설보수 공지 / 3 생활공지 / 4 관리비 공지   */
	private String noticeTitle;
	private String noticeContent;
	private Timestamp noticeRegdate;
	private int memberNo; //행정 member_no=5
	private int noticeReadcount;
	private int aptNo; //3
	
	//NOTICE_CATEGORY
	private String nCtgName;		//공지 글 분류
	
	//SCHEDULER
	private int scdNo; 				//스케줄번호
	private String scdContent;  	//일정요약
	private Date startDate;			//시작일
	private Date endDate;			//종료일
	private String startDateStr;	//str시작일
	private String endDateStr;		//str종료일
	
	private String searchMonth;		//검색할 달 
	
	//검색할 달 getter/setter
	public String getSearchMonth() {
		return searchMonth;
	}

	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
	}
	
//============================================여기까지 [공지사항 + 일정] 관련 변수
	/** 검색조건 */
	private String searchCondition = "";
	
	/** 검색키워드 */
	private String searchKeyword = "";
    
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
    
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
  
    
//============================================여기까지 [페이징] 관련 변수

	private int nStorageNo;
	//private int noticeNo;---> 이미 있음(테이블에서 FK)
	private String noticeFilename;
	private String noticeOriginalFilename;
	private long noticeFilesize;
    
//============================================여기까지 [파일첨부] 관련 변수
    
	//기본생성자
    public NoticeBoardVO() {
    	super();
    } 

    //검색어+페이징생성자
	/**
     * 검색 조건을  설정한다.
     * @param bean 검색조건
     */
    public NoticeBoardVO(NoticeBoardVO bean) {
    	this.currentPage = bean.currentPage;
		this.searchCondition = bean.getSearchCondition();
		this.searchKeyword = bean.getSearchKeyword();
		this.searchUseYn = bean.getSearchUseYn();
		this.blockSize = bean.blockSize;
		this.firstRecordIndex = bean.firstRecordIndex;
		this.lastRecordIndex = bean.lastRecordIndex;
		this.recordCountPerPage = bean.recordCountPerPage;
		
	}//--> 검색조건 / 검색어 / 검색여부  이 세개는 getter로 값을 받아와야한다
    
//-------------------------------------------------------NOTICE_BOARD : getter/setter : 시작

  	//아파트번호
  	public int getAptNo() {
  		return aptNo;
  	}
  	public void setAptNo(int aptNo) {
  		this.aptNo = aptNo;
  	}

  	//공지글번호
  	public int getNoticeNo() {
  		return noticeNo;
  	}
  	public void setNoticeNo(int noticeNo) {
  		this.noticeNo = noticeNo;
  	}
  	
  	
  	public String getnCtgName() {
  		return nCtgName;
  	}
  	public void setnCtgName(String nCtgName) {
  		this.nCtgName = nCtgName;
  	}
  	public int getnCtgNo() {
  		return nCtgNo;
  	}
  	public void setnCtgNo(int nCtgNo) {
  		this.nCtgNo = nCtgNo;
  	}
  	public String getNoticeTitle() {
  		return noticeTitle;
  	}
  	public void setNoticeTitle(String noticeTitle) {
  		this.noticeTitle = noticeTitle;
  	}
  	public String getNoticeContent() {
  		return noticeContent;
  	}
  	public void setNoticeContent(String noticeContent) {
  		this.noticeContent = noticeContent;
  	}
  	public Timestamp getNoticeRegdate() {
  		return noticeRegdate;
  	}
  	public void setNoticeRegdate(Timestamp noticeRegdate) {
  		this.noticeRegdate = noticeRegdate;
  	}
  	public int getMemberNo() {
  		return memberNo;
  	}
  	public void setMemberNo(int memberNo) {
  		this.memberNo = memberNo;
  	}
  	public int getNoticeReadcount() {
  		return noticeReadcount;
  	}
  	public void setNoticeReadcount(int noticeReadcount) {
  		this.noticeReadcount = noticeReadcount;
  	}
//-------------------------------------------------------NOTICE_BOARD : getter/setter : 끝 	
  	




//-----------------------------------------------------------------스케줄러 getter/setter : 시작
	public int getScdNo() {
		return scdNo;
	}
	public void setScdNo(int scdNo) {
		this.scdNo = scdNo;
	}
	public String getScdContent() {
		return scdContent;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}

	
	//String형 날짜값
	public String getStartDateStr() {
		
		if((startDateStr==null || startDateStr.isEmpty()) &&null!=startDate) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			startDateStr = sdf.format(startDate);
		}
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	public String getEndDateStr() {
		if((endDateStr==null || !endDateStr.isEmpty())&&null!=endDate) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			endDateStr = sdf.format(endDate);
		}
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	//java.sql.date형 날짜값
	public Date getStartDate() {
		if(startDate==null&&null!=startDateStr) {
			startDate= Date.valueOf(startDateStr);
		}
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		if(endDate==null&&null!=endDateStr) {
			endDate= Date.valueOf(endDateStr);
		}
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
//-----------------------------------------------------------------스케줄러 getter/setter : 끝

	
	
//--------------------------------------------------------페이징 getter / setter 
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}
	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}
	public int getLastRecordIndex() {
		return lastRecordIndex;
	}
	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

//-----------------------------------------------------------------[NOTICE_STORAGE] 파일첨부 getter/setter
	
	public int getnStorageNo() {
		return nStorageNo;
	}
	public void setnStorageNo(int nStorageNo) {
		this.nStorageNo = nStorageNo;
	}
	
	public String getNoticeFilename() {
		return noticeFilename;
	}
	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	public String getNoticeOriginalFilename() {
		return noticeOriginalFilename;
	}
	public void setNoticeOriginalFilename(String noticeOriginalFilename) {
		this.noticeOriginalFilename = noticeOriginalFilename;
	}
	public long getNoticeFilesize() {
		return noticeFilesize;
	}
	public void setNoticeFilesize(long noticeFilesize) {
		this.noticeFilesize = noticeFilesize;
	}

	//HOUSEHOLD_CODE 꼭 toString에 추가할 것

	@Override
	public String toString() {
		return "NoticeBoardVO "
				+"[*** 1.기본공지***]noticeNo=" + noticeNo + ", nCtgNo=" + nCtgNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeRegdate=" + noticeRegdate + ", memberNo=" + memberNo
				+ ", noticeReadcount=" + noticeReadcount + ", aptNo=" + aptNo + ", nCtgName=" + nCtgName 
				+ ",[*** 2.일정공지***] scdNo="+ scdNo + ", scdContent=" + scdContent + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", startDateStr=" + startDateStr + ", endDateStr=" + endDateStr 
				+ ",[*** 3.달력에서보낼 검색 달 ***] searchMonth=" + searchMonth
				+ ",[*** 4.페이징용 ***] searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", searchUseYn="
				+ searchUseYn + ", currentPage=" + currentPage + ", blockSize=" + blockSize + ", firstRecordIndex="
				+ firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex + ", recordCountPerPage="+ recordCountPerPage 
				+ ",[*** 5.자료실 ***] nStorageNo=" + nStorageNo + ", noticeFilename=" + noticeFilename + ", noticeOriginalFilename=" + noticeOriginalFilename + ", noticeFilesize=" + noticeFilesize
				+ ",[*** 6.회원정보 ***] getHouseholdCode()=" + getHouseholdCode() + ", getId()=" + getId() + ", getMemberName()="
				+ getMemberName() + ", getEmail()=" + getEmail() + "]";
	}
}
