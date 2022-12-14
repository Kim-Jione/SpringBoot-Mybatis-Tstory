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
import site.metacoding.firstapp.utill.SHA256;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.request.MailReqDto;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;
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
    private final SHA256 sha256;
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
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            return "redirect:/";
        }
        return "/user/loginForm";
    }

    // 로그인 응답
    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
        User userIdPS = userDao.findByUsername(loginDto.getUsername());
        if (userIdPS == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);
        }

        String encPassword = sha256.encrypt(loginDto.getPassword());
        User usersPS = userDao.findByUsernameAndenPassword(encPassword, loginDto.getUsername());
        if (usersPS == null) {
            return new CMRespDto<>(-1, "아이디 혹은 비밀번호를 잘못 입력하셨습니다.", null);

        }
        userService.로그인(loginDto);
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
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            model.addAttribute("user", userDao.findById(principal.getUserId()));
            model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        }
        return "/user/passwordResetForm";
    }

    // 비밀번호 확인 페이지
    @GetMapping("/s/api/user/passwordCheckForm")
    public String passwordCheckForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/passwordCheckForm";
    }

    // 비밀번호 확인 응답
    @PostMapping("/s/api/user/checkPassword")
    public @ResponseBody CMRespDto<?> passwordCheck(@RequestBody PasswordCheckDto passwordCheckDto) {
        User principal = (User) session.getAttribute("principal");
        String encPassword = sha256.encrypt(passwordCheckDto.getPassword());
        User userPS = userDao.findByUserIdAndenPassword(encPassword, principal.getUserId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "실패", null);
        }
        return new CMRespDto<>(1, "성공", null);
    }

    // 비밀번호 수정 페이지
    @GetMapping("/s/api/user/passwordUpdateForm")
    public String passwordUpdateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        return "/user/passwordUpdateForm";
    }

    // 이메일 변경 페이지
    @GetMapping("/s/api/user/emailCheckForm")
    public String emailCheckForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/emailCheckForm";
    }

    // 계정 수정 페이지
    @GetMapping("/s/api/user/updateForm")
    public String updateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        return "/user/updateForm";
    }

    // 계정 수정 응답
    @PostMapping("/s/api/user/update")
    public String update(UserUpdateDto userUpdateDto) {
        userService.게시글수정하기(userUpdateDto);
        return "redirect:/";
    }

    // 프로필 수정 페이지
    @GetMapping("/s/api/user/profileUpdateForm")
    public String profileUpdateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
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
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userImg", userDao.findById(principal.getUserId()));
        model.addAttribute("user", userDao.findById(principal.getUserId()));
        return "/user/leaveCheckForm";
    }

    // 회원 탈퇴 응답
    @DeleteMapping("/s/api/user/leave")
    public @ResponseBody CMRespDto<?> leave(@RequestBody LeaveDto leaveDto) {
        User principal = (User) session.getAttribute("principal");
        String encPassword = sha256.encrypt(leaveDto.getPassword());
        User userPS = userDao.findByPasswordAndUserId(encPassword, principal.getUserId());
        if (userPS != null) {
            session.invalidate();
            userDao.leave(principal.getUserId());
            return new CMRespDto<>(1, "성공", null);
        }
        return new CMRespDto<>(-1, "실패", null);
    }

    // 비밀번호 수정 응답
    @PostMapping("/s/api/user/updatePassword")
    public @ResponseBody CMRespDto<?> updatePassword(@RequestBody UpdatePasswordDto updatePasswordDto) {
        User principal = (User) session.getAttribute("principal");
        String encPassword = sha256.encrypt(updatePasswordDto.getPassword());
        User userPS = userDao.findByPasswordAndUserId(encPassword, principal.getUserId());
        if (userPS == null) {
            return new CMRespDto<>(-1, "실패", null);
        }
        userService.비밀번호수정하기(updatePasswordDto.getPasswordUpdate(), principal.getUserId());
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
        userService.프로필이미지변경하기(updateProfileDto.getProfileImg());

        return new CMRespDto<>(1, "업로드 성공", imgName);
    }

    // 닉네임 수정 응답
    @PostMapping("/s/api/user/updateNickname")
    public @ResponseBody CMRespDto<?> updateNickname(@RequestBody UpdateNicknameDto updateNicknameDto) {
        User principal = (User) session.getAttribute("principal");
        userService.닉네임수정하기(updateNicknameDto.getNicknameUpdate(), principal.getUserId());
        return new CMRespDto<>(1, "성공", null);
    }

    // 아이디/임시비밀번호 보내기
    @PostMapping("/user/sendPassword")
    public @ResponseBody CMRespDto<?> sendPassword(@RequestBody MailReqDto mailReqDto) {
        Integer userPS = userDao.findByUserEmail(mailReqDto.getEmail()); // DB에 unique 걸기
        if (userPS == null) {
            return new CMRespDto<>(-1, "해당 이메일이 존재하지 않습니다.", null);
        }
        MailRespDto mailDto = userService.임시비밀번호만들기(mailReqDto.getEmail());
        // System.out.println("디버그 getAddress : " + mailDto.getAddress());
        userService.이메일보내기(mailDto);
        return new CMRespDto<>(1, "아이디/임시 비밀번호 보내기 성공", null);
    }

    // 이메일 수정 응답
    @PostMapping("/s/api/user/updateEmail")
    public @ResponseBody CMRespDto<?> updateEmail(@RequestBody UpdateEmailDto updateEmailDto) {
        User principal = (User) session.getAttribute("principal");
        userService.이메일수정하기(updateEmailDto.getEmailUpdate(), principal.getUserId());
        return new CMRespDto<>(1, "성공", null);
    }
}