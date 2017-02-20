package com.pro.bf.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.pro.bf.serviceImpl.CommunityServiceImpl;
import com.pro.bf.serviceImpl.FreeServiceImpl;
import com.pro.bf.serviceImpl.QnAServiceImpl;


//xml에 쿼리 기입추가!!!!!!!!!!!!!!
@Controller
public class FreeDownloadController implements ApplicationContextAware {

	@Autowired
	FreeServiceImpl freeServiceImpl;
		
	private WebApplicationContext context=null;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.context=(WebApplicationContext)applicationContext;
	}
		
	@RequestMapping("freephotoDownload/{filekey}")//file이름을 받아와서 다운로드 학기위함
	public ModelAndView download(
			@PathVariable String filekey,
			HttpServletResponse response,HttpServletRequest request)
			throws IOException,NumberFormatException,SQLException{
		
		//jsp에서 받아온 key값(filekey)로 파일 이름을 찾아온다.		
		String fileName=freeServiceImpl.freeFileNameSearch(Integer.parseInt(filekey));
		File downloadFile =getFile(fileName,request);
		//null일때
		if(downloadFile==null){
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	return new ModelAndView("download","downloadFile",downloadFile);
	// DownloadView클래스를 download 라는 이름으로 bean등록해놔야함
			// --> DownloadView 클래스로 리턴된다. // downloadFile를 model에 담아서 간다.
	}
	
	private File getFile(String fileName, HttpServletRequest request) {
		String fileSite=request.getSession().getServletContext().getRealPath("resources/upload");//배포폴더
		return new File(fileSite,fileName);
	}
			
}
