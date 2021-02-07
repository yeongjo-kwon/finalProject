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

//[1] Component 
@Component
public class FileUploadUtil {
	//<util:properties id="fileUploadProperties" location="classpath:/config/props/fileUpload.properties" />
	// 위를 context-common에 추가
	
	//자료실에서 사용하는지, 상품 등록에서 사용하는지 구분하는 상수
	public static final int PDS_TYPE=1;  //자료실에서 사용
	public static final int IMAGE_TYPE=2; //상품등록에서 사용 
	
	@Resource(name="fileUploadProperties")		//원래는 Autowried, Resource 하나로 통일시키는게 권장
	private Properties fileUploadProps;
	
	private static final Logger logger
		=LoggerFactory.getLogger(FileUploadUtil.class);
												//위의 상수를 아예 받아옴
	public List<Map<String, Object>> fileUpload(HttpServletRequest request, int type) throws IllegalStateException, IOException {
													//자식으로 다운캐스팅!
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		//결과를 저장할 리스트! VO대신 Map 사용해준것. 그리고 String, long 같이 쓸 수 있는것 = Object = Value에 넣는다
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//getFileMap() 이용해서 Map을 받아온다! & 여러가지 파일 업로드를 받아옴
		Map<String, MultipartFile> filesMap =multiRequest.getFileMap();
		
		//keySet()으로 Iterator 받아오기
		Iterator<String> keyIter=filesMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next(); //key가 inputType file의 name
			MultipartFile tempFile=filesMap.get(key);
			//=> 업로드 된 파일을 임시파일 형태로 제공 - 이용해서 업로드 파일 된 정보(fileSize, originalFileName..)도 구할 수 있음
			
			if(!tempFile.isEmpty()) {	//업로드 된 경우
				//파일 크기
				long fileSize = tempFile.getSize();
				String originName = tempFile.getOriginalFilename();
				
				//변경된 파일 이름 구하기	getUniqueFileName은 메서드. 메서드 추가해줘야 함
				String fileName = getUniqueFileName(originName);
				
				//파일 전송-업로드 처리 => 파일 객체 생성
								//업로드 된 경로, 변경된 파일 이름
				String upPath = getUploadPath(type, request);
				File file = new File(upPath, fileName);
				tempFile.transferTo(file);	//업로드 처리!! transferTo()
				
				//결과를 VO 혹은 MAP 으로 담아올 수 있음. 둘 다 가능하지만, MAP 으로!!
				//=> Map 은 VO와 비슷한 역할이다 !!!!!!!!!!!
				//Map이 많이 쓰이므로 연습 하자! = VO들을 list로 묶듯이, Map도 list로 묶는다!
				Map<String, Object> map = new HashMap<String, Object>();
				//맵에서의 key가 vo의 멤버변수와 같은 역할
				map.put("originalFileName", originName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
			}
			
		}//while
		return list;
		
		
	}

	public String getUniqueFileName(String originName) {	//파일 이름 구하는 메서드
		//파일명이 중복될 경우 파일명 변경하기
		//파일명에 현재시간을 붙여서 변경된 파일명 구한다  : 년월일 + (시,분,초의)밀리초
		//abc.txt => abc_20201230123456789.txt
		
		//파일명과 확장자 분리, 파일명 뒤에 언더바 붙이고 sdf 써서 패턴 지정하고 붙여준다
		//lastIndexOf, substring 둘 다 이용 가능
		
		int idx=originName.lastIndexOf(".");
		String fName = originName.substring(0, idx); //abc
		String ext = originName.substring(idx);	//.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS"); //밀리초는 SSS
		String today = sdf.format(d);
		
		String result = fName+"_"+today+ext;
		logger.info("변경된 파일명 : {}", result);
		
		return result;
	}
	
	public String getUploadPath(int type, HttpServletRequest request) {	//업로드 경로 구하는 메서드
		//자료실인지, 상품 등록 인지 - 사용하는 쪽에서 먼저 보내와야 함
		
		String testGb=fileUploadProps.getProperty("file.upload.type");  //키 값 을 안에 넣는다
		
		String upPath="";
		if(type==PDS_TYPE) {	//자료실에서 업로드
			if(testGb.equals("test")) {  //여기서 test는 fileUpload.prop- 에 있음
				upPath=fileUploadProps.getProperty("file.upload.path.test");	//key값 copy
				//key에 해당하는 value 값 받아온것
			}else {
				upPath=fileUploadProps.getProperty("file.upload.path");				
				//=> pds_upload
			}
		}else if(type==IMAGE_TYPE) {	//상품 등록시 업로드
			if(testGb.equals("test")) {  
				upPath=fileUploadProps.getProperty("imageFile.upload.path.test");	//key값 copy
			}else {
				upPath=fileUploadProps.getProperty("imageFile.upload.path");
				//=> pd_images
			}			
		}
		
		if(!testGb.equals("test")) {	//test가 아닐때의 물리적 경로 구하기 (배포시 물리적 경로)
		/*
			원래 파일 처리할때의 물리적인 경로를 구할때는
			config.getSevletCocntext.getRealpath / application.getRealpath 사용
			config 를 request의 session에서 받아오자 => request.getSession
			(그리고, 매개변수에 HttpServletRequest request 도 있음)
		*/
			upPath = request.getSession().getServletContext().getRealPath(upPath);
		}
		
		logger.info("파일 업로드 경로 : {}", upPath);
		return upPath;
	
	}
	
}
