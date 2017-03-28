package com.jeil.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeil.mail.Mail;
import com.jeil.mail.MailSender;
import com.jeil.domain.UserVO;
import com.jeil.dto.LoginDTO;
import com.jeil.service.BoardService;
import com.jeil.service.UserService;

@Controller
public class UserContorller {

	@Inject
	private UserService service;
	private BoardService boardservice;
	
	@Autowired
	private Mail mail;
	@Autowired
	private MailSender mailsender;

	private static final Logger logger = LoggerFactory.getLogger(UserContorller.class);

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String createGET() {
		return "user/join.tiles";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String createPOST(HttpServletRequest request, UserVO vo, RedirectAttributes attr, HttpSession session)
			throws Exception {
		service.create(vo);
		attr.addFlashAttribute("msg", "SUCCESS");
		session.invalidate();
		return "redirect:main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		return "user/login.tiles";
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, HttpServletRequest request, LoginDTO dto, Model model,
			RedirectAttributes attr, HttpServletResponse response) throws Exception {
		UserVO vo = service.login(dto);
		session = request.getSession();
		session.setAttribute("login", vo);

		request.getSession().setAttribute("logininfo", true);

		if (vo == null)
		{
			attr.addFlashAttribute("msg", "Failed");
			return "redirect:login";

		} else {
			return "redirect:main";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	@ResponseBody
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		session.getAttribute("login");
		session.invalidate();
		// return "main/main.tiles";
		return "redirect:main";
	}

	@RequestMapping(value = "/mypage", method= {RequestMethod.GET, RequestMethod.POST})
	public String Mypage(Model model, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			model.addAttribute(service.read(user_id));
		}
		return "user/mypage.tiles";
	}

	@RequestMapping(value = "/user/modify", method = RequestMethod.GET)
	public String modifyGET(HttpSession session, Model model) throws Exception {
		return "user/modify.tiles";
	}

	@RequestMapping(value = "/user/modify", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, UserVO vo, Model model, RedirectAttributes attr) throws Exception {
		service.modify(vo);
		session.setAttribute("login", vo);
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:../main";
	}

	@RequestMapping(value = "/user/delete") 
	public String delete(@RequestParam("user_id") String user_id, @RequestParam("board_id") String board_id,
			HttpSession session, RedirectAttributes attr)
			throws Exception {
		service.delete(user_id);
	
		service.bid_delete(board_id);
		session.invalidate();
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:../main";
	}

	@RequestMapping(value = "/findid", method = RequestMethod.GET) //
	public String findIDGET() {
		return "user/findid.tiles";
	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST) //
	public String findIDPOST(HttpServletRequest request, Model model, UserVO vo, RedirectAttributes attr)
			throws Exception {
		String user_id = service.findid(vo);
		if (user_id != null) {
			attr.addFlashAttribute("user", service.findid(vo));
			return "redirect:/login";
		}
		attr.addFlashAttribute("msg", "다시 한번 확인해주세요.");
		return "redirect:findid";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.GET) //
	public String findpwGET() {
		return "user/findpw.tiles";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST) //
	public String findpwPOST(RedirectAttributes attr, @RequestParam("user_email") String user_mail,
			@RequestParam("user_id") String user_id, UserVO vo, Model model) throws Exception {
		String user_pass = service.findpw(vo);
		if (user_pass != null) {
			mail.setContent(user_id + "의 비밀번호는" + user_pass + "입니다.");
			mail.setSubject(user_id + "의 비밀번호 입니다.");
			mail.setReceiver(user_mail);
			mailsender.Sendmail(mail);
			attr.addFlashAttribute("mailMsg", "mailSuccess");
			return "redirect:/main";
		}
		attr.addFlashAttribute("msg", "다시 한번 확인해주세요.");
		return "redirect:/findpw";
	}

	@RequestMapping(value = "/check_id")
	@ResponseBody
	public String checkid(@RequestParam("user_id") String user_id, Model model) throws Exception{
		String checking = service.check_id(user_id);
		if(checking== "" || checking ==null){
			return "true";
		}
		return "false";
	}

}