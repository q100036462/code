package com.shiro.util;

import java.util.List;
import tk.mybatis.mapper.common.Mapper;

public abstract class AbstractService<T> {
	
	public abstract Mapper<T> getMapper();
	
	public List<T> selectAllUsers() {
		return getMapper().selectAll();
	}

}
