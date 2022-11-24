package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;

@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserDao userDao;

    // 회원가입 페이지
    @GetMapping("/user/joinForm")
    public String joinForm() {
        return "/user/joinForm";
    }

    // 회원가입 응답
    @PostMapping("/user/join")
    public String join(JoinDto joinDto) {
        User userPS = userDao.findByUsername(joinDto.getUsername());
        if (userPS == null) {
            userDao.insert(joinDto.toEntity());
            return "redirect:/user/loginForm";
        }
        return "redirect:/user/joinForm";
    }

    // 로그인 페이지
    @GetMapping("/user/loginForm")
    public String loginForm() {
        return "/user/loginForm";
    }

    // 로그인 응답
    @PostMapping("/user/login")
    public String login(LoginDto loginDto) {
        User userPS = userDao.login(loginDto);
        if (userPS != null) {
            session.setAttribute("principal", userPS);
            return "redirect:/";
        } else {
            return "redirect:/user/loginForm";
        }
    }

    // 로그아웃
    @GetMapping("/user/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    // 패스워드 초기화 페이지
    @GetMapping("/user/passwordResetForm")
    public String passwordResetForm() {
        return "/user/passwordResetForm";
    }

    // 패스워드 확인 페이지
    @GetMapping("/user/passwordCheckForm")
    public String passwordCheckForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/loginForm";
        }
        return "/user/passwordCheckForm";
    }
    
    // 패스워드 확인 응답
    @PostMapping("/user/passwordCheck")
    public String passwordCheck(String password) {
        User principal = (User) session.getAttribute("principal");
        User userPS = userDao.findByPassword(password, principal.getUserId());
        if (userPS == null) {
            return "redirect:/user/passwordCheckForm";
        }
        return "redirect:/user/updateForm";
    }

    // 패스워드 수정 페이지
    @GetMapping("/user/passwordUpdateForm")
    public String passwordUpdateForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/loginForm";
        }
        return "/user/passwordUpdateForm";
    }


    // 이메일 응답 페이지
    @GetMapping("/user/emailCheckForm")
    public String emailCheckForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/loginForm";
        }
        return "/user/emailCheckForm";
    }

    // 회원 탈퇴 페이지
    @GetMapping("/user/leaveCheckForm")
    public String leaveCheckForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/loginForm";
        }
        return "/user/leaveCheckForm";
    }

    // 계정 수정 페이지
    @GetMapping("/user/updateForm")
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
    public String update(UserUpdateDto userUpdateDto) {
        userDao.updateById(userUpdateDto);
        return "redirect:/";
    }

}
