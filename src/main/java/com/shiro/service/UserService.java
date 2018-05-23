package com.shiro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shiro.mapper.UserMapper;
import com.shiro.model.User;
import com.shiro.util.AbstractService;

import tk.mybatis.mapper.common.Mapper;

@Service
public class UserService extends AbstractService<User>{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public Mapper<User> getMapper() {
		// TODO Auto-generated method stub
		return userMapper;
	}
	
	//查询所有用户
	public List<User> selectAllUsers() {
		List<User> userList = getMapper().selectAll();
		return userList;
	}

}
