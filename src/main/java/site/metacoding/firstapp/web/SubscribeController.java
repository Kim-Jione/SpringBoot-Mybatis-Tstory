package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.post.Post;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.service.SubscribeService;
import site.metacoding.firstapp.web.dto.CMRespDto;

@RequiredArgsConstructor
@Controller
public class SubscribeController {
	private final PostDao postDao;
	private final SubscribeService subscribeService;
	private final HttpSession session;

	// 구독목록 페이지
	@GetMapping("/subscribe/listForm")
	public String ListForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<Post> postList = postDao.findByUserId(principal.getUserId());
		model.addAttribute("postList", postList);
		return "subscribe/listForm";
	}

	// 구독 응답
	@PostMapping("/s/api/subscribe/{usersId}")
	public @ResponseBody CMRespDto<Integer> companySubscribe(@PathVariable Integer usersId, Model model) {
		System.out.println("디버그: 컨트롤러 도착");
		User principal = (User) session.getAttribute("principal");
		System.out.println("디버그: userId: " + principal.getUserId());
		System.out.println("디버그: usersId: " + usersId);
		Integer subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), usersId);
		System.out.println("디버그: subscribeId: " + subscribeId);

		if (subscribeId == null) {
			subscribeService.구독하기(principal.getUserId(), usersId);
			System.out.println("디버그: 구독성공");
			subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), usersId);
			System.out.println("디버그: subscribeId: " + subscribeId);
			return new CMRespDto<Integer>(1, "구독 완료", subscribeId);
		}
		System.out.println("디버그: 구독취소성공");
		System.out.println("디버그: usersId: " + usersId);

		subscribeService.구독취소(subscribeId);
		return new CMRespDto<Integer>(1, "구독 취소 완료", null);
	}

}
