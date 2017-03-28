package com.jeil.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeil.domain.InquiryVO;
import com.jeil.persistence.InquiryDAO;

@Service
public class InquiryServiceImpl implements InquiryService {

@Inject
private InquiryDAO dao;

	@Override
	public void create(InquiryVO vo) throws Exception {
		dao.create(vo);
		
	}
public InquiryServiceImpl() {
	// TODO Auto-generated constructor stub
}
}
