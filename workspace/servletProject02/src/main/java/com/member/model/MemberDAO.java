package com.member.model;

import java.util.ArrayList;

public interface MemberDAO {
	
//	가상 메소드: 추가
	public void memberJoin(MemberDTO member);
	
//	가상 메소드: 전체보기
	public ArrayList<MemberDTO> getMember();
	
//	가상 메소드: 수정
	public void memberUpdate(MemberDTO member);
	
//	가상 메소드: 삭제
	public void memberDelete(String userID);
	
//	가상 메소드: 상세보기
	public MemberDTO findByID(String userID);
	
//	가상 메소드: 회원 수
	public int getCount();
	
//	가상 메소드: 아이디 중복 확인
	public String CheckDuplicate(String userID); 
	
//	가상 메소드: 로그인
	public MemberDTO memberLoginCheck(String userID, String password);

}
