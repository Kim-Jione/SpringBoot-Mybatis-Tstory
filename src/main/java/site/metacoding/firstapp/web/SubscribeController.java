package site.metacoding.firstapp.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.post.Post;
import site.metacoding.firstapp.domain.post.PostDao;

@RequiredArgsConstructor
@Controller
public class SubscribeController {
	private final PostDao postDao;

	// 구독목록 페이지
	@GetMapping("/subscribe/listForm/{userId}")
	public String ListForm(Model model, @PathVariable Integer userId) {
		List<Post> postList = postDao.findByUserId(userId);
		model.addAttribute("postList", postList); // 블로그 전체게시글
		return "subscribe/listForm";
	}
}
