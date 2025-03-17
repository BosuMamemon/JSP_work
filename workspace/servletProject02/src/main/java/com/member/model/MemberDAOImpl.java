package com.member.model;

import java.security.SecureRandomSpi;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.DBConnPool;

public class MemberDAOImpl extends DBConnPool implements MemberDAO {
	
//	생성자
	public MemberDAOImpl() {
		super();
	}
	
//	Methods
	
	@Override
	public void memberJoin(MemberDTO member) {
		String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserID());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getTel());
			ps.setString(5, member.getEmail());
			ps.setInt(6, member.getAdmin());
			int updateCount = ps.executeUpdate();
			
			System.out.println("member 테이블에" + updateCount + "개의 행을 삽입했습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
	}

	@Override
	public ArrayList<MemberDTO> getMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberDelete(String userID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDTO findByID(String userID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String CheckDuplicate(String userID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO memberLoginCheck(String userID, String password) {
		MemberDTO member = new MemberDTO();
		member.setAdmin(-1);
		String sql = "SELECT * FROM member WHERE userid = '" + userID + "'";
		try {
//			비회원, 성공, 비번 오류
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
//				id가 DB에 있다는 뜻
				if(rs.getString("password").equals(password)) {
//					password도 DB랑 일치한다는 뜻(로그인 성공)
					member.setAdmin(rs.getInt("admin"));
					member.setEmail(rs.getString("email"));
					member.setName(rs.getString("name"));
					member.setPassword(rs.getString("password"));
					member.setTel(rs.getString("tel"));
					member.setUserID(rs.getString("userid"));
				} else {
//					password가 DB에 없다는 뜻
					member.setAdmin(2);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}

}
