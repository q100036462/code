package com.shiro.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.model.User;

@Controller
public class ToTestController {
	@RequestMapping("/totest1")
	public String totest1() {
		
		return "sys/test1";
	}
	
	@RequestMapping("/totest2")
	public String totest2() {
		
		return "sys/test2";
	}
	
	
	@RequestMapping("/totest3")
	public String totest3() {
		
		return "sys/test3";
	}
	
	
}
