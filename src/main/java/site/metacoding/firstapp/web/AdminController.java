package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminController {

    // 로그인 페이지
    @GetMapping("/admin/managementForm")
    public String managementForm() {

        return "/admin/managementForm";
    }
}