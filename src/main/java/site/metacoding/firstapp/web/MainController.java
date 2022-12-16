package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.web.dto.auth.SessionUserDto;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final HttpSession session;
	private final PostDao postDao;
	private final UserDao userDao;

	// 메인 페이지
	@GetMapping({ "/main/mainForm", "/" })
	public String mainForm(Model model, String keyword) {
		SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");
		if (principal != null) {
			model.addAttribute("userImg", userDao.findById(principal.getUserId()));
			model.addAttribute("user", userDao.findById(principal.getUserId()));
		}

		if (keyword == null || keyword.isEmpty()) {
			model.addAttribute("postList", postDao.findAllAndUsername());
		} else {
			model.addAttribute("postList", postDao.findSearchAllPost(keyword));
		}
		return "mainForm";

	}

}
