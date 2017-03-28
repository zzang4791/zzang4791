package com.jeil.interceptor;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.jdbc.log.Log;

public class LoginInterceptor extends HandlerInterceptorAdapter {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
		   Object handler)
         throws Exception {
      request.getSession().getAttribute("logininfo");
      if(request.getSession().getAttribute("logininfo")==null){
         response.sendRedirect("../login");
         return false ; 
      }
      return true;
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      HttpSession session = request.getSession();
      
      response.setHeader("Pragma", "No-Cache"); //캐쉬에 저장된 것을 안불러옴
  	response.setHeader("Cache-Control", "No-Cache"); // 캐쉬 없애기
  	response.setDateHeader("Expires", 0);
  	
   }

}