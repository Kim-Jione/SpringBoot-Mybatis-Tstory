package site.metacoding.firstapp.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.category.CategoryDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.UpdateProfileDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;
import site.metacoding.firstapp.web.dto.response.MailRespDto;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;
	private final HttpSession session;
	private final JavaMailSender mailSender;
	private final CategoryDao categoryDao;

	@Transactional
	public void 회원가입(JoinDto joinDto) {
		User user = joinDto.toEntity();
		userDao.insert(user);
	}

	public boolean 유저네임중복확인(String username) {
		User usersPS = userDao.findByUsername(username);

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

	public MailRespDto 임시비밀번호만들기(String email) {
		User userPS = userDao.findByUsername(email);
		// System.out.println("디버그 getUsername : " + userPS.getUsername());

		String str = 랜덤비밀번호생성();
		MailRespDto dto = new MailRespDto();
		dto.setAddress(email); // 보낼 이메일 주소
		dto.setTitle("제이스토리 계정찾기 안내 이메일 입니다.");
		dto.setMessage("안녕하세요. 제이스토리 임시비밀번호 안내 관련 이메일 입니다." + "\n연결된 계정 ID : " + userPS.getUsername() + "\n임시비밀번호 : "
				+ str + " 입니다." + "\n로그인 후에 비밀번호를 변경을 해주세요");
		비밀번호수정(str, email); // 임시비밀번호로 DB 업데이트
		return dto;
	}

	// 임시 비밀번호로 업데이트
	public void 비밀번호수정(String str, String email) {
		String passwordUpdate = str; // 임시비밀번호 가져오기
		Integer userId = userDao.findByUserEmail(email); // 입력받은 이메일 있는지 select
		userDao.passwordUpdate(passwordUpdate, userId); // 유저 찾아서 비밀번호 업데이트
	}

	// 랜덤함수로 임시비밀번호 구문 만들기
	public String 랜덤비밀번호생성() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	// 메일보내기
	public void 이메일보내기(MailRespDto mailDto) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailDto.getAddress());
		message.setSubject(mailDto.getTitle());
		message.setText(mailDto.getMessage());
		message.setFrom("받는사람 이메일"); // 적어야함
		// System.out.println("디버그 message : " + message);
		mailSender.send(message);
	}

	public void 인증코드보내기(String email) {
		Random random = new Random(); // 난수 생성을 위한 랜덤 클래스
		String key = ""; // 인증번호

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		mailSender.send(message);

	}

	public void 게시글수정하기(UserUpdateDto userUpdateDto) {
        userDao.updateById(userUpdateDto);
	}

}
