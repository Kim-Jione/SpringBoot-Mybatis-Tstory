package site.metacoding.firstapp.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fasterxml.jackson.databind.ObjectMapper;

import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.web.dto.CMRespDto;

public class LoginIntercepter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String uri = request.getRequestURI();

        HttpSession session = request.getSession();
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            if (uri.contains("api")) {
                
                response.setContentType("application/json; charset=utf-8");
                PrintWriter out = response.getWriter();
                CMRespDto<?> cmRespDto = new CMRespDto<>(-1, "로그인을 진행해주세요", null);
                ObjectMapper om = new ObjectMapper();
                String json = om.writeValueAsString(cmRespDto);
                out.println(json);
            } else {
                System.out.println("디버그: API 가 주소에 없음");
                response.sendRedirect("/user/loginForm");
            }
            return false;
        }
        return true;
    }
}
