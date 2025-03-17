package com.board.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		}
		
		return result;
	}

	@Override
	public ArrayList<BoardDTO> boardList() {
		ArrayList<BoardDTO> bList = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY num DESC";
		
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
		}
		
		return bList;
	}

	@Override
	public ArrayList<BoardDTO> boardList(int startRow, int endRow) {
		ArrayList<BoardDTO> bList = new ArrayList<>();
		String sql = "SELECT * FROM ("
						+ "SELECT ROWNUM rn, b.* FROM ("
							+ "SELECT * FROM board ORDER BY num DESC"
						+ ") b "
					+ ") WHERE rn between ? and ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
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
		}
		
		return bList;
	}
	
	@Override
	public BoardDTO findByNum(int num) {
		String sql = "SELECT * FROM board WHERE num = " + num;
		BoardDTO board = new BoardDTO();
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setNum(rs.getInt("num"));
				board.setReadCount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
				board.setUserID(rs.getString("userid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return board;
	}

	@Override
	public int boardUpdate(BoardDTO board) {
		String sql = "UPDATE board SET subject = ?, content = ?, regdate = sysdate WHERE num = ?";
		int result = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, board.getSubject());
			ps.setString(2, board.getContent());
			ps.setInt(3, board.getNum());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int boardDelete(int num) {
		String sql = "DELETE FROM board WHERE num =" + num;
		int result = 0;
		
		try {
			st = conn.createStatement();
			result = st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int boardCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM board";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateReadCount(int num) {
		String sql = "UPDATE board SET readcount = readcount + 1 WHERE num =" + num;
		
		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	p.506 검색관련
	@Override
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


}
