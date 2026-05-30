package dao;

import java.util.ArrayList;
import java.util.List;
import dto.User2DTO;
import util.DBHelper;
import util.SQL;

public class User2DAO extends DBHelper {
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	private User2DAO() {}
	
	// *************** insert ***************
	public void insert(User2DTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER2);
			
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getAddr());
			
			psmt.executeUpdate();

			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	};
	
	// *************** select ***************
	public User2DTO select(String userid) {
		User2DTO dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER2);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new User2DTO();
				dto.setUserid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
			}
			
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	};
	
	// *************** selectAll ***************
	public List<User2DTO> selectAll() {
		List<User2DTO> dtoList = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ALL_USER2);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUserid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dtoList.add(dto);
			}
			
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
	};
	
	
	// *************** update ***************
	public void update(User2DTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_USER2);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getUserid());
			
			psmt.executeUpdate();
			
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	};
	
	
	// *************** delete ***************
	public void delete(String userid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_USER2);
			psmt.setString(1, userid);
			psmt.executeUpdate();
			closeAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
	};
}
