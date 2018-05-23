package com.shiro.mapper;

import com.shiro.model.Role;
import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    Role selectByPrimaryKey(Integer roleId);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);
}