package com.camping.controller.model.joonggo.dao;

import java.util.List;
import java.util.Map;

import com.camping.controller.model.joonggo.dto.heart;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.renew;

public interface dao {
	String NAMESPACE = "myjoonggo.";
	public List<joonggo> selectList(String regexp);
	public List<joonggo> setCategoryAndStatus(Map<String, Object> map);
	public List<joonggo> moreResult(Map<String, Object> map);
	public int insert(joonggo joonggo);
	public joonggo selectone(int seq);
	public int updateviewcnt(int seq);
	public int recordHitData(int seq);
	public int delete(int seq);
	public int update(joonggo joonggo);
	public List<joonggo> selectPopularHit(int seq);
	public List<renew> confirmRenew(int seq);
	public int updateRenew(int seq);
	public int insertRenew(int seq);
	public int addheart(Map<String,Object> map);
	public int upheart(Map<String,Object> map);
	public int rmheart(Map<String,Object> map);
	public int downheart(Map<String,Object> map);
	public heart confirmheart(Map<String,Object> map);
	public List<joonggo> person(String id);
	
}
