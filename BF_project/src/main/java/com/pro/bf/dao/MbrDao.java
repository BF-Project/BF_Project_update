package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pro.bf.dto.MbrVO;
import com.pro.bf.dto.NoticeVO;

public interface MbrDao {

	void insertMember(MbrVO mbrVo) throws SQLException;
	String idCheck(String userid) throws SQLException;
	String login(MbrVO mbrVo) throws SQLException;
	String searchUserName(String login) throws SQLException;
	String searchUserId(MbrVO mbrVo) throws SQLException;
	MbrVO searchUserPwd(MbrVO mbrVo) throws SQLException;
	ArrayList<MbrVO> memberList(String search, int startRow, int counts) throws SQLException;
	ArrayList<MbrVO> memberListforId(String search, int startRow, int counts) throws SQLException;
	ArrayList<MbrVO> memberListforPhone(String search, int startRow, int counts) throws SQLException;
	int totalRecord(String search) throws SQLException;
	int totalRecordforId(String search) throws SQLException;
	int totalRecordforPhone(String search) throws SQLException;
	void deleteMember(String mbr_id) throws SQLException;
	String loginIdUseYnCheck(String login) throws SQLException;
	void reuseMember(String memberId) throws SQLException;
	ArrayList<MbrVO> memberListForUseyn(String choiceUseYNT) throws SQLException;
	MbrVO MemberVoSearch(String memberId) throws SQLException;
	void memberUpdate(MbrVO mbrvo) throws SQLException;
	String memberListCount() throws SQLException;
}
