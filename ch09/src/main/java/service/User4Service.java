package service;

import java.util.List;

import dao.User4DAO;
import dto.User4DTO;

public class User4Service {

	private static User4Service instance = new User4Service();
	public static User4Service getInstance() {
		return instance;
	}
	private User4Service() {}
	
	private User4DAO dao = User4DAO.getInstance();
	
	public void register(User4DTO dto) {
		dao.insert(dto);
	};
	public User4DTO findbyId(String userid) {
		return dao.select(userid);
	};
	public List<User4DTO> findAll() {
		return dao.selectAll();
	};
	public void modify(User4DTO dto) {
		dao.update(dto);
	};
	public void remove(String userid) {
		dao.delete(userid);
	};
}
