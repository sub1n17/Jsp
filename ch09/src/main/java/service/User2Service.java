package service;

import java.util.List;

import dao.User2DAO;
import dto.User2DTO;

public class User2Service {

	private static User2Service instance = new User2Service(); 
	public static User2Service getInstance() {
		return instance;
	}
	private User2Service() {}
	
	// DAO 객체 가져오기
	private User2DAO dao = User2DAO.getInstance();
	
	public void register(User2DTO dto) {
		dao.insert(dto);
	};
	
	public User2DTO findbyId(String userid) {
		return dao.select(userid);
	};
	
	public List<User2DTO> findAll() {
		return dao.selectAll();
	};
	
	public void modify(User2DTO dto) {
		 dao.update(dto);
	};
	
	public void remove(String userid) {
		dao.delete(userid);
	};
	
}
