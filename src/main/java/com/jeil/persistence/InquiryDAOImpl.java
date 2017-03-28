package com.jeil.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeil.domain.InquiryVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Inject
	private SqlSession session;

	@Override
	public void create(InquiryVO vo) throws Exception {
		session.insert("inquiry.create", vo);
	}

	public InquiryDAOImpl() {

	}
}
