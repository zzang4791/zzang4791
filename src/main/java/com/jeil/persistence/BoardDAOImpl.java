package com.jeil.persistence;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeil.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert("board.create", vo);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList("board.listAll");
	}
	
	@Override
	public BoardVO read(int board_no) throws Exception{
		return session.selectOne("board.read", board_no);
	}
	
	@Override
	public void modify(BoardVO vo) throws Exception{
		session.update("board.modify", vo);
	}
	
	@Override
	public int delete(int board_no) throws Exception{
		return session.delete ("board.delete", board_no);
	}
	
	@Override
	public int getBoardListCount(BoardVO vo) throws Exception{
		return session.selectOne("board.getBoardListCount", vo);
	}
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception {
		return session.selectList("board.getBoardList", vo);
	}
	
	
	/*@Override
	public void reply_create(ReplyVO rvo) throws Exception {
		session.insert("reply.reply_create", rvo);
	}
	@Override
	public List<ReplyVO> reply_read(ReplyVO rvo) throws Exception {
		return session.selectList("reply.reply_read", rvo);
	}*/
	
	
	public BoardDAOImpl() {

	}

	
}
