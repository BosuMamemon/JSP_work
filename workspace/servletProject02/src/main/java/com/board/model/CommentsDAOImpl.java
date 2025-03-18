package com.board.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.DBConnPool;

public class CommentsDAOImpl extends DBConnPool implements CommentsDAO {

	@Override
	public ArrayList<CommentsDTO> commentList(int bNum) {
		ArrayList<CommentsDTO> cList = new ArrayList<>();
		String sql = "SELECT * FROM comments WHERE bnum = " + bNum + "ORDER BY cnum DESC";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				CommentsDTO comments = new CommentsDTO();
				comments.setbNum(rs.getInt("bnum"));
				comments.setcNum(rs.getInt("cnum"));
				comments.setComment(rs.getString("comments"));
				comments.setRegdate(rs.getString("regdate"));
				comments.setUserID(rs.getString("userid"));
				cList.add(comments);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cList;
	}

	@Override
	public int commentInsert(CommentsDTO comment) {
		int result = 0;
		String sql = "INSERT INTO comments(userid, comments, bnum) VALUES(?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getUserID());
			ps.setString(2, comment.getComment());
			System.out.println(comment.getComment());
			ps.setInt(3, comment.getbNum());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int commentCount(int bNum) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM comments WHERE bnum = " + bNum;
		
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

}
