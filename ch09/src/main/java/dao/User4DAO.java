package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User4DTO;
import util.DBHelper;
import util.SQL;

public class User4DAO extends DBHelper{
	
	private static User4DAO instance = new User4DAO();
	public static User4DAO getInstance() {
		return instance;
	}
	private User4DAO() {}
	

	public void insert(User4DTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER4);
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getGender());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getHp());
			psmt.setString(6, dto.getAddr());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	};
	
	public User4DTO select(String userid) {
		User4DTO dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER4);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new User4DTO();
				dto.setUserid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dto.setHp(rs.getString(5));
				dto.setAddr(rs.getString(6));
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dto;
	};
	
	public List<User4DTO> selectAll() {
		List<User4DTO> dtoList = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ALL_USER4);
			rs = psmt.executeQuery();
			while(rs.next()) {
				User4DTO dto = new User4DTO();
				dto.setUserid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dto.setHp(rs.getString(5));
				dto.setAddr(rs.getString(6));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dtoList;
	};
	
	public void update(User4DTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_USER4);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getGender());
			psmt.setInt(3, dto.getAge());
			psmt.setString(4, dto.getHp());
			psmt.setString(5, dto.getAddr());
			psmt.setString(6, dto.getUserid());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	};
	
	public void delete(String userid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_USER4);
			psmt.setString(1, userid);
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	};
	
}
