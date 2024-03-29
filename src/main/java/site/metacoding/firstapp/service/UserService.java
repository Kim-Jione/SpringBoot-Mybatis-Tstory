package site.metacoding.firstapp.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.SessionUserDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;
import site.metacoding.firstapp.web.dto.response.MailRespDto;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;
	private final HttpSession session;
	private final JavaMailSender mailSender;

	// 로그인 아이디와 비밀번호로 계정 찾기
	public SessionUserDto findByUser(String password, String loginId) {
		SessionUserDto userPS = userDao.findByUser(password, loginId);
		return userPS;
	}

	// 로그인
	@Transactional
	public void login(String password, String loginId, SessionUserDto userPS) {
		session.setAttribute("principal", userPS);
	}

	// 회원가입
	@Transactional
	public void join(JoinDto joinDto) {
		joinDto.setPassword(joinDto.getPassword()); // 회원가입으로 받은 비밀번호 암호화
		userDao.insert(joinDto.toEntity());
	}

	// 로그인 아이디 중복체크
	@Transactional
	public boolean checkDuplicateLoginId(String loginId) {
		SessionUserDto usersPS = userDao.findByLoginId(loginId);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	// 닉네임 중복체크
	@Transactional
	public boolean checkDuplicateNickname(String nickname) {
		User usersPS = userDao.findByEmail(nickname);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	// 이메일 중복체크
	@Transactional
	public boolean checkDuplicateEmail(String email) {
		User usersPS = userDao.findByEmail(email);

		if (usersPS == null) { // 중복 안됨
			return false;
		} else { // 중복됨
			return true;
		}
	}

	// 프로필 이미지 수정
	@Transactional
	public void updateByProfileImage(String profileImg) {
		User principal = (User) session.getAttribute("principal");
		userDao.updateByProfileImage(profileImg, principal.getUserId());
	}

	// 임시비밀번호만들기
	@Transactional
	public MailRespDto createRandomPassword(String email) {
		User userPS = userDao.findByEmail(email);
		// System.out.println("디버그 getLoginId : " + userPS.getLoginId());

		String str = createRandomPassword();
		MailRespDto dto = new MailRespDto();
		dto.setAddress(email); // 보낼 이메일 주소
		dto.setTitle("제이스토리 계정찾기 안내 이메일 입니다.");
		dto.setMessage("안녕하세요. 제이스토리 임시비밀번호 안내 관련 이메일 입니다." + "\n연결된 계정 ID : " + userPS.getLoginId() + "\n임시비밀번호 : "
				+ str + " 입니다." + "\n로그인 후에 비밀번호를 변경을 해주세요");
		updatePassword(str, email); // 임시비밀번호로 DB 업데이트
		return dto;
	}

	// 임시 비밀번호로 업데이트
	public void updatePassword(String str, String email) {
		User userPS = userDao.findByEmail(email); // 입력받은 이메일 있는지 select
		userDao.passwordUpdate(str, userPS.getUserId()); // 유저 찾아서 비밀번호 업데이트
	}

	// 랜덤함수로 임시비밀번호 구문 만들기
	public String createRandomPassword() {
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
	@Transactional
	public void sendEmail(MailRespDto mailDto) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailDto.getAddress());
		message.setSubject(mailDto.getTitle());
		message.setText(mailDto.getMessage());
		message.setFrom("보내는사람 이메일"); // 적어야함
		// System.out.println("디버그 message : " + message);
		mailSender.send(message);
	}

	// 인증코드 보내기
	@Transactional
	public void sendAccessCode(String email) {
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

	// 계정 정보 수정
	@Transactional
	public void updateUser(UserUpdateDto userUpdateDto) {
		userDao.updateByUser(userUpdateDto);
	}

	// 이메일 수정
	@Transactional
	public void updateEmail(String emailUpdate, Integer userId) {
		userDao.updateByEmail(emailUpdate, userId);
	}

	// 닉네임 수정
	@Transactional
	public void updateNickname(String nicknameUpdate, Integer userId) {
		userDao.updateByNickname(nicknameUpdate, userId);
	}

	// 비밀번호 수정
	@Transactional
	public void updatePassword(String passwordUpdate, Integer userId) {
		userDao.updateByPassword(passwordUpdate, userId);
	}

	// 로그인 아이디와 비밀번호로 계정 찾기
	@Transactional
	public SessionUserDto findByUserIdAndPassword(String password, Integer userId) {
		SessionUserDto userPS = userDao.findByUserIdAndPassword(password, userId);
		return userPS;
	}
	
	// 로그인 아이디로 계정 찾기
	@Transactional
	public SessionUserDto findByLoginId(String loginId) {
		SessionUserDto userPS = userDao.findByLoginId(loginId);
		return userPS;
	}
	@Transactional
    public User findByUsernameAndenPassword(String password, String loginId) {
		User userPS = userDao.findByUsernameAndenPassword(password,loginId);
		return userPS;
    }
	@Transactional
	public User findByPasswordAndUserId(String password, Integer userId) {
		return null;
	}
	@Transactional
	public void leave(Integer userId) {
		userDao.leave(userId);
    }

	public User findByEmail(String email) {
		User userPS = userDao.findByEmail(email);
		return userPS;
	}


}
