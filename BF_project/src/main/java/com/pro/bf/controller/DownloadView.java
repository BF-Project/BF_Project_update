package com.pro.bf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

// Controller가 아닌 View임 | servlet-context : ViewResolver 와 클래스 bean 등록 확인
public class DownloadView extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)	throws Exception {
		File file = (File)model.get("downloadFile"); // DownloadController에서 리턴한 downloadFile
//		response.setContentType(getContentType()); // 상속받은 AbstractView에서 getContentType()을 받아옴
		response.setContentLength((int)file.length());
		response.setContentType("application/octet-stream;");
		
		String userAgent = request.getHeader("User-Agent"); // os..browser... 등등
		boolean ie = userAgent.indexOf("MSIE") > -1; // MSIE가 있다면 인터넷익스플로어
		String fileName = null;
		if(ie){
			fileName = URLEncoder.encode(file.getName(), "utf-8"); // explore
		}else{
			fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1"); // safari, chrome, ...
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}finally{
			if(fis != null){
				try{
					fis.close();
				}catch(IOException ex){
					System.err.println("DownloadView 클래스 fis 에러 확인");
				}
			}
		}
		out.flush();  
		out.close(); 
	}
}