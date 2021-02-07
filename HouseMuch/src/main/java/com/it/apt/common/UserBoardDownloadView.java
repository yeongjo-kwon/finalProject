package com.it.apt.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class UserBoardDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		File file=(File) model.get("file");
		if(file==null || !file.exists() || !file.canRead()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print("<script>alert('파일이 존재하지 않거나 손상되었습니다');history.back();</script>");
			return;
		}
		
		System.out.println("파일명 : "+file.getName());
		String filename=new String(file.getName().getBytes("euc-kr"),"8859_1");
		
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		response.setHeader("Content-disposition", "attachment;filename="+filename);
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream os=response.getOutputStream();
		FileInputStream fis=null;
		
		try {
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
		}finally {
			if(fis!=null) {
				try {
					fis.close();
				}catch(IOException ex) {
					ex.printStackTrace();
				}
			}
		}
	}

}
