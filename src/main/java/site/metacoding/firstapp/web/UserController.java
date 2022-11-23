package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;

@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserDao userDao;
    private final UserService userService;

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

    @GetMapping("/passwordCheckForm")
    public String passwordCheckForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/loginForm";
        }
        return "/user/passwordCheckForm";
    }

    @PostMapping("/passwordCheck")
    public String passwordCheck(String password) {
        User principal = (User) session.getAttribute("principal");
        User userPS = userDao.findByPassword(password, principal.getUserId());
        if (userPS == null) {
            return "redirect:/";
        }
        return "redirect:/updateForm";
    }

    @GetMapping("/leaveForm")
    public String leaveForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/loginForm";
        }
        return "/user/leaveForm";
    }

    // 계정 수정 페이지
    @GetMapping("/updateForm")
    public String updateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/loginForm";
        }
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        return "/user/updateForm";
    }

    // 계정 수정 응답
    @PostMapping("/user/update")
    public String write(UserUpdateDto userUpdateDto) {
        userDao.updateById(userUpdateDto);
        return "redirect:/";
    }

}
