package com.shiro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.shiro.model.User;
import com.shiro.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/toUserlistpage")
	public String login(Model m) {
		return "sys/user_list";
	}
	
	@RequestMapping(value="/userlist",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object>findAllByPage(int page,int pageSize){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<User> pager = userService.findUserByPage(page,pageSize);
		resultMap.put("code", 0);
		resultMap.put("msg", "");
		//总条数
		resultMap.put("count", pager.getTotal());
		//获取每页数据
		resultMap.put("data", pager.getList());
		
		
		return resultMap;
		
	}
	
	@RequestMapping(value="/userlist2",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object>findAllByPage2(Integer page,Integer limit){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<User> pager = userService.findUserByPage(page,limit);
		resultMap.put("code", 0);
		resultMap.put("msg", "");
		//总条数
		resultMap.put("count", pager.getTotal());
		//获取每页数据
		resultMap.put("data", pager.getList());
		
		
		return resultMap;
		
	}
	
	@RequestMapping("/updateType")
	@ResponseBody
	public String updateType(User user){
		boolean b = userService.updateType(user);
		if (b) {
			return "success";
		}
		
		return "error";
		
	}

	

}
