package com.jeil.controller;


import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeil.domain.BoardVO;
import com.jeil.domain.PageVO;
import com.jeil.service.BoardService;

import freemarker.log.Logger;

@Controller
public class BoardController {

	@Inject
	private BoardService service;
	
	@RequestMapping(value="/main")
	public String main(){
		return "main/main.tiles";
	}
	
	@RequestMapping(value="/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String listAll(Model model, @ModelAttribute("BoardVO") BoardVO BoardVO) throws Exception{

	    int totalCount = service.getBoardListCount(BoardVO);
	    BoardVO.setTotalCount(totalCount); 
	    model.addAttribute("pageVO", BoardVO);
	    List<BoardVO> BoardList = service.getBoardList(BoardVO);
	    model.addAttribute("resultList", BoardList);
	   
		return "board/list.tiles";
	}
	@RequestMapping(value = "/read", method= RequestMethod.GET)
	public String read(@RequestParam("board_no") int board_no, Model model) throws Exception{
		model.addAttribute(service.read(board_no));
		return "board/read.tiles";
	}
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String listWriteG() throws Exception{
		return "board/write.tiles";
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String listWriteP(BoardVO bvo, RedirectAttributes attr) throws Exception{
		 attr.addFlashAttribute("WriteP", "SuccessP");
		 System.out.println(bvo.getBoard_title());
		 System.out.println(bvo.getBoard_content());
		 service.create(bvo);
		return "redirect:/list";
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String ModifyGET(@RequestParam("board_no") int board_no, Model model) throws Exception{
	
		model.addAttribute(service.read(board_no));
		return "board/modify.tiles";
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String ModifyPOST(BoardVO bvo, RedirectAttributes attr) throws Exception{
		 service.modify(bvo);
		return "redirect:/list";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String DeleteGET(@RequestParam("board_no") int board_no, Model model, RedirectAttributes attr) throws Exception{
		attr.addFlashAttribute("deleteOK", "deleteSuccess");
		model.addAttribute(service.delete(board_no));
		return "redirect:/list";
	}
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String createIntro() throws Exception {
		return "board/intro.tiles";
	}
}
