package site.metacoding.firstapp.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;

public interface UserDao {

	public User findById(Integer userId);

	public List<User> findAll();

	public void insert(User user);

	public void delete(User user);

	public User login(LoginDto loginDto);

	public void updateById(UserUpdateDto userUpdateDto);

	public User findByPasswordAndUserId(@Param("password") String password, @Param("userId") Integer userId);

	public User findByUsername(String username);

	public CheckDto findByEmail(String email);

	public CheckDto findByNickname(String nickname);

	public void leave(Integer userId);

	public void updateByPassword(@Param("passwordUpdate") String passwordUpdate, @Param("userId") Integer userId);

	public void updateByNickname(@Param("nicknameUpdate") String nicknameUpdate, @Param("userId") Integer userId);

	public void updateByProfileImage(@Param("profileImg") String profileImg, @Param("userId") Integer userId);

	public Integer findByUserEmail(String email);

	public void passwordUpdate(@Param("passwordUpdate") String passwordUpdate, @Param("userId") Integer userId);

	public User findByUsernameAndenPassword(@Param("encPassword") String encPassword,
			@Param("username") String username);

}
