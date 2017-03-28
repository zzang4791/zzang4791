package com.jeil.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeil.domain.ReplyVO;
import com.jeil.domain.UserVO;
import com.jeil.persistence.ReplyDAO;
import com.jeil.service.ReplyService;
import com.jeil.service.UserService;

@Controller
public class ReplyController {
    
	@Inject
    ReplyService replyService;
	ReplyDAO dao;
    // �뙎湲� �엯�젰

	@RequestMapping(value = "/reply_insert")
	@ResponseBody
	 public void insert(HttpServletRequest request, @ModelAttribute ReplyVO rvo, HttpSession session) throws Exception{
		URLDecoder.decode(rvo.getReplyer(), "UTF-8");
		URLDecoder.decode(rvo.getReplytext(), "UTF-8");
		rvo.setReplyer(URLDecoder.decode(rvo.getReplyer(), "UTF-8"));
		rvo.setReplytext(URLDecoder.decode(rvo.getReplytext(), "UTF-8"));
  
		
		replyService.create(rvo);
    }
    

    @RequestMapping("/reply_list")
    public ModelAndView list(@RequestParam int bno, ModelAndView mav){
        List<ReplyVO> list = replyService.list(bno);
        System.out.println("由ъ뒪�듃 �뙎湲� �굹�삤�땲1~~~~~~~~~~~~~~~~~");
        // 酉곗씠由� 吏��젙
        mav.setViewName("board/replyList");

        mav.addObject("list", list);
  
        return mav;
    }
    
    @RequestMapping("/reply_listJson")
    @ResponseBody
    public List<ReplyVO> listJson(@RequestParam int bno){
    	System.out.println("由ъ뒪�듃 �뙎湲� �굹�삤�땲2~~~~~~~~~~~~~~~~~");
        List<ReplyVO> list = replyService.list(bno);

        return list;
    }
    
    @RequestMapping(value = "/reply_delete")
	@ResponseBody
	 public void delete(@RequestParam int rno) throws Exception{
    	System.out.println("�뜽由ы듃::::::::::::::::::::" + rno);
    	replyService.delete(rno);
    }
    
	
}
