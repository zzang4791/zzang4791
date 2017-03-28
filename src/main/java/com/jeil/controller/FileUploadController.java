package com.jeil.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FileUploadController {
	 @RequestMapping(value = "/fileUpload")
	 @ResponseBody
	    public HashMap<String, Object> fileUp(MultipartHttpServletRequest multi, Model model, HttpServletRequest request) {
	       /* String root = "C:/Users/KYJ/git/JeilMachinery/JM_Project/src/main/webapp/";*/
		 	String root = "C:/WORKSPACE/JM_Project/src/main/webapp/"; 
	        String path = root+"resources/upload/";
	        String newFileName = ""; 

	        File dir = new File(path);
	        if(!dir.isDirectory()){
	            dir.mkdir();
	        }

	        Iterator<String> files = multi.getFileNames();
	        while(files.hasNext()){
	            String uploadFile = files.next();
	            MultipartFile mFile = multi.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            
	            newFileName = System.currentTimeMillis()+"."
	                    +fileName.substring(fileName.lastIndexOf(".")+1);
	            try {
	                mFile.transferTo(new File(path+newFileName));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        HashMap<String, Object> hashmap = new HashMap<String, Object>();
	        hashmap.put("KEY", newFileName);

	        return hashmap;
	        //return "product/product_write.tiles";
	    }

}
