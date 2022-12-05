package site.metacoding.firstapp.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.UpdateProfileDto;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;
    private final HttpSession session;
	private final CategoryDao categoryDao;

	@Transactional
	public void 회원가입(JoinDto joinDto) {
		User user = joinDto.toEntity();
		userDao.insert(user);
	}

	public boolean 유저네임중복확인(String username) {
		CheckDto usersPS = userDao.findByUsername(username);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	public boolean 이메일중복확인(String email) {
		CheckDto usersPS = userDao.findByEmail(email);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	public boolean 닉네임중복확인(String nickname) {
		CheckDto usersPS = userDao.findByNickname(nickname);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	public boolean 카테고리명중복확인(String categoryTitle, Integer userId) {
		CheckDto categoryPS = categoryDao.findByCategoryTitle(categoryTitle, userId);
		if (categoryPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	public void 닉네임변경하기(UpdateProfileDto updateProfileDto) {
		User principal = (User) session.getAttribute("principal"); 
		userDao.updateByNickname(updateProfileDto.getNicknameUpdate(), principal.getUserId());
	}

	public void 프로필이미지변경하기(String profileImg) {
		User principal = (User) session.getAttribute("principal");
		userDao.updateByProfileImage(profileImg, principal.getUserId());
	}

	
}
