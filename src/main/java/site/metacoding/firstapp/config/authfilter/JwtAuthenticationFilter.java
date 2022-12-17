package site.metacoding.firstapp.config.authfilter;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Optional;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.utill.JWTToken.CookieForToken;
import site.metacoding.firstapp.utill.SHA256;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.auth.FindByUsernameDto;
import site.metacoding.firstapp.web.dto.auth.SessionUserDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;

@RequiredArgsConstructor
public class JwtAuthenticationFilter implements Filter { // 토큰 생성 필터

	private final UserDao userDao;
	private final SHA256 sha256;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		System.out.println("디버그 : 토큰 생성필터 입장");

		// Post요청이 아닌것을 거부
		if (!req.getMethod().equals("POST")) {
			customResponse("로그인시에는 post요청을 해야 합니다.", resp);
		}

		// Body 값 받기
		ObjectMapper om = new ObjectMapper();
		LoginDto loginDto = om.readValue(req.getInputStream(),
				LoginDto.class);
		System.out.println("디버그 : body값 받기 : " + loginDto.getUsername());

		// 유저네임 체크
		Optional<FindByUsernameDto> usernamePS = userDao.findAllUsername(loginDto.getUsername());
		System.out.println("디버그 : username : " + usernamePS.get().getUsername());
		usernamePS.orElseThrow(() -> new RuntimeException("디버그 : 아이디를 잘못 입력했습니다."));

		// 패스워드 체크
		String encPassword = sha256.encrypt(loginDto.getPassword());
		if (!usernamePS.get().getPassword().equals(encPassword)) {
			customResponse("디버그 : 패스워드가 틀렸습니다.", resp);
		}

		// JWT토큰 유효시간 1초 = 1/1000
		Date expire = new Date(System.currentTimeMillis() + (1 * 60 * 60)); // 10시간

		String jwtToken = JWT.create()
				.withSubject("메타코딩") // 토큰 이름
				.withExpiresAt(expire) // 토큰 유효시간
				.withClaim("userId", usernamePS.get().getUserId()) // 토큰에 담길 정보
				.withClaim("username", usernamePS.get().getUsername())
				.sign(Algorithm.HMAC512(JwtProperties.SECRET)); // 토큰 암호화 알고리즘 서명은 SECRET, 서버만 알고 있어야 함

		System.out.println("디버그 jwtToken 생성완료 : " + jwtToken);

		// JWT토큰 성공 응답
		customJwtResponse("로그인 성공!!!", jwtToken, usernamePS.get(), resp);

	}

	private void customJwtResponse(String msg, String jwtToken,
			FindByUsernameDto findByUsernameDto,
			HttpServletResponse resp)
			throws IOException, JsonProcessingException {
		resp.setContentType("application/json; charset=utf-8");
		resp.addHeader(JwtProperties.HEADER_STRING, JwtProperties.TOKEN_PREFIX + jwtToken);
		PrintWriter out = resp.getWriter();
		resp.setStatus(200);
		CMRespDto<?> responseDto = new CMRespDto<>(1, msg, new SessionUserDto(findByUsernameDto));
		ObjectMapper om = new ObjectMapper();
		String body = om.writeValueAsString(responseDto);

		out.println(body);
		out.flush();
	}

	private void customResponse(String msg, HttpServletResponse resp) throws IOException, JsonProcessingException {
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		resp.setStatus(400);
		CMRespDto<?> responseDto = new CMRespDto<>(-1, msg, null);
		ObjectMapper om = new ObjectMapper();
		String body = om.writeValueAsString(responseDto);
		out.println(body);
		out.flush();
	}

}