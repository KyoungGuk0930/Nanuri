package com.kh.finalPJ.qa;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class qaDaoImpl implements qaDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private String namespace ="KhQa.";

	@Override
	public List<qaDto> getQaList() {
		List<qaDto> list = sqlSession.selectList(namespace + "getQaList");
		return list;
	}	

	@Override
	public List<qaDto> getAdminQaList() {
		List<qaDto> adminlist = sqlSession.selectList(namespace + "getAdminQaList");		
		return adminlist;
	}

	@Override
	public boolean QaWriteN(qaDto dto) {
		int n = sqlSession.insert(namespace + "QaWriteN", dto);
		return n>0?true:false;
	}	

	@Override
	public boolean QaWriteY(qaDto dto) {
		System.out.println("--------------------"+dto.getG_code());
		int n = sqlSession.insert(namespace + "QaWriteY", dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean ansWriteN(qaDto dto) {
		int n = sqlSession.insert(namespace + "ansWriteN", dto);
		return n>0?true:false;	
	}

	@Override
	public boolean ansWriteY(qaDto dto) {
		int n = sqlSession.insert(namespace + "ansWriteY", dto);
		return n>0?true:false;	
	}

	@Override
	public boolean qaAdminWrite(qaDto dto) {
		int n = sqlSession.insert(namespace + "qaAdminWrite", dto);
		return n>0?true:false;
	}

	@Override
	public boolean qaDelete(int ref) {
		int n = sqlSession.delete(namespace + "qaDelete", ref);
		return n>0?true:false;
	}

	@Override
	public List<Integer> getRef(String id) {
		List<Integer> ref = sqlSession.selectList(namespace + "getRef", id);
		return ref;
	}

	@Override
	public List<Integer> AllgetRef() {
		List<Integer> ref = sqlSession.selectList(namespace + "AllgetRef");
		return ref;
	}

	@Override
	public int getBbsCount(qaParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace + "getBbsCount", param); 
		return num;
	}

	@Override
	public List<qaDto> getBbsPagingList(qaParam param) throws Exception {
		List<qaDto> list = sqlSession.selectList(namespace + "getBbsPagingList", param);
		return list;
	}

	@Override
	public boolean ansDelete(int seq) {
		int n = sqlSession.delete(namespace + "ansDelete", seq);
		return n>0?true:false;
	}


}




















