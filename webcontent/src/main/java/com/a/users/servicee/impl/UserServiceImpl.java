package com.a.users.servicee.impl;

import java.util.List;

import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.users.servicee.UserService;
import com.a.users.servicee.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	public UserServiceImpl() {
		System.out.println("임플리먼츠 객체생성");
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void insertUser(UserVO vo) {
		this.userDAO.insertUser(vo);

	}

	@Override
	public void updateUser(UserVO vo) {

		this.userDAO.updateUser(vo);

	}

	@Override
	public void deleteUser(UserVO vo) {
		this.userDAO.deleteUser(vo);

	}

	@Override
	public UserVO getUser(UserVO vo) {

		return this.userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {

		return this.userDAO.getUserList(vo);
	}

}
