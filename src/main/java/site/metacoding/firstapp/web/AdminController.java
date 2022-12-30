package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.LoveDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.subscribe.SubscribeDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final HttpSession session;
    private final UserDao userDao;
    private final PostDao postDao;
    private final LoveDao loveDao;
    private final SubscribeDao subscribeDao;

    // 사용자 관리 페이지
    @GetMapping("/admin/userManageForm")
    public String userManageForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("userList", userDao.findAllMember());
        return "/admin/userManageForm";
    }

    // 관리자 관리 페이지
    @GetMapping("/admin/adminManageForm")
    public String adminManageForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("userList", userDao.findAllAdmin());
        return "/admin/adminManageForm";
    }

    // 게시글 관리 페이지
    @GetMapping("/admin/postManageForm")
    public String postManageForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("postList", postDao.findAllHistory());
        return "/admin/postManageForm";
    }

    // 좋아요수 순위 페이지
    @GetMapping("/admin/loveRankForm")
    public String loveRankForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("loveRankList", loveDao.findAllLoveRank());
        return "/admin/loveRankForm";
    }

    // 구독자수 순위 페이지
    @GetMapping("/admin/subscribeRankForm")
    public String subscribeRankForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("subscribeRankList", subscribeDao.findAllSubscribeRank());
        return "/admin/subscribeRankForm";
    }

    // 게시글수 순위 페이지
    @GetMapping("/admin/postRankForm")
    public String postRankForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        model.addAttribute("userInfo", userDao.findById(principal.getUserId()));
        model.addAttribute("postRankList", postDao.findAllPostRank());
        return "/admin/postRankForm";
    }

}