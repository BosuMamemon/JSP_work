package com.member.dao;

import java.util.ArrayList;

import com.member.dto.Member;

public interface MemberDAO {
//	메소드
//		데이터 추가
	public void memberInsert(Member member);
//		전체보기
	public ArrayList<Member> memberList();
//		데이터 수정
	public void memberUpdate(Member member);
//		데이터 삭제
	public void memberDelete(Member member);
//		상세보기
	public Member findById(String userID);
//		아이디 중복확인
	public String idCheck(String userID);
//		로그인 체크
	public int loginCheck(String userID, String password);
//		회원 수
	public int getCount();
}
