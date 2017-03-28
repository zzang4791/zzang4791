package com.jeil.persistence;

import java.util.List;

import com.jeil.domain.BoardVO;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;
	public BoardVO read(int board_no) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public void modify(BoardVO vo) throws Exception;
	public int delete(int board_no) throws Exception;
	
	public int getBoardListCount(BoardVO vo) throws Exception;
	public List<BoardVO> getBoardList(BoardVO vo)throws Exception;
	
	//public void reply_create(ReplyVO rvo) throws Exception;
	//public List<ReplyVO> reply_read(ReplyVO rvo)throws Exception;
	
}
