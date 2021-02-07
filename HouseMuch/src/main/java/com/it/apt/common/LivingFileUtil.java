package com.it.apt.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;

@Component
public class LivingFileUtil {
	public static final int PDS_TYPE=1;	    //일반파일
	public static final int IMAGE_TYPE=2;	//썸네일파일

//	public static String ROOT_FILEPATH = "D:"+File.separator+"apt_LivingFile";
//	public static String ADD_FILEPATH = "D:"+File.separator+"apt_livingFile"+File.separator+"apt_addFile";
//	public static String NOTI_FILEPATH = "D:"+File.separator+"apt_livingFile"+File.separator+"apt_notiFile";

	private static final Logger logger
		= LoggerFactory.getLogger(LivingFileUtil.class);
	
	
	public AddFacilityInfoVO addinfoImgUp(HttpServletRequest request,
			int type,String customPath) throws IllegalStateException, IOException{	
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;	 
		MultipartFile tempimgFile = multiRequest.getFile("addinfoImgFile"); // 뷰 name="addinfoImgFile"
		
		AddFacilityInfoVO imgVo = new AddFacilityInfoVO();
		
		if( !tempimgFile.isEmpty() ) {	//첨부 된 경우
			logger.info("첨부img파일 있다 오바");
			
			String addinfoImgOriginalFilename = tempimgFile.getOriginalFilename();
			//변경된 파일이름 구하기
			String addinfoImgFilename = getUniqueFileName(addinfoImgOriginalFilename);				
			logger.info("변경된 img파일네임 addinfoImgFilename={}",addinfoImgFilename);
			
			//파일전송-업로드처리
			File imgfile = new File(customPath, addinfoImgFilename);
			tempimgFile.transferTo(imgfile);//썸넬 업로드처리
			logger.info("업로드 처리 된 tempimgFile={}",tempimgFile);

			imgVo.setAddinfoImgOriginalFilename(addinfoImgOriginalFilename);
			imgVo.setAddinfoImgFilename(addinfoImgFilename);
		}
	
		return imgVo;
	}
	
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request, 
			int type,String customPath) throws IllegalStateException, IOException{	
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;	 
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, MultipartFile> filesMap = multiRequest.getFileMap();	//다중파일업로드 가능
		//지금 단일파일로 바꾸기는 시간없어서 다중파일 가능하지만 단일만 되도록 뷰에서 multiple지움 나중에 시간될 때 바꾸기 
		Iterator<String> keyIter = filesMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next();
			MultipartFile tempFile = filesMap.get(key);
			//=>업로드 된 파일을 임시 형태로 제공
			
			if( !tempFile.isEmpty() ) {	//첨부 된 경우
				logger.info("첨부파일 있다 오바");
				
				long fileSize = tempFile.getSize();
				String originName = tempFile.getOriginalFilename();
				
				//변경된 파일이름 구하기
				String fileName = getUniqueFileName(originName);				
				logger.info("변경된 파일네임 fileName={}",fileName);
				
				//파일전송-업로드처리
				File file = new File(customPath, fileName);
				tempFile.transferTo(file);//업로드처리
				logger.info("업로드 처리 된 tempFile={}",tempFile);
				
				//변경된 파일명, 패스, 오리지날네임 -> 하나로 묶어서 리턴 => vo 또는 map으로 묶어서 리턴
				//vo랑 map은 비슷, vo가 여러개일 때 list로 묶는것처럼 map을 list로 묶는다
				Map<String , Object> map = new HashMap<String, Object>();
				map.put("originalFileName", originName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
			}
		}//while
		
		return list;
	}

	
	//실제 저장될 파일명 변경(오리지날파일명_시분초밀리초.확장자)
	private String getUniqueFileName(String originName) {
		//abc.txt => abc_20201230123456789.txt
				//20201230 년월일   123456789 시분초
		
		//[1]파일명과 확장자를 분리 
		int idx = originName.lastIndexOf(".");
		String fName = originName.substring(0,idx);	// abc
		String ext = originName.substring(idx);	//.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);
		
		//[2]년월일 + 시분초 연결
		String result = fName + "_" + today + ext;
		logger.info("변경된 파일명 : {}",result);
		return result;

	}
	
}
