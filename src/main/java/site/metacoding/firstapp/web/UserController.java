package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {

    @GetMapping("/write/category")
    public String writeForm() {
        return "/category/writeForm";
    }

    @GetMapping("/post/detail/{postId}")
    public String detail(@PathVariable Integer postId) {
        return "/post/detailForm";
    }

    @GetMapping("/post/list/{userId}")
    public String list(@PathVariable Integer userId) {
        return "/post/listForm";
    }

    @GetMapping("/write/post/{userId}")
    public String writeForm(@PathVariable Integer userId) {
        return "/post/writeForm";
    }

    @GetMapping("/join")
    public String joinForm() {
        return "/user/joinForm";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/user/loginForm";
    }

    @GetMapping("/passwordReset/{userId}")
    public String passwordResetForm(@PathVariable Integer userId) {
        return "/user/passwordResetForm";
    }

    @GetMapping("/update/{userId}")
    public String updateForm(@PathVariable Integer userId) {
        return "/user/updateForm";
    }

}
