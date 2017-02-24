package com.pro.bf.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;




import com.pro.bf.dao.CmmtCmtDao;
import com.pro.bf.daoImpl.AddrDaoImpl;
import com.pro.bf.daoImpl.CmmtCmtDaoImpl;
import com.pro.bf.dto.CmmtCmtVO;
import com.pro.bf.service.CmmtCmtService;

public class CmmtCmtServiceImpl implements CmmtCmtService {
	
	@Autowired
	 CmmtCmtDaoImpl cmmtcmtDAOImpl;
	
	public void setCmmtcmtDAO(CmmtCmtDaoImpl cmmtcmtDAOImpl) {
		this.cmmtcmtDAOImpl = cmmtcmtDAOImpl;
	}



	@Override
	public List<CmmtCmtVO> cmmtcmtAllList(int cmmtcmt_num) throws SQLException {
		List<CmmtCmtVO>cmmtcmtAllList=cmmtcmtDAOImpl.cmmtcmtAllList(cmmtcmt_num);
			
		return cmmtcmtAllList;
	}
	
	//댓글추가
	@Override
	public void intsertCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException {
		if(cmmtcmtVO.getAdmin_id()!=null){
			cmmtcmtDAOImpl.insertCmmtcmtAdmin(cmmtcmtVO);
		}else{
			cmmtcmtDAOImpl.intsertCmmtcmt(cmmtcmtVO);
		}
	}

	//댓글삭제
	@Override
	public int deleteCmmtcmt(int cmmtcmt_num) throws SQLException {
		int result=cmmtcmtDAOImpl.deleteCmmtcmt(cmmtcmt_num);
		return result;
	}

	//댓글리스트
	@Override
	public List<CmmtCmtVO> cmmtcmtListAn(int cmmtcmt_num) throws SQLException {
		
		List<CmmtCmtVO> cmmtcmtList1=cmmtcmtDAOImpl.cmmtcmtListAn(cmmtcmt_num);
		return cmmtcmtList1;
	}
	
	//댓글수정
	@Override
	public void updateCmmtcmt(CmmtCmtVO cmmtcmtVO) throws SQLException {
	//public void updateCmmtcmt(int cmmtcmt_num) throws SQLException {
	cmmtcmtDAOImpl.updateCmmtcmt(cmmtcmtVO);
	//cmmtcmtDAOImpl.updateCmmtcmt(cmmtcmt_num);
	}


	
	
}
