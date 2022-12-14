package site.metacoding.firstapp.config.authfilter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

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
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.utill.JWTToken.TokenToSinedDto;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.response.user.SessionUserDto;

@RequiredArgsConstructor
public class JwtAuthorizationFilter implements Filter { // 토큰 검증 필터

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String header = req.getHeader(JwtProperties.HEADER_STRING);

        if (header == null || !header.startsWith(JwtProperties.TOKEN_PREFIX)) {
            customResponse("JWT토큰이 없어서 인가할 수 없습니다.", resp);
            return;
        }

        // 토큰 검증
        String jwtToken = req.getHeader(JwtProperties.HEADER_STRING)
                .replace(JwtProperties.TOKEN_PREFIX, "");

        try {
            DecodedJWT decodedJWT = JWT.require(Algorithm.HMAC512(JwtProperties.SECRET)).build().verify(jwtToken);

            Map<String, Object> getSigned = decodedJWT.getClaim("sessionUserDto").asMap(); // 페이로드의 값들을 담는다

            TokenToSinedDto tokenToSinedDto = new TokenToSinedDto();
            SessionUserDto sessionUserDto = tokenToSinedDto.tokenToSignedDto(getSigned); // 시그니처의 claim value 가져와서 로그인 Dto 변경

            HttpSession session = req.getSession();

            session.setAttribute("principal", sessionUserDto); // 세션에 값 저장, 이걸로 컨트롤러에서 비교

            // 디스패쳐 서블릿 입장 혹은 Filter체인 타기
            chain.doFilter(req, resp);
        } catch (Exception e) {
            customResponse("만료된 토큰 혹은 잘못된 토큰이 입력되었습니다.", resp);
        }

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