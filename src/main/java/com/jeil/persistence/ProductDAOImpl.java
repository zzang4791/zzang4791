package com.jeil.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeil.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject 
	private SqlSession session;
	
	@Override
	public void create(ProductVO vo) throws Exception{
		session.insert("product.create", vo);
	}
	@Override
	public List<ProductVO> listAll(String product_category) throws Exception {
		return session.selectList("product.listAll", product_category);
		
	}
	
	@Override
	public ProductVO read(int product_no) throws Exception{
		return session.selectOne("product.read", product_no);
	}
	
	@Override
	public void modify(ProductVO vo) throws Exception{
		session.update("product.modify", vo);
	}
	
	@Override
	public int delete(int product_no) throws Exception{
		return session.delete ("product.delete", product_no);
	}
	
}
