package com.address.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.address.config.MybatisManager;

public class AddressDAO {
	
//	필드
	SqlSession session;
	
//	생성자
	public AddressDAO() {
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		session = sqlSessionFactory.openSession();
	}
	
//	추가
	public void insert(AddressDTO aDTO) {
		session.insert("insertData", aDTO);
		session.commit();
	}
	
//	전체보기
	public List<AddressDTO> list() {
		List<AddressDTO> aList = session.selectList("listData");
		return aList;
	}
	
//	개수
	public int getCount() {
		int result = session.selectOne("countData");
		return result;
	}
	
//	1개 보기
	public AddressDTO view(int num) {
		return session.selectOne("viewData", num);
	}
	
//	수정
	public void update(AddressDTO adto) {
		session.update("updateData", adto);
		session.commit();
	}
	
//	삭제
	public void delete(int num) {
		session.delete("deleteData", num);
		session.commit();
	}
	
}
