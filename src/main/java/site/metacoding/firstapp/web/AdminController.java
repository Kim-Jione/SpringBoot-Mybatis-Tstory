package site.metacoding.firstapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.LoveDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.subscribe.SubscribeDao;
import site.metacoding.firstapp.domain.user.UserDao;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final UserDao userDao;
    private final PostDao postDao;
    private final LoveDao loveDao;
    private final SubscribeDao subscribeDao;

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

    // 게시글 관리 페이지
    @GetMapping("/admin/postManageForm")
    public String postManageForm(Model model) {
        model.addAttribute("postList", postDao.findAllHistory());
        return "/admin/postManageForm";
    }

    // 좋아요수 순위 페이지
    @GetMapping("/admin/loveRankForm")
    public String loveRankForm(Model model) {
        model.addAttribute("loveRankList", loveDao.findAllLoveRank());
        return "/admin/loveRankForm";
    }

    // 구독자수 순위 페이지
    @GetMapping("/admin/subscribeRankForm")
    public String subscribeRankForm(Model model) {
        model.addAttribute("subscribeRankList", subscribeDao.findAllSubscribeRank());
        return "/admin/subscribeRankForm";
    }

}