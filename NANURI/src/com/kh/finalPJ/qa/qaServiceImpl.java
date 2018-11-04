package com.kh.finalPJ.qa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class qaServiceImpl implements qaService {
	
	@Autowired
	qaDao QaDao;

	@Override
	public List<qaDto> getQaList() {
		return QaDao.getQaList();
	}

	@Override
	public List<qaDto> getAdminQaList() {
		return QaDao.getAdminQaList();
	}	

	@Override
	public boolean QaWrite(qaDto dto) {
		if(dto.getG_code()== null) {
			// 상품번호 없을때
			return QaDao.QaWriteN(dto);			
		}else {
			//상품번호 있을때
			return QaDao.QaWriteY(dto);
		}
	}

	// 상품번호 있을때 없을때 둘다 사용가능
	@Override 
	public boolean ansWrite(qaDto dto) {
		if(dto.getG_code().equals("null")) {
			// 상품번호 없을때
			return QaDao.ansWriteN(dto);			
		}else {
			//상품번호 있을때
			return QaDao.ansWriteY(dto);
		}
	}

	@Override
	public boolean qaAdminWrite(qaDto dto) {		
		return QaDao.qaAdminWrite(dto);
	}

	@Override
	public boolean qaDelete(int ref) {
		return QaDao.qaDelete(ref);
	}

	@Override
	public List<Integer> getRef(String id) {
		return QaDao.getRef(id);
	}

	@Override
	public List<Integer> AllgetRef() {
		return QaDao.AllgetRef();
	}

	@Override
	public int getBbsCount(qaParam param) throws Exception {
		return QaDao.getBbsCount(param);
	}

	@Override
	public List<qaDto> getBbsPagingList(qaParam param) throws Exception {
		return QaDao.getBbsPagingList(param);
	}

	@Override
	public boolean ansDelete(int seq) {
		return QaDao.ansDelete(seq);
	}



}
