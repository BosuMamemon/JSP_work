package com.board.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.DBConnPool;

public class BoardDAOImpl extends DBConnPool implements BoardDAO {

	@Override
	public int boardInsert(BoardDTO board) {
		int result = 0;
		String sql = "INSERT INTO board(userid, subject, email, content) VALUES(?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, board.getUserID());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return result;
	}

	@Override
	public ArrayList<BoardDTO> boardList() {
		ArrayList<BoardDTO> bList = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY num";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setNum(rs.getInt("num"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
				board.setUserID(rs.getString("userid"));
				
				bList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		
		return bList;
	}

	@Override
	public BoardDTO findByNum(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardUpdate(BoardDTO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(BoardDTO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
