package com.jeil.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeil.dto.LoginDTO;
import com.jeil.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert("user.create", vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne("user.login", dto);
	}

	@Override
	public UserVO read(String user_id) throws Exception {
		return session.selectOne("user.read", user_id);
	}

	@Override
	public String check_id(String user_id) throws Exception {
		return session.selectOne("user.check_id", user_id);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		session.update("user.modify", vo);
	}

	@Override
	public void delete(String user_id) throws Exception {
		session.delete("user.delete", user_id);

	}

	@Override
	public String findid(UserVO vo) throws Exception {
		return session.selectOne("user.findid", vo);

	}

	@Override
	public String findpw(UserVO vo) throws Exception {
		return session.selectOne("user.findpw",vo);
	}

	@Override
	public void bid_delete(String board_id) throws Exception {
		session.delete("user.bid_delete", board_id);
	}

}
