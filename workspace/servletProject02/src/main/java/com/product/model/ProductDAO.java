package com.product.model;

import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.DBConnPool;

public class ProductDAO extends DBConnPool {
	
//	추가하기 메소드
	public int productInsert(ProductDTO product) {
		int result = 0;
		String sql = "INSERT INTO product(name, unitprice, description, ofile, sfile) VALUES(?, ?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setInt(2, product.getUnitPrice());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getOfile());
			ps.setString(5, product.getSfile());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
//	전체보기 메소드
	public ArrayList<ProductDTO> productList() {
		ArrayList<ProductDTO> pList = new ArrayList<>();
		String sql = "SELECT * FROM product ORDER BY pnum";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ProductDTO p = new ProductDTO();
				p.setDescription(rs.getString("description"));
				p.setName(rs.getString("name"));
				p.setOfile(rs.getString("ofile"));
				p.setpNum(rs.getInt("pnum"));
				p.setSfile(rs.getString("sfile"));
				p.setUnitPrice(rs.getInt("unitprice"));
				pList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pList;
	}

}
