package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.LeaveDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.PasswordCheckDto;
import site.metacoding.firstapp.web.dto.request.user.UpdatePasswordDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;

@RequiredArgsConstructor
@Controller
public class UserController {
    private final HttpSession session;
    private final UserDao userDao;
    private final UserService userService;

    // 회원가입 페이지
    @GetMapping("/user/joinForm")
    public String joinForm() {
        return "/user/joinForm";
    }

    // 회원가입 응답
    @PostMapping("/user/join")
    public @ResponseBody CMRespDto<?> join(@RequestBody JoinDto joinDto) {
        userService.회원가입(joinDto);
        return new CMRespDto<>(1, "회원가입성공", null);
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
    public @ResponseBody CMRespDto<?> passwordCheck(@RequestBody PasswordCheckDto passwordCheckDto) {
        System.out.println("디버그: password: " + passwordCheckDto.getPassword());
        System.out.println("디버그: userId: " + passwordCheckDto.getUserId());
        User principal = (User) session.getAttribute("principal");
        User userPS = userDao.findByPasswordAndUserId(passwordCheckDto.getPassword(), principal.getUserId());
        if (userPS == null) {

            return new CMRespDto<>(-1, "실패", null);
        }
        return new CMRespDto<>(1, "성공", null);
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
            return "redirect:/user/loginForm";
        }
        return "/user/emailCheckForm";
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

    // 프로필 수정 페이지
    @GetMapping("/user/profileUpdateForm")
    public String profileUpdateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/loginForm";
        }
        User userPS = userDao.findById(principal.getUserId());
        model.addAttribute("user", userPS);
        return "/user/profileUpdateForm";
    }

    // 회원 탈퇴 페이지
    @GetMapping("/user/leaveCheckForm")
    public String leaveCheckForm() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/loginForm";
        }
        return "/user/leaveCheckForm";
    }

    // 회원 탈퇴 응답
    @DeleteMapping("/user/leave")
    public @ResponseBody CMRespDto<?> leave(@RequestBody LeaveDto leaveDto) {
        User principal = (User) session.getAttribute("principal");
        System.out.println("디버그: password: " + leaveDto.getPassword());
        System.out.println("디버그: userId: " + leaveDto.getUserId());
        User userPS = userDao.findByPasswordAndUserId(leaveDto.getPassword(), principal.getUserId());
        if (userPS != null) {
            session.invalidate();
            userDao.leave(principal.getUserId());
            return new CMRespDto<>(1, "성공", null);
        }
        return new CMRespDto<>(-1, "실패", null);
    }

    // 패스워드 수정 응답
    @PostMapping("/user/updatePassword")
    public @ResponseBody CMRespDto<?> updatePassword(@RequestBody UpdatePasswordDto updatePasswordDto) {
        User principal = (User) session.getAttribute("principal");
        User userPS = userDao.findByPasswordAndUserId(updatePasswordDto.getPassword(), principal.getUserId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "실패", null);
        }
        userDao.updateByPassword(updatePasswordDto.getPasswordUpdate());
        return new CMRespDto<>(1, "성공", null);
    }

}