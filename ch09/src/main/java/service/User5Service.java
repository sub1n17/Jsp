package service;

import java.util.List;

import dao.User5DAO;
import dto.User5DTO;

public class User5Service {

	private static User5Service instance = new User5Service();
	public static User5Service getInstance() {
		return instance;
	}
	private User5Service() {}
	
	private User5DAO dao = User5DAO.getInstance();
	
	public void register(User5DTO dto) {
		dao.insert(dto);
	};
	public User5DTO findbyId(int seq) {
		return dao.select(seq);
	};
	public List<User5DTO> findAll() {
		return dao.selectAll();
	};
	public void modify(User5DTO dto) {
		dao.update(dto);
	};
	public void remove(int seq) {
		dao.delete(seq);
	};
}
