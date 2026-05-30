package service;

import java.util.List;

import dao.User3DAO;
import dto.User3DTO;

public class User3Service {

	private static User3Service instance = new User3Service();
	public static User3Service getInstance() {
		return instance;
	}
	private User3Service() {}
	
	private User3DAO dao = User3DAO.getInstance();
	
	public void register(User3DTO dto) {
		dao.insert(dto);
	};
	public User3DTO findbyId(String userid) {
		return dao.select(userid);
	};
	public List<User3DTO> findAll() {
		return dao.selectAll();
	};
	public void modify(User3DTO dto) {
		dao.update(dto);
	};
	public void remove(String userid) {
		dao.delete(userid);
	};
}
