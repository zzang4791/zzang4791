package com.jeil.service;

import java.util.List;

import com.jeil.domain.BoardVO;

public interface BoardService {

	public void create(BoardVO vo)throws Exception;
	public BoardVO read(int board_no)throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public int delete(int board_no) throws Exception;
	
	public int getBoardListCount(BoardVO vo) throws Exception;
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception;

}
