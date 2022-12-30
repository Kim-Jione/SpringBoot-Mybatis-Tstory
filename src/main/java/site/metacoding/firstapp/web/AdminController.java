package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.user.UserDao;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final UserDao userDao;

    // 로그인 페이지
    @GetMapping("/admin/managementForm")
    public String managementForm() {
        return "/admin/managementForm";
    }

    // 사용자 관리 페이지
    @GetMapping("/admin/userManageForm")
    public String userManageForm(Model model) {
        model.addAttribute("userList", userDao.findAllMember());
        return "/admin/userManageForm";
    }

    // 관리자 관리 페이지
    @GetMapping("/admin/adminManageForm")
    public String adminManageForm(Model model) {
        model.addAttribute("userList", userDao.findAllAdmin());
        return "/admin/userManageForm";
    }


}