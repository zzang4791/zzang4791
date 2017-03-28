package com.jeil.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeil.domain.BoardVO;
import com.jeil.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

@Inject
private BoardDAO dao;

	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Override
	public BoardVO read(int board_no) throws Exception{
		return dao.read(board_no);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception{
		return dao.listAll();
	}
	
	@Override
	public void modify(BoardVO vo) throws Exception{
		dao.modify(vo);
	}
	
	@Override
	public int delete(int board_no) throws Exception{
		return dao.delete(board_no);
	}
	
	@Override
	public int getBoardListCount(BoardVO vo) throws Exception{
		return dao.getBoardListCount(vo);
	}
	
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception{
		return dao.getBoardList(vo);
	}
	
	/*@Override
	public void reply_create(ReplyVO rvo) throws Exception {
		dao.reply_create(rvo);
	}
	@Override
	public List<ReplyVO> reply_read(ReplyVO rvo) throws Exception{
		return dao.reply_read(rvo);
	}*/
public BoardServiceImpl() {
	// TODO Auto-generated constructor stub
}
}
