package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;

	@Transactional
	public void 회원가입(JoinDto joinDto) {
		User user = joinDto.toEntity();
		userDao.insert(user);
	}

	public boolean 유저네임중복확인(String username) {
		CheckDto usersPS = userDao.findByUsername(username);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { //  중복됨
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


}
