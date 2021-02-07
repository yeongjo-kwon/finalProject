package com.it.apt.adminLiving.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class LivingDownloadView extends AbstractView{
	private static final Logger logger
	=LoggerFactory.getLogger(LivingDownloadView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		File file = (File)model.get("file");
		logger.info("[공지상세에서] 다운로드할 파일명 : {} ",file.getName());//여기까지만 됨
		
		if(file==null || !file.exists() || !file.canRead()) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('파일이 존재하지 않거나 손상되었습니다.');history.back();</script>");
			
			return;
		}
		
		String fileName = new String(file.getName().getBytes("UTF-8"),"8859_1");
		
//		response.setContentType("application/octet-stream");
//		response.setHeader("Content-disposition", "attachment;filename"+fileName);---> 이거하면 downloadview.do로 이상한파일만 다운로드됨 
	
		//------------------------------------------------------------------------------ 여기부터
		response.setContentType(getContentType());
		response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; fileName=\""
		    + java.net.URLEncoder.encode(file.getName(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		//------------------------------------------------------------------------------ 여기까지 써서 다운로드성공
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = null;
		try{
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
		}finally {
			if(fis!=null) {
				fis.close();
			}
		}
		
		
	}

	
	
	
}
