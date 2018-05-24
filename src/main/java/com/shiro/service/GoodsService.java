package com.shiro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shiro.mapper.GoodsMapper;
import com.shiro.model.Goods;
import com.shiro.util.AbstractService;

import tk.mybatis.mapper.common.Mapper;

@Service
public class GoodsService extends AbstractService<Goods>{
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public Mapper<Goods> getMapper() {
		return goodsMapper;
	}
	
	public List<Goods> selectAll() {
		return getMapper().selectAll();
	}

}
