package com.jeil.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jeil.service.ProductService;
import com.jeil.domain.BoardVO;
import com.jeil.domain.ProductVO;


@Controller
public class ProductController {
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/hsm_bb", method = RequestMethod.GET)
	public String hsmbbGET(Model model) throws Exception {
		model.addAttribute("hsm_bb", service.listAll("hsm_bb"));
		return "product/hsm_bb.tiles";
	}
	
	@RequestMapping(value = "/hsm_gb", method = RequestMethod.GET)
	public String hsmgbGET(Model model) throws Exception {
		model.addAttribute("hsm_gb", service.listAll("hsm_gb"));
		return "product/hsm_gb.tiles";
	}
	@RequestMapping(value = "/hsm_gt", method = RequestMethod.GET)
	public String hsmgtGET(Model model) throws Exception {
		model.addAttribute("hsm_gt", service.listAll("hsm_gt"));
		return "product/hsm_gt.tiles";
	}
	
	/*-------------------제품 글 올리기------------------*/
	@RequestMapping(value="/product_write", method=RequestMethod.GET)
	public String ProductWriteGET(HttpServletRequest request) throws Exception{
		return "product/product_write.tiles";
	}
	@RequestMapping(value="/product_write", method=RequestMethod.POST)
	public String ProductWritePOST(ProductVO pvo, RedirectAttributes attr) throws Exception{
		attr.addFlashAttribute("P_W", "PWSuccess");
		service.create(pvo);
		return "redirect:/mypage";
	}
	@RequestMapping(value = "/product_read", method = RequestMethod.GET)
	public String productread(@RequestParam("product_no") int product_no, Model model) throws Exception{
		model.addAttribute(service.read(product_no));
		return "product/product_read.tiles";
	}
	@RequestMapping(value = "/product_modify", method = RequestMethod.GET)
	public String productmodifyGET(@RequestParam("product_no") int product_no, Model model) throws Exception{
		model.addAttribute(service.read(product_no));
		return "product/product_modify.tiles";
	}
	@RequestMapping(value="/product_modify", method=RequestMethod.POST)
	public String productmodifyPOST(ProductVO pvo, RedirectAttributes attr) throws Exception{
		 service.modify(pvo);
		return "redirect:/main";
	}
	@RequestMapping(value="/product_delete", method=RequestMethod.GET)
	public String productdelete(@RequestParam("product_no") int product_no, Model model, RedirectAttributes attr) throws Exception{
		attr.addFlashAttribute("deleteOK", "deleteSuccess");
		model.addAttribute(service.delete(product_no));
		return "redirect:/hsm_bb";
	}
}

