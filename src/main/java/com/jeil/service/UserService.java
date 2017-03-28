package com.jeil.service;

import com.jeil.dto.LoginDTO;
import com.jeil.domain.UserVO;

public interface UserService {

	
	public void create(UserVO vo)throws Exception;
    public UserVO login(LoginDTO dto)throws Exception;
    public UserVO read(String user_id) throws Exception;
    public String check_id(String user_id) throws Exception;
    public void modify(UserVO vo) throws Exception;
    public void delete(String user_id)throws Exception;
    public String findid(UserVO vo)throws Exception;
    public String findpw(UserVO vo)throws Exception;
    
    public void bid_delete(String board_id)throws Exception;
}
