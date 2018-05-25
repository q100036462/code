package com.shiro.mapper;

import com.shiro.model.User;

import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User>{
	
	List<String> selectRolesByUsername(String username);
	
	List<String> selectPermissionsByUsername(String username);
	
	User selectUserByusername(String username);
	
	int updateType(User user);
}