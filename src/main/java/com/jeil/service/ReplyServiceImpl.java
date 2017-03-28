package com.jeil.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeil.domain.ReplyVO;
import com.jeil.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
    ReplyDAO replyDao;
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(Integer bno) {
        return replyDao.list(bno);
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO rvo) {
        replyDao.create(rvo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO rvo) {
        // TODO Auto-generated method stub
    }
    // 댓글 삭제
    @Override
    public void delete(Integer rno) {
    	replyDao.delete(rno);
    }
 
	
}
