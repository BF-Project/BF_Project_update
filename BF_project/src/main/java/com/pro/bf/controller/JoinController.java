package com.pro.bf.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.bf.dto.AddrVO;
import com.pro.bf.dto.EmailVO;
import com.pro.bf.dto.MbrVO;
import com.pro.bf.serviceImpl.AddrServiceImpl;
import com.pro.bf.serviceImpl.AdminServiceImpl;
import com.pro.bf.serviceImpl.MbrServiceImpl;

@Controller
@RequestMapping(value="join")
public class JoinController {
	
	@Autowired
	AddrServiceImpl addrService;
	
	@Resource(name="mbrServiceImpl")
	MbrServiceImpl mbrService;
	
	@Autowired
	EmailSender emailSender;
	
	@Autowired
	AdminServiceImpl adminService;
	
	@RequestMapping(value="joinForm", method=RequestMethod.GET)
	public String JoinForm(){
		String url = "join/joinForm";
		return url;
	}
	
	@RequestMapping(value="joinjoinForm", method=RequestMethod.GET)
	public String JoinForm_Form(@RequestParam(value="email", defaultValue="Y")String email, HttpSession session){
		session.setAttribute("email", email);
		String url = "join/joinjoinForm";
		return url;
	}
	
	@RequestMapping(value="joinjoinForm", method=RequestMethod.POST)
	public String joinForm_Form2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException{
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		String url = "redirect:/start";
		
		String id = request.getParameter("InputId"); // 아이디
		String pwd = request.getParameter("InputPassword1"); // 패스워드
		String name = request.getParameter("username"); // 이름
		String number = request.getParameter("usernumber"); // 전화번호
		String email = request.getParameter("InputEmail"); // 이메일
		String addr1 = request.getParameter("InputAddr1"); // 주소 1(검색)
		String addr2 = request.getParameter("InputAddr2"); // 주소 2(입력)
		String birth = request.getParameter("InputBirth"); // 생년월일
		String gender = request.getParameter("gender"); // 성별
		String emailyn = (String)session.getAttribute("email"); // 이메일 수신여부
		
		MbrVO mbrVo = new MbrVO();
		mbrVo.setMbr_id(id);
		mbrVo.setMbr_pwd(pwd);
		mbrVo.setMbr_nm(name);
		mbrVo.setMbr_phone(number);
		mbrVo.setMbr_eml(email);
		mbrVo.setMbr_addr(addr1 +" "+addr2);
			Date mbr_brt = null;
			try {
				mbr_brt = new SimpleDateFormat("yyyyMMdd").parse(birth);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		mbrVo.setMbr_brt(mbr_brt);
		mbrVo.setMbr_gnd(gender);
		mbrVo.setMbr_eml_yn(emailyn);
		mbrService.insertMember(mbrVo);
		// 
		
		String joinSuccess = "joinSuccess";
		request.setAttribute("joinSuccess", joinSuccess);
		session.setAttribute("joinSuccess", joinSuccess);
		return url;
	}
	
	@RequestMapping("findZipNum")
	public String findZipNum(@RequestParam(value="dong",defaultValue="서초")String dong,
								HttpServletRequest request, HttpServletResponse response, Model model)
								throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String url = "join/findZipNum";
		ArrayList<AddrVO> addressList=addrService.getFindZipNum(dong);
		model.addAttribute("addressList",addressList);
		return url;
	}
	
