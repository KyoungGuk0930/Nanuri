package com.kh.finalPJ.qa;

import java.util.List;

public interface qaDao {
	
	public List<qaDto> getQaList();
	
	public List<qaDto> getAdminQaList();
	
	public boolean QaWriteN(qaDto dto);
	
	public boolean QaWriteY(qaDto dto);
	
	public boolean ansWriteN(qaDto dto);
	
	public boolean ansWriteY(qaDto dto);
	
	public boolean qaAdminWrite(qaDto dto);
	
	public boolean qaDelete(int ref);
	
	public List<Integer> getRef(String id);
	
	public List<Integer> AllgetRef();
	
	int getBbsCount(qaParam param) throws Exception;
	
	List<qaDto> getBbsPagingList(qaParam param) throws Exception;
	
	public boolean ansDelete(int seq);
}











