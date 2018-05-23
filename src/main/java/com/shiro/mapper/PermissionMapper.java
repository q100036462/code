package com.shiro.mapper;

import com.shiro.model.Permission;
import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(Permission record);

    Permission selectByPrimaryKey(Integer permissionId);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);
}