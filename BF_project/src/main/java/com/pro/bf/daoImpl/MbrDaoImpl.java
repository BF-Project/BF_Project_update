package com.pro.bf.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.pro.bf.dao.MbrDao;
import com.pro.bf.dto.MbrVO;

public class MbrDaoImpl implements MbrDao{

	private SqlMapClient client;
	public void setClient(SqlMapClient client){
		this.client = client;
	}
	
	@Override
	public void insertMember(MbrVO mbrVo) throws SQLException { // 회원가입
		client.insert("insertMember", mbrVo);
	}

	@Override
	public String idCheck(String userid) throws SQLException { // 아이디 중복확인
		String data = (String)client.queryForObject("idcheck", userid);
		System.out.println("1 내가 입력한 아이디 값 " + userid);
		System.out.println("2 리턴받은 아이디 값(Dao) " + data);
		return data;
	}

	@Override
	public String login(MbrVO mbrVo) throws SQLException { // 로그인
		String login = (String)client.queryForObject("login", mbrVo);
		return login;
	}

	@Override
	public String searchUserName(String login) throws SQLException { // 로그인한 유저 이름 찾기
		String loginUserName = (String)client.queryForObject("SearchLoginUserName", login);
		return loginUserName;
	}

	@Override
	public String searchUserId(MbrVO mbrVo) throws SQLException { // 아이디 찾기
		String id = (String)client.queryForObject("SearchUserId", mbrVo);
		return id;
	}

	@Override
	public MbrVO searchUserPwd(MbrVO mbrVo) throws SQLException { // 비밀번호 찾기 / 이메일도 같이 찾아야함
		MbrVO result = (MbrVO)client.queryForObject("SearchUserPwd", mbrVo);
		return result;
	}

	@Override
	public ArrayList<MbrVO> memberList(String search, int startRow, int counts) throws SQLException {
		ArrayList<MbrVO> memberList = (ArrayList<MbrVO>) client.queryForList("MemberList", search, startRow, counts);
		return memberList;
	}

	@Override
	public ArrayList<MbrVO> memberListforId(String search, int startRow, int counts) throws SQLException {
		ArrayList<MbrVO> memberList = (ArrayList<MbrVO>) client.queryForList("MemberListforId", search, startRow, counts);
		return memberList;
	}
	
	@Override
	public ArrayList<MbrVO> memberListforPhone(String search, int startRow, int counts) throws SQLException {
		ArrayList<MbrVO> memberList = (ArrayList<MbrVO>) client.queryForList("MemberListforPhone", search, startRow, counts);
		return memberList;
	}
	
	@Override
	public int totalRecord(String search) throws SQLException {
		int total_pages = (Integer)client.queryForObject("totalMemberRecord", search);
		return total_pages;
	}
	
	@Override
	public int totalRecordforId(String search) throws SQLException {
		int total_pages = (Integer)client.queryForObject("totalMemberRecordforID", search);
		return total_pages;
	}

	@Override
	public int totalRecordforPhone(String search) throws SQLException {
		int total_pages = (Integer)client.queryForObject("totalMemberRecordforPhone", search);
		return total_pages;
	}

	@Override
	public void deleteMember(String mbr_id) throws SQLException {
		client.update("MemberDelete", mbr_id);
	}

	@Override
	public String loginIdUseYnCheck(String login) throws SQLException {
		String loginIdUseYnCheck = (String) client.queryForObject("LoginUserUseYNCheck", login);
		return loginIdUseYnCheck;
	}

	@Override
	public void reuseMember(String memberId) throws SQLException {
		client.update("ReuseMember",memberId);
	}

	@Override
	public ArrayList<MbrVO> memberListForUseyn(String choiceUseYNT) throws SQLException { // UseYN 으로 회원리스트 받아오기
		ArrayList<MbrVO> memberListUse = (ArrayList<MbrVO>) client.queryForList("MemberListForUseYN", choiceUseYNT);
		return memberListUse;
	}

	@Override
	public MbrVO MemberVoSearch(String memberId) throws SQLException { // 아이디로 회원정보 가져오기 | 상세보기
		MbrVO memberVo = (MbrVO) client.queryForObject("MemberVoSearch", memberId);
		return memberVo;
	}

	@Override
	public void memberUpdate(MbrVO mbrvo) throws SQLException { // 관리자가 회원정보 수정하기
		// 관리자가 수정할 수 있는 회원의 정보는  pw | name | phone | email | address  5개만  | id는 key값으로 사용
		client.update("MemberUpdate",mbrvo);
	}
	
	@Override
	public String memberListCount() throws SQLException { // 회원들중 사용가능자 Y의 전체 수
		int memberUseYCount = (int)client.queryForObject("memberUseYCount");
		return memberUseYCount+"";
	}

	@Override
	public int countForDate(String date) throws SQLException {
		return (int) client.queryForObject("countMbrDate",date);
	}


}