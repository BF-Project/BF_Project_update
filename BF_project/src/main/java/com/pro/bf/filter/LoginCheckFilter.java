package com.pro.bf.filter;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{
   
   private String[] uri = null;

   @Override
   public void init(FilterConfig arg0) throws ServletException {
      String names = arg0.getInitParameter("uri");
      StringTokenizer st = new StringTokenizer(names, ",");
      uri = new String[st.countTokens()];
      for(int i=0; st.hasMoreTokens(); i++){
         uri[i] = st.nextToken(); // qna,simulator,free,chat
      }
   }
   
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	   request.setCharacterEncoding("UTF-8");
      HttpServletRequest httpRequest = (HttpServletRequest) request;
      HttpSession session = httpRequest.getSession(false);
      boolean login = false;
      if(includeUri(httpRequest)){ // true 일때만 | 회원페이지 uri
         if(session != null){
            if(session.getAttribute("loginUser") != null){
               chain.doFilter(request, response);
               return; // 로그인 되어 있다면 그냥 리턴
            }
         }
         if(login){
            return;
         }else{ // login의 기본 값이 false임, 로그인이 되어 있지 않다면 여기로옴
            // 0
//            request.getRequestDispatcher("/filter").forward(request, response);  
            // 1
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/start.jsp"); // 둘중 한가지로 로그인 처리
//            dispatcher.forward(request, response);
            // 2
        	String requestUri = ((HttpServletRequest) request).getRequestURI().toString().trim().toLowerCase();
        	if(requestUri.contains("chat")){
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.sendRedirect("/bf/filter2");
        		return;
        	}
        		
        	session.setAttribute("needTologin", "needTologin");
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("/bf/filter");
            return;
         }
      }else{ // admin이거나 or uri주소를 지정한 것이 아닐때
         chain.doFilter(request, response);
         return;
      }
   }

   private boolean includeUri(HttpServletRequest request){
      String requestUri = request.getRequestURI().toString().trim().toLowerCase();
      boolean result = false;
      if(requestUri.contains("admin")){ // admin , 관리자 모드
         return false;
      }
      for(int i = 0; i < uri.length; i++){
         if(requestUri.contains(uri[i])){
            return true;
         }
      }
      return result;
   }
   
   @Override
   public void destroy() {
   }
}