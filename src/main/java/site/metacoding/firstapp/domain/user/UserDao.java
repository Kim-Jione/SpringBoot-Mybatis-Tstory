package site.metacoding.firstapp.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.SessionUserDto;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;


public interface  UserDao {
                          
	public User findById(Integer userId);
	
    public SessionUserDto findByLoginId(String loginId);

	public List<User> findAll();

	public void insert(User user);

	public void update(User user);
	
	public void delete(Integer userId);

	public SessionUserDto findByUser(@Param("password")String password, @Param("loginId")String loginId);

	public User findByEmail(String email);

    public CheckDto findByNickname(String nickname);

    public void updateByProfileImage(@Param("profileImg")String profileImg, @Param("userId")Integer userId);

    public void passwordUpdate(String password, Integer userId);

	public void updateByUser(UserUpdateDto userUpdateDto);


    public void updateByEmail(String emailUpdate, Integer userId);

	public void updateByNickname(String nicknameUpdate, Integer userId);

    public void updateByPassword(String password, Integer userId);

	public SessionUserDto findByUserIdAndPassword(String password, Integer userId);

    public User findByUsernameAndenPassword(String password, String loginId);

	public void leave(Integer userId);

	
}
