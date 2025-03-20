package com.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.board.config.MybatisManager;


public class BoardDAO {
	
//	필드
	SqlSession session;
	
	public BoardDAO() {
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		session = sqlSessionFactory.openSession();
	}
	
//	추가
	public void insertData(BoardDTO board) {
		session.insert("insertData", board);
		session.commit();
		session.close();
	}
	
//	전체보기
	public List<BoardDTO> listData() {
		return session.selectList("listData");
	}
	
//	상세보기
	public BoardDTO selectData(int num) {
		return session.selectOne("selectData", num);
	}
	
//	수정
	public void updateData(BoardDTO board) {
		session.update("updateData", board);
		session.commit();
		session.close();
	}
	
//	삭제
	public void delete(int num) {
		session.delete("deleteData", num);
		session.commit();
		session.close();
	}

}
