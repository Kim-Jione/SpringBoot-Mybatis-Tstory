package site.metacoding.firstapp.utill;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import site.metacoding.firstapp.config.authfilter.JwtProperties;
import site.metacoding.firstapp.web.dto.auth.SessionUserDto;

public class JWTToken {

    public static class CreateJWTToken {
        // (헤더 + 페이로드)와 서버가 갖고 있는 유일한 key 값을 합친 것을 헤더에서 정의한 알고리즘으로 암호화를 한다.
        public static String createToken(SessionUserDto sessionUserDto) {

            HashMap<String, Object> map = new HashMap<>(); // 해쉬맵 장점 get()을 통해서 key-value로 저장되어 있는 것을 꺼내올 수 있다,
            map.put("userId", sessionUserDto.getUserId());
            map.put("username", sessionUserDto.getUsername());

            // map type 저장시 primitive type(또는 해당 Wrapping class)만 지원한다.
            // 커스텀 오브젝트는 저장을 지원하지 않는다. - 에러발생
            String jwtToken = JWT.create()
                    .withExpiresAt(
                            JwtProperties.EXPIRATION_TIME) // 토큰 만료시간
                    .withClaim("sessionUserDto", map) // 로그인 데이터 작성
                    .sign(Algorithm.HMAC512(JwtProperties.SECRET)); // 어떤 알고리즘 쓸지, 서버만 들고 있는 키 조합

            return jwtToken; // 토큰 만들어서 return 해줌
        }
    }

    /*
     * 웹서버에서 웹 브라우저에 쿠키를 전송할 때 http응답메시지 형태로 보낸다.
     * 
     * 쿠키는 html과 함께 전송된다고 했다.
     * 
     * 따라서 Html <body>에서 쿠키를 전송하기보다 <head>에서 사용하자.
     */

    // 쿠키에 토큰 추가
    public static class CookieForToken {

        public static Cookie setCookie(String token) {
            Cookie cookie = new Cookie("Authorization", token); // Cookie에 Bearer 추가하면 안됨 - 최대 공간 초과
            cookie.setMaxAge(6 * 100 * 60); // 토큰값도 1시간이니 같게 해줌
            return cookie;
        }

        public static String cookieToToken(Cookie[] cookies) {
            String token = null;

            if (cookies == null) {
                return null;
            }

            // 쿠키내의 토큰 찾기
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("Authorization"))
                    token = cookie.getValue();
            }
            return token;
        }

    }

    public static class TokenToSinedDto {
        Integer userId = null;
        String username = null;

        // 토큰 -> 로그인Dto 변경 로직
        public SessionUserDto tokenToSignedDto(Map<String, Object> getSigned) {
            for (String key : getSigned.keySet()) {

                if (key.equals("userId")) {
                    userId = ((Integer) getSigned.get(key));
                }

                if (key.equals("username")) {
                    username = (getSigned.get(key).toString());
                }
            }

            return new SessionUserDto(userId, username);
        }

    }

}
