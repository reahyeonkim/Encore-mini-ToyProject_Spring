package com.a.bss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a.bbs.service.BssService;
import com.a.bbs.service.BssVO;

@Service("bssService")
public class BssServiceImpl implements BssService {
	@Autowired
	private BssDAO bssDAO;

	public BssServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public BssDAO getBssDAO() {
		return bssDAO;
	}

	public void setBssDAO(BssDAO bssDAO) {
		this.bssDAO = bssDAO;
	}

	@Override
	public void insertBss(BssVO vo) {
		this.bssDAO.insertBss(vo);

	}

	@Override
	public void updateBss(BssVO vo) {

		this.bssDAO.updateBss(vo);

	}

	@Override
	public void deleteBss(BssVO vo) {

		this.bssDAO.deleteBss(vo);

	}

	@Override
	public BssVO getBss(BssVO vo) {
		
		return this.bssDAO.getBss(vo);
	}

	@Override
	public List<BssVO> getBssList(BssVO vo) {
		
		return this.bssDAO.getBssList(vo);
	}

}
