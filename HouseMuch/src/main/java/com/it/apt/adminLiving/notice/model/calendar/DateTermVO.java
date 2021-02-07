package com.it.apt.adminLiving.notice.model.calendar;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.it.apt.common.SearchVO;

public class DateTermVO extends SearchVO{
	//검색어랑 비교할 "월"
	private String jan1 = "01"; 
	private String feb2 = "02"; 
	private String mar3 = "03"; 
	private String apr4 = "04"; 
	private String may5 = "05"; 
	private String jun6 = "06"; 
	private String jul7 = "07";
	private String aug8 = "08";
	private String sep9 = "09";
	private String oct10 = "10";
	private String nov11 = "11";
	private String dec12 = "12";

	//생성자에서 만들어져서 set -> getter로 읽혀질 날짜
	private Timestamp sDateOfMonth;
	private Timestamp eDateOfMonth;
	
	private Timestamp sDateOfWeek;
	private Timestamp eDateOfWeek;
	
	
	//시작일과 종료일을 집어넣으면 해당 월의 총 일수를 구해서 세팅해주는 생성자
	public DateTermVO(Timestamp sDateOfMonth, Timestamp eDateOfMonth) {
		/*
		 1. 년월을 집어넣는다 "YYYY-MM"
		 2. sDate에는 "DD"로 01을 집어넣는다
		 
		 3. 월만 추출한다
		 4. 년은 그대로 두고 월만 각각 01, 02, ~ ,12 로 비교한다 (1월일니 2월인지 ~ 12월인지 비교)
		  
		 5. 비교하면서 "MM"값이 "02"월은 eDate의 "DD"값을 "28"로 설정한다 
		 6. 비교하면서 "MM"값이 01, 03, 05, 07, 08, 10, 12월은 eDate의 "DD"값을 "31"로 설정한다 
		 7. 비교하면서 "MM"값이 04, 06, 09, 11 월은 eDate의 "DD"값을 "30"으로 설정한다 
		 
		 8. 비교 결과 나온 년월일 을 합친다 : "YYYY"+"-"+"MM"+"DD" -> 하나의String
		 9. SimplDateFormat으로 Timestamp로 변환한다 
		 10. 각각 sDateOfMonth와 eDateOfMonth의 setter에 넣는다
		 11. [결과] 들어올 때 YYYY-MM를 입력한 값이 => getter로 읽으면 TO_DATE("여기들어감","YYYY-MM-DD")로 들어간다
		 12. xml에서 기간 검색 조건으로 들어가고, 입력한 년월에 해당되는 일정 리스트가 조회되서 나온다 
		 13. 근데 결과보낼 깨 map으로 보내야된다는데 밥먹어야지 
		    
		 */
		
		String MM = "MM";
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String searchMonth = sdf.format(MM);
		
	
		this.sDateOfMonth = sDateOfMonth;
		this.eDateOfMonth = eDateOfMonth;
	 }
	
	
	
	public Timestamp getsDateOfMonth() {
		return sDateOfMonth;
	}
	public void setsDateOfMonth(Timestamp sDateOfMonth) {
		this.sDateOfMonth = sDateOfMonth;
	}
	public Timestamp geteDateOfMonth() {
		return eDateOfMonth;
	}
	public void seteDateOfMonth(Timestamp eDateOfMonth) {
		this.eDateOfMonth = eDateOfMonth;
	}
	public Timestamp getsDateOfWeek() {
		return sDateOfWeek;
	}
	public void setsDateOfWeek(Timestamp sDateOfWeek) {
		this.sDateOfWeek = sDateOfWeek;
	}
	public Timestamp geteDateOfWeek() {
		return eDateOfWeek;
	}
	public void seteDateOfWeek(Timestamp eDateOfWeek) {
		this.eDateOfWeek = eDateOfWeek;
	}
	
	
	
	
	
	
	
}
