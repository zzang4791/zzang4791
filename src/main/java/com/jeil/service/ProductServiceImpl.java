package com.jeil.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jeil.domain.BoardVO;
import com.jeil.domain.ProductVO;
import com.jeil.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO dao;
	
	@Override
	public void create(ProductVO vo) throws Exception{
		dao.create(vo);
	}
	
	@Override
	public ProductVO read(int product_no) throws Exception{
		return dao.read(product_no);
	}
	
	@Override
	public List<ProductVO> listAll(String product_category) throws Exception{
		return dao.listAll(product_category);
	}
	
	@Override
	public void modify(ProductVO vo) throws Exception{
		dao.modify(vo);
	}
	
	@Override
	public int delete(int product_no) throws Exception{
		return dao.delete(product_no);
	}
	
	
}
