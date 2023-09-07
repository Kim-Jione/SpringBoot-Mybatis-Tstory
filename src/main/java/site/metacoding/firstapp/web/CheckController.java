package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.request.user.CheckDto;

@RequiredArgsConstructor
@Controller
public class CheckController {
    private final HttpSession session;
    private final UserService userService;

    // 아이디 중복체크
    @PostMapping("/check/loginId")
    public @ResponseBody CMRespDto<Boolean> checkUsername(@RequestBody CheckDto checkDto) {
        boolean isSame = userService.checkDuplicateEmail(checkDto.getLoginId());
        return new CMRespDto<>(1, "성공", isSame);
    }

    // 이메일 중복체크
    @PostMapping("/check/email")
    public @ResponseBody CMRespDto<Boolean> checkEmail(@RequestBody CheckDto checkDto) {
        boolean isSame = userService.checkDuplicateEmail(checkDto.getEmail());
        return new CMRespDto<>(1, "성공", isSame);
    }

    // 닉네임 중복체크
    @PostMapping("/check/nickname")
    public @ResponseBody CMRespDto<Boolean> checkNickname(@RequestBody CheckDto checkDto) {
        boolean isSame = userService.checkDuplicateNickname(checkDto.getNickname());
        return new CMRespDto<>(1, "성공", isSame);
    }

}