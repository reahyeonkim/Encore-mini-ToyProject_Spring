package com.a.bbs.service;

import java.util.List;

public interface BssService {

	
	void insertBss(BssVO vo);

	
	void updateBss(BssVO vo);

	
	void deleteBss(BssVO vo);


	BssVO getBss(BssVO vo);

	
	List<BssVO> getBssList(BssVO vo);

}
