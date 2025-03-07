package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.member.dto.Member;

public class MemberDAOImpl implements MemberDAO {
	
//	DB 세팅
	private static MemberDAO instance = new MemberDAOImpl();
	public static MemberDAO getInstance() {
		return instance;
	}
//	교재 200p 참조
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();	// Context라는 객체가 커넥션을 만들수 있다고 함 ㄷㄷ
		Context envCtx = (Context)initCtx.lookup("java:comp/env");	// dbcp 커넥션이 저장되어있는 폴더를 lookup 메소드로 찾는다고 함 ㄷㄷ
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		// 근데 굳이 이렇게 안하고 그냥 jdbc 써도 됨 ㅋㅋ
		// 쌤도 스프링 쓰면 이렇게 안한다고 개념만 알아라고 했음 ㅋㅋ
		
		return ds.getConnection();
	}
	
//	데이터 추가
	@Override
	public void memberInsert(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserID());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getTel());
			ps.setString(5, member.getEmail());
			ps.setInt(6, member.getAdmin());
			int updateCount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}

//	전체보기
	@Override
	public ArrayList<Member> memberList() {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Member> mArr = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM member";
			conn = this.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
				Member m = new Member();
				m.setAdmin(rs.getInt("admin"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setPassword(rs.getString("password"));
				m.setTel(rs.getString("tel"));
				m.setUserID(rs.getString("userid"));
				mArr.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return mArr;
	}

	@Override
	public void memberUpdate(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberDelete(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member findById(String userID) {
		// TODO Auto-generated method stub
		return null;
	}

//	아이디 체크
	@Override
	public String idCheck(String userID) {
		String flag = "yes"; // 중복아이디 없음 = 사용가능하다는 의미
		String sql = "SELECT * FROM member WHERE userid = '" + userID + "'";
		
		try(
			Connection conn = this.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);	
		) {
			if(rs.next()) {
//				중복 아이디 있음 = 사용 불가능하다는 의미
				flag = "no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

//	로그인 체크
	@Override
	public int loginCheck(String userID, String password) {
//		회원이 아니면 -1을 리턴 / 회원이면 1을 리턴
//		비밀번호 오류면 2를 리턴
		int flag = -1;
		String sql = "SELECT password FROM member WHERE userid = '" + userID + "'";
		
//		try에 ()를 집어넣으면 저거를 다 끝나고 종료하라는 뜻임
		try(
			Connection conn=this.getConnection();
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(sql);
		) {
			if(rs.next()) {
//				userID는 맞았음, 하지만 비번 검사는 안함
				if(rs.getString("password").equals(password)) {
//					비번까지 다 맞았음
					flag = 1;
				} else {
//					아이디는 맞았는데 비번이 틀림
					flag = 2;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return flag;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
