package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.JoinDto;
import site.metacoding.firstapp.web.dto.request.LoginDto;

@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserDao userDao;

    @GetMapping("/joinForm")
    public String joinForm() {
        return "/user/joinForm";
    }

    @PostMapping("/join")
    public String join(JoinDto joinDto) {
        User userPS = userDao.findByUsername(joinDto.getUsername());
        if (userPS == null) {
            userDao.insert(joinDto.toEntity());
            return "redirect:/loginForm";
        }
        return "redirect:/joinForm";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "/user/loginForm";
    }

    @PostMapping("/login")
    public String login(LoginDto loginDto) {
        User userPS = userDao.login(loginDto);
        if (userPS != null) {
            session.setAttribute("principal", userPS);
            return "redirect:/";
        } else {
            return "redirect:/loginForm";
        }
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/passwordResetForm")
    public String passwordResetForm() {
        return "/user/passwordResetForm";
    }

    @GetMapping("/updateForm/{userId}")
    public String updateForm(@PathVariable Integer userId) {
        return "/user/updateForm";
    }

}
