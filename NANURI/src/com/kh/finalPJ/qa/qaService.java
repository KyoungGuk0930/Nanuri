package com.kh.finalPJ.qa;

import java.util.List;

public interface qaService {
	
	public List<qaDto> getQaList();
	
	public List<qaDto> getAdminQaList();
	
	public boolean QaWrite(qaDto dto);
	
	public boolean ansWrite(qaDto dto);
	
	public boolean qaAdminWrite(qaDto dto);	
	
	public boolean qaDelete(int ref);
	
	public List<Integer> getRef(String id);
	
	public List<Integer> AllgetRef();
	
	public int getBbsCount(qaParam param) throws Exception;
	
	public List<qaDto> getBbsPagingList(qaParam param) throws Exception;
	
	public boolean ansDelete(int seq);
}
