package site.metacoding.firstapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.subscribe.Subscribe;
import site.metacoding.firstapp.domain.subscribe.SubscribeDao;
import site.metacoding.firstapp.web.dto.response.subscribe.PostListDto;
import site.metacoding.firstapp.web.dto.response.subscribe.UserListDto;

@RequiredArgsConstructor
@Service
public class SubscribeService {
	private final SubscribeDao subscribeDao;

	public void 구독하기(Integer fromUserId, Integer toUserId) {
		Subscribe subscribe = new Subscribe(fromUserId, toUserId);
		subscribeDao.insert(subscribe);
	}

	public void 구독취소(Integer subscribeId) {
		subscribeDao.delete(subscribeId);
	}

	public Integer 구독Id불러오기(Integer fromUserId, Integer toUserId) {
		return subscribeDao.findByUserIdAndToUserId(fromUserId, toUserId);
	}

    public List<PostListDto> findAllSubscribePost(Integer fromUserId) {
        return subscribeDao.findAllSubscribePost(fromUserId);
    }

	public List<UserListDto> findByUserList(Integer fromUserId) {
		 return subscribeDao.findByUserList(fromUserId);
	}
}
