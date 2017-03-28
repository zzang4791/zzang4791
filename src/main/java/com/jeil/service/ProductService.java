package com.jeil.service;

import java.util.List;

import com.jeil.domain.ProductVO;

public interface ProductService {
	public void create(ProductVO vo) throws Exception;
	public ProductVO read(int product_no) throws Exception;
	public List<ProductVO> listAll(String product_category) throws Exception;
	public void modify(ProductVO vo)throws Exception;
	public int delete(int product_no) throws Exception;
	
}
