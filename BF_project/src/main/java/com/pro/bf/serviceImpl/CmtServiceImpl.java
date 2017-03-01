package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.bf.dao.CmmtCmtDao;
import com.pro.bf.dao.CmtDao;
import com.pro.bf.daoImpl.CmtDaoImpl;
import com.pro.bf.dto.CmtVO;
import com.pro.bf.service.CmtService;

public class CmtServiceImpl implements CmtService {

	@Autowired
	CmtDaoImpl cmtDaoImpl;

	public void setCmtDAO(CmtDaoImpl cmtDaoImpl) {
		this.cmtDaoImpl = cmtDaoImpl;
	}

		
	
	
	@Override
	public List<CmtVO> cmtAllList(int cmt_num) throws SQLException {
		List<CmtVO> cmtAllList = cmtDaoImpl.cmtAllList(cmt_num);
		return cmtAllList;
	}

	@Override
	public void insertCmt(CmtVO cmtVO) throws SQLException {
		if(cmtVO.getMbr_id()==null || cmtVO.getMbr_id().trim().equals("")){
			cmtDaoImpl.adminInsertCmt(cmtVO);// 관리자가 댓글 달기
		}else{
			cmtDaoImpl.intsertCmt(cmtVO); // 회원이 댓글 달기
		}

	}


	@Override
	public void updateCmt(CmtVO cmtVO) throws SQLException {
		cmtDaoImpl.updateCmt(cmtVO);
	}

	//댓글삭제
	@Override
	public int deleteCmt(int cmt_num) throws SQLException {
		int result=cmtDaoImpl.deleteCmt(cmt_num);
		return result;
	}
	
	//댓글리스트
	@Override
	public List<CmtVO> cmtListAn(int cmt_num) throws SQLException {
		List<CmtVO> cmtList=cmtDaoImpl.cmtListAn(cmt_num);
		return cmtList;
	}




	@Override
	public String searchContent(int result) throws SQLException {
		String cmtContent = cmtDaoImpl.cmtContentSearch(result);
		return cmtContent;
	}

	public void cmtContentUpdate(CmtVO cmtVo) throws SQLException{
		cmtDaoImpl.cmtContentUpdate(cmtVo);
	}
}
