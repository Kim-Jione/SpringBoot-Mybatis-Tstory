package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
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
		User usersPS = userDao.findByUsername(username);

		if (usersPS == null) { // 아이디가 중복 안됨
			return false;
		} else { // 아이디가 중복됨
			return true;
		}
	}

}
