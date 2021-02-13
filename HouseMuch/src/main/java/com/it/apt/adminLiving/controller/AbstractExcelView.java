/**
 * 
 */
package com.it.apt.adminLiving.controller;

import java.io.ByteArrayOutputStream;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.LocalizedResourceHelper;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * @filename : AbstractPOIExcelView.java
 * @author : 임정혁 
 * @since : 2014. 5. 8.
 * @version : 1.0
 * @comment :
 * @history : 
 */
public abstract class AbstractExcelView extends AbstractView {

	/** The content type for an Excel response */		
	private static final String CONTENT_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";		
	
	/** The extension to look for existing templates */		
	private static final String EXTENSION = ".xlsx";		
	private String url;		/**	 * Default Constructor.	 * Sets the content type of the view to "application/vnd.ms-excel".	 */		
	
	public AbstractExcelView() {				
		setContentType(CONTENT_TYPE);		
	}	
	
	public void setUrl(String url) {		
		this.url = url;	
	}	
	
	@Override	
	protected boolean generatesDownloadContent() {		
		return true;	
	}	/**	 * Renders the Excel view, given the specified model.	 */	
	
	@Override	
	protected final void renderMergedOutputModel(			
			Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		Workbook workbook;		
		ByteArrayOutputStream baos = createTemporaryOutputStream();		
		/*if (this.url != null) {			
		 * workbook = getTemplateSource(this.url, request);		
		 * }		
		 * else {*/		
		workbook = new SXSSFWorkbook();			
		logger.debug("Created Excel Workbook from scratch");		//}		
		
		buildExcelDocument(model, workbook, request, response);		
		// Set the content type.		
		//response.setContentType(getContentType());		
		// Should we set the content length here?		
		// response.setContentLength(workbook.getBytes().length);		
		// Flush byte array to servlet output stream.		
		//ServletOutputStream out = response.getOutputStream();		
		
		workbook.write(baos);		
		writeToResponse(response, baos);		
		
		workbook = null;
		//out.flush();	
		}	
	
	protected Workbook getTemplateSource(String url, HttpServletRequest request) throws Exception {		
		LocalizedResourceHelper helper = new LocalizedResourceHelper(getApplicationContext());		
		Locale userLocale = RequestContextUtils.getLocale(request);		
		Resource inputFile = helper.findLocalizedResource(url, EXTENSION, userLocale);		
		// Create the Excel document from the source.		
		if (logger.isDebugEnabled()) {			
			logger.debug("Loading Excel workbook from " + inputFile);		
		}		
		//POIFSFileSystem fs = new POIFSFileSystem(inputFile.getInputStream());		
		return new SXSSFWorkbook();	
	}	
	
	protected abstract void buildExcelDocument(			
			Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response)			
					throws Exception;	
	
	protected Cell getCell(Sheet sheet, int row, int col) {		
		Row sheetRow = sheet.getRow(row);		
		if (sheetRow == null) {			
			sheetRow = sheet.createRow(row);		
		}		
		
		Cell cell = sheetRow.getCell(col);				
		if (cell == null) {			
			cell = sheetRow.createCell(col);		
		}		
		
		return cell;
	}
	
	protected Cell getCell(Sheet sheet, int row, int col, CellStyle style) {		
		Row sheetRow = sheet.getRow(row);		
		if (sheetRow == null) {			
			sheetRow = sheet.createRow(row);		
		}		
		
		Cell cell = sheetRow.getCell(col);				
		if (cell == null) {			
			cell = sheetRow.createCell(col);		
		}		
		
		if( style != null){
			cell.setCellStyle(style);
		}
		
		return cell;
	}
	
	protected Cell getCell(Sheet sheet, int row, int col, CellStyle style, short height) {		
		Row sheetRow = sheet.getRow(row);		
		if (sheetRow == null) {			
			sheetRow = sheet.createRow(row);		
		}		
		
		Cell cell = sheetRow.getCell(col);				
		if (cell == null) {			
			cell = sheetRow.createCell(col);		
		}		
		
		if( style != null){
			cell.setCellStyle(style);
		}

		sheetRow.setHeight(height);
		return cell;
	}
	
	protected void setText(Cell cell, String text) {		
		cell.setCellType(Cell.CELL_TYPE_STRING);		
		cell.setCellValue(text);
	}
	
	protected void setText(Cell cell, int i) {		
		cell.setCellType(Cell.CELL_TYPE_NUMERIC);		
		cell.setCellValue(i);
	}
}

