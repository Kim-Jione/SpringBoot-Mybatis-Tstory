package site.metacoding.firstapp.config.authfilter;

import java.util.Date;

public interface JwtProperties {
	String SECRET = "kim"; // 우리 서버만 알고 있는 비밀값
	Date EXPIRATION_TIME =new Date(System.currentTimeMillis()+(1000 * 60 * 60)); // 1시간 (1/1000초)
	String TOKEN_PREFIX = "Bearer ";
	String HEADER_STRING = "Authorization";
}