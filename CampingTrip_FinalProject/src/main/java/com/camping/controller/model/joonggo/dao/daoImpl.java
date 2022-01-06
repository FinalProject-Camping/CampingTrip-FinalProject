package com.camping.controller.model.joonggo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.controller.model.joonggo.dto.heart;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.renew;

@Repository
public class daoImpl implements dao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<joonggo> selectList(String regexp) {
		List<joonggo> res = new ArrayList<joonggo>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "selectList", regexp);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<joonggo> setCategoryAndStatus(Map<String, Object> map) {
		List<joonggo> res = new ArrayList<joonggo>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "selectCategory", map);
		} catch (Exception e) {
			System.out.println("[error] : selectCategory");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<joonggo> moreResult(Map<String, Object> map) {
		List<joonggo> res = new ArrayList<joonggo>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "moreResult", map);
		} catch (Exception e) {
			System.out.println("[error] : moreResult");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(joonggo joonggo) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", joonggo);
			if(res > 0) {
				return joonggo.getSeq(); //selectkey통해 dto에 담겨진 seq를 받기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public joonggo selectone(int seq) {
		
		joonggo res = new joonggo();
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectone", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int recordHitData(int seq) {

		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "recordhitdata", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateviewcnt(int seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateviewcnt", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int delete(int seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(joonggo joonggo) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", joonggo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<joonggo> selectPopularHit(int seq) {
		List<joonggo> res = new ArrayList<joonggo>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "popularhit", seq);
		} catch (Exception e) {
			System.out.println("[error] : popularhit");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<renew> confirmRenew(int seq) {
		
		List<renew> res = new ArrayList<renew>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "confirmrenew", seq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateRenew(int seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updaterenew", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertRenew(int seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "insertrenew", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int addheart(Map<String,Object> map) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "addheart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int upheart(Map<String, Object> map) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "upheart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int rmheart(Map<String, Object> map) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "rmheart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int downheart(Map<String, Object> map) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "downheart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public heart confirmheart(Map<String, Object> map) {
		heart heart = null;
		
		try {
			heart = sqlSession.selectOne(NAMESPACE + "confirmheart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return heart;
	}

	@Override
	public List<joonggo> person(String id) {
		List<joonggo> res = new ArrayList<joonggo>();
		
		try {
			res = sqlSession.selectList(NAMESPACE + "person", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	


	
	

}

















