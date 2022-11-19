package site.metacoding.firstapp.domain.user;

import java.util.List;

import site.metacoding.firstapp.web.dto.request.LoginDto;

public interface UserDao {

	public User findById(Integer userId);

	public List<User> findAll();

	public void insert(User user);

	public void update(User user);

	public void delete(User user);

	public User findByUsername(String username);

	public User login(LoginDto loginDto);

	public User findByUsernameAndEmail(String username, String email);
}
