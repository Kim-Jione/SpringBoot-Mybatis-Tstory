package site.metacoding.firstapp.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.SessionUserDto;
import site.metacoding.firstapp.web.dto.request.MailReqDto;
import site.metacoding.firstapp.web.dto.request.user.JoinDto;
import site.metacoding.firstapp.web.dto.request.user.LeaveDto;
import site.metacoding.firstapp.web.dto.request.user.LoginDto;
import site.metacoding.firstapp.web.dto.request.user.PasswordCheckDto;
import site.metacoding.firstapp.web.dto.request.user.UpdateEmailDto;
import site.metacoding.firstapp.web.dto.request.user.UpdateNicknameDto;
import site.metacoding.firstapp.web.dto.request.user.UpdatePasswordDto;
import site.metacoding.firstapp.web.dto.request.user.UpdateProfileDto;
import site.metacoding.firstapp.web.dto.request.user.UserUpdateDto;
import site.metacoding.firstapp.web.dto.response.MailRespDto;

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
        userService.join(joinDto);
        return new CMRespDto<>(1, "회원가입성공", null);
    }

    // 로그인 페이지
    @GetMapping("/user/loginForm")
    public String loginForm() {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        if (principal != null) {
            return "redirect:/";
        }
        return "/user/loginForm";
    }

    // 로그인 응답
    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        SessionUserDto userPS = userService.findByUser(loginDto.getPassword(), loginDto.getLoginId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }
        userService.login(loginDto.getPassword(), loginDto.getLoginId(), userPS);
        System.out.println("디버그: 성공!");
        return new CMRespDto<>(1, "로그인 되셨습니다.", null);

    }

    // 로그아웃
    @GetMapping("/user/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    // 비밀번호 초기화 페이지
    @GetMapping("/user/passwordResetForm")
    public String passwordResetForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        if (principal != null) {
            model.addAttribute("user", userDao.findById(principal.getUserId()));
            model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        }
        return "/user/passwordResetForm";
    }

    // 비밀번호 확인 페이지
    @GetMapping("/s/api/user/passwordCheckForm")
    public String passwordCheckForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/passwordCheckForm";
    }

    // 비밀번호 확인 응답
    @PostMapping("/s/api/user/checkPassword")
    public @ResponseBody CMRespDto<?> passwordCheck(@RequestBody PasswordCheckDto passwordCheckDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        SessionUserDto userPS = userService.findByUserIdAndPassword(passwordCheckDto.getPassword(), principal.getUserId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "비밀번호가 다릅니다.", null);
        }
        return new CMRespDto<>(1, "성공", null);
    }

    // 비밀번호 수정 페이지
    @GetMapping("/s/api/user/passwordUpdateForm")
    public String passwordUpdateForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        return "/user/passwordUpdateForm";
    }

    // 이메일 변경 페이지
    @GetMapping("/s/api/user/emailCheckForm")
    public String emailCheckForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/emailCheckForm";
    }

    // 계정 수정 페이지
    @GetMapping("/s/api/user/updateForm")
    public String updateForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/updateForm";
    }

    // 계정 수정 응답
    @PostMapping("/s/api/user/update")
    public String update(UserUpdateDto userUpdateDto) {
        userService.updateUser(userUpdateDto);
        return "redirect:/";
    }

    // 프로필 수정 페이지
    @GetMapping("/s/api/user/profileUpdateForm")
    public String profileUpdateForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/loginForm";
        }
        User userPS = userDao.findById(principal.getUserId());
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        model.addAttribute("user", userPS);
        return "/user/profileUpdateForm";
    }

    // 회원 탈퇴 페이지
    @GetMapping("/s/api/user/leaveCheckForm")
    public String leaveCheckForm(Model model) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        return "/user/leaveCheckForm";
    }

    // 회원 탈퇴 응답
    @DeleteMapping("/s/api/user/leave")
    public @ResponseBody CMRespDto<?> leave(@RequestBody LeaveDto leaveDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        User userPS = userService.findByPasswordAndUserId(leaveDto.getPassword(), principal.getUserId());
        if (userPS != null) {
            session.invalidate();
            userService.leave(principal.getUserId());
            return new CMRespDto<>(1, "성공", null);
        }
        return new CMRespDto<>(-1, "실패", null);
    }

    // 비밀번호 수정 응답
    @PostMapping("/s/api/user/updatePassword")
    public @ResponseBody CMRespDto<?> updatePassword(@RequestBody UpdatePasswordDto updatePasswordDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        User userPS = userService.findByPasswordAndUserId(updatePasswordDto.getPassword(), principal.getUserId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "실패", null);
        }
        userService.updatePassword(updatePasswordDto.getPasswordUpdate(), principal.getUserId());
        return new CMRespDto<>(1, "성공", null);
    }

    // 프로필 수정 응답
    @PostMapping("/s/api/user/profileUpdate")
    public @ResponseBody CMRespDto<?> updateProfile(@RequestPart("file") MultipartFile file,
            @RequestPart("updateProfileDto") UpdateProfileDto updateProfileDto) throws Exception {
        int pos = file.getOriginalFilename().lastIndexOf(".");
        String extension = file.getOriginalFilename().substring(pos + 1);
        String filePath = "C:\\temp\\img\\";
        String imgSaveName = UUID.randomUUID().toString();
        String imgName = imgSaveName + "." + extension;

        File makeFileFolder = new File(filePath);
        if (!makeFileFolder.exists()) {
            if (!makeFileFolder.mkdir()) {
                throw new Exception("File.mkdir():Fail.");
            }
        }

        File dest = new File(filePath, imgName);
        try {
            Files.copy(file.getInputStream(), dest.toPath());
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("사진저장");
        }
        updateProfileDto.setProfileImg(imgName);
        userService.updateByProfileImage(updateProfileDto.getProfileImg());

        return new CMRespDto<>(1, "업로드 성공", imgName);
    }

    // 닉네임 수정 응답
    @PostMapping("/s/api/user/updateNickname")
    public @ResponseBody CMRespDto<?> updateNickname(@RequestBody UpdateNicknameDto updateNicknameDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        userService.updateNickname(updateNicknameDto.getNicknameUpdate(), principal.getUserId());
        return new CMRespDto<>(1, "성공", null);
    }

    // 아이디/임시비밀번호 보내기
    @PostMapping("/user/sendPassword")
    public @ResponseBody CMRespDto<?> sendPassword(@RequestBody MailReqDto mailReqDto) {
        User userPS = userService.findByEmail(mailReqDto.getEmail()); // DB에 unique 걸기
        if (userPS == null) {
            return new CMRespDto<>(-1, "해당 이메일이 존재하지 않습니다.", null);
        }
        MailRespDto mailDto = userService.createRandomPassword(mailReqDto.getEmail());
        // System.out.println("디버그 getAddress : " + mailDto.getAddress());
        userService.sendEmail(mailDto);
        return new CMRespDto<>(1, "아이디/임시 비밀번호 보내기 성공", null);
    }

    // 이메일 수정 응답
    @PostMapping("/s/api/user/updateEmail")
    public @ResponseBody CMRespDto<?> updateEmail(@RequestBody UpdateEmailDto updateEmailDto) {
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
        userService.updateEmail(updateEmailDto.getEmailUpdate(), principal.getUserId());
        return new CMRespDto<>(1, "성공", null);
    }
}