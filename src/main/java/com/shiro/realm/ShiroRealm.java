package com.shiro.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.shiro.mapper.UserMapper;
import com.shiro.model.User;


public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserMapper userMapper;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 1.通过AuthenticationToken获取用户�?
		String username = (String) token.getPrincipal();
		// 2.通过用户名查询数据库，判断该用户是否存在
		// selectOne(Admin admin); 如果admin只传递了�?个参数就根据该参数进行查询，如果传�?�两个参数就where
		// username = ? and password= ?
		User user = new User();
		user.setUsername(username);
		User u = userMapper.selectOne(user);
		// SimpleAuthenticationInfo:
		// 第一个参数:可以传Admin，也可以传username
		// 第二个参数:从数据库中查询出的密�?
		// 第三个参数:盐值 ByteSource.util.bytes("");
		// 第四个参数:当前ShiroRealm对象，为了获取用户输入的密码
		if (!"".equals(u.getUsername())) {
			// 数据库中有该用户信息
			// 3.查看该用户的密码是否可以匹配的上
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(u.getUsername(), u.getPassword(),
					ByteSource.Util.bytes(u.getSalt()), getName());
			if (u.getType()==1) {
				return info;
			}else {
				// 用户被锁定
				throw new UnknownAccountException("用户被锁定！");
			}
		} else {
			// 没有用户信息
			throw new UnknownAccountException("用户不存在！");
		}
	}

	/**
	 * @description 授权
	 * 		如果�?要断点调试授权部分的bug，首先需要在认证阶段打断点然后再授权打断�?
	 * 		�?终需要从认证阶段的断点跳入授权的断点�?
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
		// 1.获取从认证阶段传递过来的用户信息/用户�? SimpleAuthenticationInfo的第�?个参�?
		String username = (String) collection.getPrimaryPrincipal();
		List<String> roleList = null;
		List<String> permissionList = null;
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 2.通过用户名查询该用户�?拥有的角�?
		if (!"".equals(username)) {
			// 用户名传递时没有丢失
			roleList = userMapper.selectRolesByUsername(username);
			// 3.通过username查询该用户下�?拥有的权�?
			permissionList = userMapper.selectPermissionsByUsername(username);
		} else {
			roleList = new ArrayList<String>();
			permissionList = new ArrayList<String>();
		}
		// 4.把从数据库中查询出的角色和权限信息放入SimpleAuthorizationInfo对象�?
		info.addRoles(roleList);
		info.addStringPermissions(permissionList);
		return info;
	}
}
