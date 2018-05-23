package com.shiro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shiro.model.User;
import com.shiro.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/userlist")
	public String login(Model m) {
		List<User> userList = userService.selectAllUsers();
		m.addAttribute("userList", userList);
		return "sys/user_list";
	}

	

}
