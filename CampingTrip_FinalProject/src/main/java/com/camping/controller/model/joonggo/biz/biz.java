package com.camping.controller.model.joonggo.biz;

import java.util.List;
import java.util.Map;

import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.report;

public interface biz {
	public List<joonggo> selectList(String regexp);
	public List<joonggo> setCategoryAndStatus(Map<String,Object> map);
	public List<joonggo> moreResult(Map<String,Object> map);
	public int insert(joonggo joonggo);
	public joonggo selectone(int seq, boolean isupdate);
	public int delete(int seq);
	public int update(joonggo joonggo);
	public List<joonggo> selectPopularHit(int seq);
	public String renew(int seq);
	public int addheart(Map<String,Object> map);
	public int rmheart(Map<String,Object> map);
	public boolean confirmheart(Map<String,Object> map);
	public List<joonggo> person(String id);
	public List<joonggo> selectlist_main();
	public int report(report report);
}
