package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.subscribe.SubscribeDao;
import site.metacoding.firstapp.domain.user.User;
import site.metacoding.firstapp.domain.user.UserDao;
import site.metacoding.firstapp.service.SubscribeService;
import site.metacoding.firstapp.web.dto.CMRespDto;
import site.metacoding.firstapp.web.dto.response.subscribe.PostListDto;
import site.metacoding.firstapp.web.dto.response.subscribe.UserListDto;

@RequiredArgsConstructor
@Controller
public class SubscribeController {
	private final UserDao userDao;
	private final SubscribeDao subscribeDao;
	private final SubscribeService subscribeService;
	private final HttpSession session;

	// 구독목록 페이지
	@GetMapping("/s/api/subscribe/listForm")
	public String ListForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		List<PostListDto> postList = subscribeDao.findAllSubscribePost(principal.getUserId());
		model.addAttribute("postList", postList);

		List<UserListDto> subscribeList = subscribeDao.findByUserList(principal.getUserId());
		model.addAttribute("user", userDao.findById(principal.getUserId()));
		model.addAttribute("subscribeList", subscribeList);
		return "subscribe/listForm";
	}

	// 구독 응답
	@PostMapping("/s/api/subscribe/{usersId}")
	public @ResponseBody CMRespDto<Integer> companySubscribe(@PathVariable Integer usersId, Model model) {
		User principal = (User) session.getAttribute("principal");

		Integer subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), usersId);

		if (subscribeId == null) {
			subscribeService.구독하기(principal.getUserId(), usersId);
			subscribeId = subscribeService.구독Id불러오기(principal.getUserId(), usersId);
			return new CMRespDto<Integer>(1, "구독 완료", subscribeId);
		}

		subscribeService.구독취소(subscribeId);
		return new CMRespDto<Integer>(1, "구독 취소 완료", null);
	}

}
