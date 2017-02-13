package com.pro.bf.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.pro.bf.dto.CommunityVO;
import com.pro.bf.dto.MbrVO;
import com.pro.bf.dto.NoticeVO;
import com.pro.bf.dto.QnAVO;

public interface MbrService {

	void insertMember(MbrVO mbrVo) throws SQLException;
	String idCheck(String idcheck) throws SQLException;
	String login(MbrVO mbrVo) throws SQLException;
	String searchUserName(String login) throws SQLException;
	String searchUserId(MbrVO mbrVo) throws SQLException;
	Map searchUserPwd(MbrVO mbrVo) throws SQLException;
	public ArrayList<QnAVO> getQnaList(String mbr_id) throws SQLException;
	public QnAVO getQnaVO(int qna_num) throws SQLException;
	public void insertQna(QnAVO qnaVO) throws SQLException;
	ArrayList<MbrVO> memberList(int page, String search, String selectCombo) throws SQLException;
	String pageNumber(int page, String search, String currentPage, String selectCombo) throws SQLException;
	void deleteMember(String mbr_id) throws SQLException;
	String loginUseYNCheck(String login) throws SQLException;
	void reuseMember(String memberId) throws SQLException;
	ArrayList<MbrVO> memberListForUseyn(String choiceUseYNT) throws SQLException;
	MbrVO MemberVoSearch(String memberId) throws SQLException;
	void memberUpdate(MbrVO mbrvo) throws SQLException;
	String memberListCount() throws SQLException;
}
