package com.it.apt.adminLiving.notice.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Autowired NoticeBoardDAO noticeBoardDao;

	@Override
	public int insertNotice(NoticeBoardVO vo) {
		return noticeBoardDao.insertNotice(vo);
	}
	
	@Override
	public int insertScheduler(NoticeBoardVO vo) {
		return noticeBoardDao.insertScheduler(vo);
		//이거 컨트롤러에 지저분하게 썼음 -> 나중에 여기다 transactional처리 하는걸로 수정할 것
	}
	
	@Override
	public List<NoticeBoardVO> selectAllNoticeList(NoticeBoardVO vo) {
		return noticeBoardDao.selectAllNoticeList(vo);
	}
	@Override
	public int selectTotalRecord(NoticeBoardVO vo) {
		return noticeBoardDao.selectTotalRecord(vo);
	}

	
	@Override
	public int updateReadCount(int noticeNo) {
		return noticeBoardDao.updateReadCount(noticeNo);
	}


	@Override
	public NoticeBoardVO selectNoticeByNo(int noticeNo) {
		return noticeBoardDao.selectNoticeByNo(noticeNo);
	}

	@Override
	@Transactional //공지 업데이트하는데 
	public int updateNoticeAndScd(NoticeBoardVO vo) {

		int result=0;
		try {
			result = noticeBoardDao.updateNotice(vo);
			//필요한 변수 뽑아옴
			int nCtgNo = vo.getnCtgNo();	//지금 일정공지도 수정되야하는 상황인지 (카테고리1, 일정공지인지)
			int noticeNo = vo.getNoticeNo();//일정 삭제에 필요
			int scdNo = vo.getScdNo();	//스케줄테이블에서 일정이미 있는지 조회해보고
		//	int oldStorageNo = vo.getnStorageNo();	//이미 첨부파일이 있는 상황

			if( nCtgNo == 1) { 	//-------------------나갈때일정 1개만 들어가있어야됨----------------------------------------------- A. [일반 -> 일정공지로 수정] 하는 상황 ( nCtgNo == 1)					
				System.out.println("<<<<<<<<<<<<<<<<<<<일정카테고리인데 , scdNo있는지 보자 scdNo="+scdNo);

				if(scdNo == 0 ) {
					//[A-1] 원래 일정X -> 나중에 일정이 추가 : scdNo=0 ---> 일정 새로 등록
					result = noticeBoardDao.insertScheduler(vo);
					System.out.println("[일정X -> 일정O] insertScheduler실행 결과 result="+result+"(아직커밋전)");
					
				}else {
				//[A-2]
					
					//원래 있던 일정은 삭제 후 새로운 일정으로 insert
					result = noticeBoardDao.deleteScdByNoticeNo(noticeNo);
					System.out.println("[일정O -> 일정 선삭제] deleteScdByNoticeNo실행 결과 result="+result+"(아직커밋전)");
					
					result = noticeBoardDao.insertScheduler(vo); //먼저 공지내용은 업데이트 된 vo
					System.out.println("[일정O -> 일정 후수정] insertScheduler실행 결과 result="+result+"(아직커밋전)");
				}
				System.out.println("<<<<<<<<<<<<<<<<<<<일정카테고리인데 , scdNo있는지 보자 scdNo="+scdNo+"&&&지금까지result="+result+"(아직커밋전)");
				System.out.println("일정있는 공지로 업뎃 커밋");
				return result;
				
			}else {	//nCtgNo != 1 일정카테고리 선택 안했는데 : 일정 안넣을꺼임, 나갈때 일정 이개새끼1도 없어야됨 
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[일반카테고리인데, scdNo있는지 보자scdNo="+scdNo+"&&&지금까지result="+result+"(아직커밋전)");
				
				
				//[B-1] [원래 일정O -> 일정이 수정]된 경우 scdNo!=0 ----> scdNo로 일정 update
				NoticeBoardVO scdVo = noticeBoardDao.selectScdByNoticeNo(vo.getNoticeNo());//있던게 뭔지 먼저 조회	
				if(scdVo!=null) {
					int oldNoticeNo = scdVo.getNoticeNo();
					//원래 있던 일정은 삭제 
					result = noticeBoardDao.deleteScdByNoticeNo(oldNoticeNo);
					System.out.println("[일정O -> 일정삭제] deleteScdByNoticeNo실행 결과 result="+result+"(아직커밋전)");
//				}else {
//					//[B-2] 이거 안쓰니까 자꾸 null나와서 일단 쓰는데 ,,
					//System.out.println("[[[[[[[[[[삭제해라 scdNo있는지 보자 나오면 디진다 scdNo="+scdVo.getScdNo()+"&&&지금까지result="+result+"(아직커밋전)");
				}
				System.out.println("일정없는 공지로 업뎃 커밋");
				
				return result;
				
				
			}
			//일정 O/X별로 수정 후 일반공지내용의 업데이트는 진행(일정O-> 삭제하고온상황 / 일정X-> insert하고 온 상황 )
		
			
//			//0202파일첨부추가
//			if(result>0){//일단 공지수정은 된 상태에서 
//				if(vo.getnStorageNo() != 0){	//이미 있는 상황
//					noticeBoardDao.deleteForEditNoticeStorage(OLDnStorageNo);
//				}
//			}
			
			/*
				1. 수정 전에 파일 있던상황 : oldStorageNo != 0 [1-1] 수정시 추가하는 상황  ->  -> insertStorage할것
													   [1-2] 수정시 그대로 두는 상황...........근데ㅐ 이거 알아서 해주는거같든데,....?	
			 	2. 수정 전에 파일 없던상황 
			 */
			
			
			
			//System.out.println("트랜잭션 모두완료 , result="+result+"(커밋)");
			//return result;
							

		} catch (RuntimeException e) { //하나라도 실패할 경우
			e.printStackTrace();
			result=-1;
			System.out.println("캐치에걸림, result="+result+"(롤백)");
			//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			/*
			result=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 * TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			이거 지우니까 모든게 스무스한 이유를 정말 도무지 알 수 없다........................................0126 새벽2시 김이나작성
			 */
			//꼭 둘 다 성공해야만 하니까 실패시 cnt음수로 리턴 , rollback되게
			
		}

		return result;
	}

	@Override
	public int deleteNoticeWithScdAndFileByNoticeNo(int noticeNo) {
		return noticeBoardDao.deleteNoticeWithScdAndFileByNoticeNo(noticeNo);
	}

	
	
//------------------------------------------------------------------------------------------------파일첨부 관련	
	
	@Override
	public int insertNoticeStorage(NoticeBoardVO vo) {
		return noticeBoardDao.insertNoticeStorage(vo);
	}

	@Override
	public NoticeBoardVO selectNoticeStorageByNoticeNo(int noticeNo) {
		return noticeBoardDao.selectNoticeStorageByNoticeNo(noticeNo);
	}

	@Override
	public String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request) {
		//selectNoticeStorageByNoticeNo ..?
		String result="";
		String contextPath=request.getContextPath();
		double dFileSize = Math.round((fileSize/1000.0*10)/10.0);
		if(originalFileName != null && ! originalFileName.isEmpty() ) {	//파일첨부된경우만
			result += "<img src=' "+contextPath+"/resources/aptAdmin_images/file_icon.png' "
					+ "alt='file이미지'>";
			
			result += originalFileName + "("+dFileSize+"KB)";
			System.out.println("여기는 getFileInfo => originalFileName="+originalFileName);
		}
		return result;

	}

	//for Edit notice -> 안써
	@Override
	public int deleteForEditNoticeStorage(int OLDnStorageNo) {
		return noticeBoardDao.deleteForEditNoticeStorage(OLDnStorageNo);
	}

	//for Edit notice
	@Override
	public int deleteForDeleteNoticeStorage(int noticeNo) {
		return noticeBoardDao.deleteForDeleteNoticeStorage(noticeNo);
	}

	//for Edit notice
	@Override
	public int updateNoticeStorage(NoticeBoardVO vo) {
		return noticeBoardDao.updateNoticeStorage(vo);
	}

	@Override
	public List<NoticeBoardVO> selectScdByMonth(NoticeBoardVO vo) {
		return noticeBoardDao.selectScdByMonth(vo);
	}



	
	

}
