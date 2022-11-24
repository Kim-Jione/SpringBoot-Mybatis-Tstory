package site.metacoding.firstapp.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;

public interface UserDao {

	public User findById(Integer userId);

	public List<User> findAll();

	public void insert(User user);

	public void delete(User user);

	public User findByUsername(String username);

	public User login(LoginDto loginDto);

	public void updateById(UserUpdateDto userUpdateDto);

	public User findByPassword(@Param("password") String password, @Param("userId") Integer userId);

}
