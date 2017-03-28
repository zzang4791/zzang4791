package com.jeil.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MailController {
	
	 @Autowired
	  private JavaMailSender mailSender;
	 
	  // mailSending 肄붾뱶
	  @RequestMapping(value = "/ssss")
	  public String mailSending(HttpServletRequest request, RedirectAttributes attr) {
	   
	    String setfrom =  "whdans4791@gmail.com";	
	    String tomail  = "whdans4791@gmail.com";   
	    String title   = request.getParameter("email");     
	    String content = request.getParameter("content");    
	    String phone = request.getParameter("phone");
	    
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  
	      messageHelper.setTo(tomail);     
	      messageHelper.setSubject(title); 
	      messageHelper.setText("<html><head></head><body>"+ 
	      "<table><tr><td>"+content+"</tr></td>"+
	      "<br><br><br>"+phone+"</table></body></html>", true); 
	      mailSender.send(message);
	      attr.addFlashAttribute("mailMsg", "mailSuccess");
	      System.out.println("硫붿씪�쟾�넚�셿猷�");
	      
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/main";
	  }

}
