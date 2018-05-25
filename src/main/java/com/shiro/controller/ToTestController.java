package com.shiro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shiro.model.Goods;
import com.shiro.model.User;
import com.shiro.service.GoodsService;

@Controller
public class ToTestController {
	
	@Autowired
	private GoodsService goodsService;
	
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
	
	@RequestMapping("/selectAllGoods")
	@ResponseBody
	public List<Goods> selectAllGoods(){
		return goodsService.selectAll();
	}
	@RequestMapping("/totest4")
	public String totest4() {
		
		return "sys/test4";
	}
	
	@RequestMapping("/totest5")
	public String totest5() {
		
		return "sys/test5";
	}
	
	@RequestMapping("/totest6")
	public String totest6() {
		
		return "sys/test6";
	}
	@RequestMapping("/totest7")
	public String totest7() {
		
		return "sys/test7";
	}
	
	
}
