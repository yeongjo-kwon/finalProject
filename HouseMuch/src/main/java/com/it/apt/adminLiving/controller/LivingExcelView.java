package com.it.apt.adminLiving.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.springframework.stereotype.Component;

import com.it.apt.adminLiving.add.model.AddOrderExcelVO;


@Component
public class LivingExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	//Sheet sheet = workbook.createSheet("User List");
		
		String fileName= (String) model.get("fileName");
		String sheetName= (String) model.get("sheetName");
		
		fileName = new String(fileName.getBytes("euc-kr"), "8859_1"); 
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";"); 
		response.setHeader("Content-Transfer-Encoding", "binary"); 
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");

		// -----------------------------------------------------------------
				// 스타일 설정
				// 스타일 객체 생성
				CellStyle styleHd = workbook.createCellStyle(); //제목스타일
				XSSFFont fontHd= (XSSFFont) workbook.createFont();	//부제목스타일
				fontHd.setBold(true); fontHd.setFontName("맑은 고딕"); styleHd.setFont(fontHd);

				// 본문 메뉴 스타일
				CellStyle styleSub = workbook.createCellStyle(); 
				XSSFFont fontSub= (XSSFFont) workbook.createFont();
				fontSub.setBold(true); fontSub.setFontName("맑은 고딕"); styleSub.setFont(fontSub);
				
				styleSub.setBottomBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub.setLeftBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub.setTopBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub.setRightBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub.setWrapText(true);
				
				//본문 내용 형식 1
				CellStyle styleSub1 = workbook.createCellStyle(); // 부제목 스타일
				
				styleSub1.setBottomBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub1.setLeftBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub1.setTopBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub1.setRightBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub1.setWrapText(true);
				
				//본문 제목 형식 2
				CellStyle styleSub2 = workbook.createCellStyle(); 
				
				styleSub2.setBottomBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub2.setLeftBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub2.setTopBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub2.setRightBorderColor(IndexedColors.GREY_50_PERCENT.getIndex());
				styleSub2.setWrapText(true);

				
		List<AddOrderExcelVO> list= (List<AddOrderExcelVO>)model.get("orderExcelList");
		
		//위크시트 생성
		Sheet sheet = workbook.createSheet(sheetName);
		
		//행생성
		Row objRow = sheet.createRow((short)0);
		//셀 생성
		Cell objCell = null;
		
		//1행
		objRow = sheet.createRow((short) 0);
		objRow.setHeight((short)400);
		
		objCell = objRow.createCell(0);					
		objCell.setCellValue("총 신청내역");
		objCell.setCellStyle(styleHd);
						
		objCell = objRow.createCell(1);
		int count1=(Integer)list.size(); //model.get("count");
		objCell.setCellValue(count1);
		objCell.setCellStyle(styleHd);
		
		//2행
		objRow = sheet.createRow((short) 1);
		objRow.setHeight((short)400);
		
		objCell = objRow.createCell(0);					
		objCell.setCellValue("이용료 총 납부 횟수");
		objCell.setCellStyle(styleHd);
				
		int count2=0;
		for (int i=0; i<list.size(); i++){
			count2 += new Integer(list.get(i).getAddChargeCnt());
		}
		objCell = objRow.createCell(1);
		objCell.setCellValue(count2);
		objCell.setCellStyle(styleHd);
		
		//4행
		objRow = sheet.createRow((short) 3);
		objRow.setHeight((short)400);
		
		objCell = objRow.createCell(0);
		objCell.setCellValue("신청세대코드");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(1);
		objCell.setCellValue("신청번호");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(2);
		objCell.setCellValue("부가시설 명");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(3);		
		objCell.setCellValue("이용료 납부 횟수");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(4);
		objCell.setCellValue("신청일");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(5);
		objCell.setCellValue("월 이용 요금");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(6);
		objCell.setCellValue("신청자아이디");
		objCell.setCellStyle(styleSub);
		
		objCell = objRow.createCell(7);		
		objCell.setCellValue("신청자 회원번호");
		objCell.setCellStyle(styleSub);
		
	
		objCell = objRow.createCell(8); 
		objCell.setCellValue("해지일자");
		objCell.setCellStyle(styleSub);
	
		

		sheet.setColumnWidth((short)0,(short)5000); // 총신청내역제목 + 이용료납부 총 횟수제목+ 세대코드
		sheet.setColumnWidth((short)1,(short)3000); // 총 신청수 
		sheet.setColumnWidth((short)2,(short)6000);
		sheet.setColumnWidth((short)3,(short)5000);
		sheet.setColumnWidth((short)4,(short)6000);
		sheet.setColumnWidth((short)5,(short)6000);
		sheet.setColumnWidth((short)6,(short)6000);
		sheet.setColumnWidth((short)7,(short)5000);
		sheet.setColumnWidth((short)8,(short)5000);
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		
		
		///여기부터 데이터들어감
		for (int i=0; i<list.size(); i++){			
			
			Object outdate = list.get(i).getAddOutdate();
			if(outdate==null || "null".equals(outdate)) {
				outdate="이용중";
			}else {
				sdf.format(outdate);
			}
			
			setText(getCell(sheet, i+4, 0, styleSub2, (short)400), list.get(i).getHouseholdCode());	//세대코드
			setText(getCell(sheet, i+4, 1, styleSub1, (short)400), list.get(i).getAddOrderListNo());//신청번호 
			setText(getCell(sheet, i+4, 2, styleSub2, (short)400), list.get(i).getAddName());		// 시설명 
			setText(getCell(sheet, i+4, 3, styleSub1, (short)400), list.get(i).getAddChargeCnt());  //납부횟수 
			setText(getCell(sheet, i+4, 4, styleSub1, (short)400), sdf.format(list.get(i).getAddOrderdate()));//신청일 
			setText(getCell(sheet, i+4, 5, styleSub1, (short)400), df.format(list.get(i).getAddPrice()));      //이용료
			setText(getCell(sheet, i+4, 6, styleSub1, (short)400), list.get(i).getId());		//신청자ID
			setText(getCell(sheet, i+4, 7, styleSub1, (short)400), list.get(i).getMemberNo());	//신청자 회원번호
			setText(getCell(sheet, i+4, 8, styleSub1, (short)380), String.valueOf(outdate));//해지일
		}
		
		
	}
	
	

	
	
}
