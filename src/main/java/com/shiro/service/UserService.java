package com.shiro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	
	//��ѯ�����û�
	public List<User> selectAllUsers() {
		List<User> userList = getMapper().selectAll();
		return userList;
	}
	
	public PageInfo<User> findUserByPage(int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
		List<User> list = getMapper().selectAll();
		return new PageInfo<User>(list);
	}
	//更改用户状态（封禁，解封）
	public boolean updateType(User user) {
		if (user.getType() == 1) {
			user.setType(0);
		}else if (user.getType() == 0) {
			user.setType(1);
		}
		int b = userMapper.updateType(user);
		if (b >= 1) {
			return true;
		}
		return false;
	}

}
