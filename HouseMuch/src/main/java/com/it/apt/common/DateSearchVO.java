package com.it.apt.common;

public class DateSearchVO extends SearchVO{ 
			//판매내역에서 사용자가 검색하는 where조건	// ★페이징처리★도 하려면 페이징처리용 변수 필요하니까 searchVO상속
			//날짜선택 후 조회 -> 날짜, 조회버튼, 근데 시작-끝날짜가 각각 페이징처리의 검색조건이 되는거임 
	
	
	private String startDay;  //시작일
	private String endDay; 	  //종료일
	private String customerId; //고객 아이디 -> 검색한사람 (이사람의 정보만 뽑아와야되니까)
	
	private String year;	//연도별 통계에 사용
	private String month;   //월별 통계에 사용
	
	//getter/setter
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", customerId=" + customerId + ", year="
				+ year + ", month=" + month + ", toString()=" + super.toString() + "]";
	}
	
}
