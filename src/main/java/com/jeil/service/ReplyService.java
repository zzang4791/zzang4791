package com.jeil.service;

import java.util.List;

import com.jeil.domain.ReplyVO;

public interface ReplyService {

    // 댓글 목록
    public List<ReplyVO> list(Integer bno);
    // 댓글 입력
    public void create(ReplyVO rvo);
    // 댓글 수정
    public void update(ReplyVO rvo);
    // 댓글 삭제
    public void delete(Integer rno);
    
}
