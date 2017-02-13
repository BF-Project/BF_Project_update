package com.pro.bf.interceptor;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author 차승현<br>
 * (주목적) : ChatWebSocketHandler에 로그인한 session 값을 넘겨주기 위한 Interceptor
 */
public class HandlerInterceptor extends HandlerInterceptorAdapter{

	// return false : controller로 넘겨지지 않음 | 화면전환이 안됨
	// request와 response가 있다는 것은 DispatcherServlet을 지나 왔다는 것임
	// 모든 url 주소값이 interceptor를 통과한다.
	// servlet-context.xml에 <exclude-mapping>으로 등록되어 있는 url 주소값들은 무조껀 true로 화면전환 가능
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// /admin/** url 주소값은 무조껀 true | servlet-context.xml 확인
		request.setCharacterEncoding("UTF-8");
		String userId=getUserId(request); // 접속한 회원 Id
		if(userId!=null){ // 회원이 로그인한 경우
			String dateTime = new Date().toString(); // 접속시간
			String userIp = request.getRemoteAddr(); // 접속 아이피
			String accessUrl = request.getRequestURI(); // 접속한 url
			String action = getAction(handler); // 실행한 action

			String logMessage = String.format("%s,%s,%s,%s,%s", "아이디→"+userId, " | 접속시간→"+dateTime, " | 아이피주소→"+userIp, " | Url→"+accessUrl, " | Action→"+action);
			System.err.println(logMessage); // 로그인한 사용자가 이벤트(action)때마다 콘솔에 출력
			writeFileLine(logMessage, request); // 로그인한 사용자의 이벤트(action)을 기록 
			// request.getSession().getServletContext().getRealPath("/resources/actionLog.txt") 에 저장된다. | 톰켓 서버
		}
		return true; // 기본적으로 모든 url 이 통과된다.
	}
	
	
	
	// -----------------------------------------------------------------------------------------------------------
	
	/**
	 * @param request
	 * @return userId (로그인했을경우 회원 아이디가 리턴된다.)
	 */
	public String getUserId(HttpServletRequest request){
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("loginUser");
		return userId;
	}
	
	public String getAction(Object handler){
		String classMethod = handler.toString();
		String[] splitMethod = classMethod.split("\\.");
		int size = splitMethod.length;
		return splitMethod[size-1];
	}
	
	private void writeFileLine(String logMessage, HttpServletRequest request) throws IOException{
		BufferedWriter out = null;
		try{
//			out=new BufferedWriter(new FileWriter(new File("d:\\actionLog.txt"))); // 새로 만들거나 덮어씌우기
			out=new BufferedWriter(new FileWriter(request.getSession().getServletContext().getRealPath("/resources/actionLog.txt"),true)); // 없을경우 새로 만들거나 계속 이어서 써짐
			out.write(logMessage);
			out.newLine();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(out!=null){
				try{
					out.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
	}
}