	@RequestMapping("idcheck")
	@ResponseBody // Ajax에 리턴할 값을 주기위해 사용한다. SJON 형식의 값을 응답할때 유용함. JACKSON으로 인해 문자열로 변환된다.
	public String idcheck(HttpServletRequest request, HttpServletResponse response) throws SQLException{
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String userid = request.getParameter("userid");
		String result = mbrService.idCheck(userid);
		System.out.println("4 리턴받은 아이디 값(Controller) " + result);
		String data = "";
		if(result == null){
			data = "yes";
			// 회원 테이블에서는 아이디값이 없지만 admin의 아이디와 동일하면 안되기 때문에 admin테이블에서도 id 중복여부를 확인한다.
			String adminid = adminService.adminidcheck(userid);
			if(!(adminid==null)){
				System.out.println("4-1 관리자아이디 " + adminid);
				data = "no";
			}
		}else{
			data = "no";
		}
		System.out.println("5 결과 " + data);
//		return null;
		return data; // 그냥 문자열로 리턴하면 WEB-INF/views/data.jsp로 가게되는 꼴... ResponseBody를 사용한다.(Spring에서)
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException{
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
				
		MbrVO mbrVo = new MbrVO();
		mbrVo.setMbr_id(id);
		mbrVo.setMbr_pwd(pwd);
		String login = mbrService.login(mbrVo);
		String data;		
		if(!(login==null)){
			String loginUseYN = mbrService.loginUseYNCheck(login);
			data = "no";
			if(!(loginUseYN.equals("N"))){ // id값을 가져왔을때 useYN을 확인해 N이면 로그인이 불가하다.
				data = "yes";
				// 로그인 했을시 세션에 로그인한 id를 세션에 저장
				session.setAttribute("loginUser", login);			
				// 로그인한 회원 이름 찾기
				String loginUserName = mbrService.searchUserName(login);
				session.setAttribute("loginUserName", loginUserName);
			}
		}else{			
			// 회원 아이디가 없을때 관리자 아이디 로그인 여부
			String adminLogin = adminService.adminLogin(mbrVo);
			if(!(adminLogin==null)){
				data = "admin";
				session.setAttribute("loginAdmin", adminLogin); // 로그인한 관리자 아아디 세션에 저장 --> 관리자 화면에서 이름을 표시해주기 위함
			}else{
				data = "no";
			}
		}
		return data;
	}
	
	@RequestMapping("logout")
	@ResponseBody
	public String logout(HttpSession session, HttpServletRequest request){
		session.removeAttribute("loginUser");
		session.removeAttribute("loginUserName");
		return null;
	}
	
	@RequestMapping("idSearch")
	@ResponseBody
	public String idSearch(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MbrVO mbrVo = new MbrVO();
		mbrVo.setMbr_nm(name);
		mbrVo.setMbr_eml(email);
		String id = mbrService.searchUserId(mbrVo);
		
		String data = "";
		if(!(id==null)){
			data = "yes";
			// 해당 이메일에 아이디를 전송해야함
			EmailVO sendMail = new EmailVO();
			String reciver = email; // 받는 사람의 이메일
			String title = "<성공하는 사람들> " + name +" 님의 아이디 입니다."; // 제목
			String context = "회원님의 아이디는 " + id + " 입니다.";
			
			sendMail.setTo(reciver);
			sendMail.setTitle(title);
			sendMail.setContext(context);
			emailSender.SendMail(sendMail);
			
		}else{
			data = "no";
		}
		
		return data;
	}
	
	@RequestMapping("pwdSearch")
	@ResponseBody
	public String pwdSearch(HttpServletRequest request) throws Exception{
		String data = "";
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		MbrVO mbrVo = new MbrVO();
		mbrVo.setMbr_id(id);
		mbrVo.setMbr_nm(name);
		
		Map result = mbrService.searchUserPwd(mbrVo);
		if(!(result.containsValue("not Information"))){
			data = "yes";
			// 해당 이메일에 비밀번호 보내기
			EmailVO sendMail = new EmailVO();
			String reciver = (String)result.get("email"); // 받는 사람의 이메일
			String title = "<성공하는 사람들> " + name +" 님의 비밀번호 입니다."; // 제목
			String context = "회원님의 비밀번호는 " + result.get("pwd") + " 입니다.";
			
			sendMail.setTo(reciver);
			sendMail.setTitle(title);
			sendMail.setContext(context);
			emailSender.SendMail(sendMail);
		}else{
			data = "no";
		}
		return data;
	}
}