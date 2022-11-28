package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.subscribe.Subscribe;
import site.metacoding.firstapp.domain.subscribe.SubscribeDao;

@RequiredArgsConstructor
@Service
public class SubscribeService {
	private final SubscribeDao subscribeDao;

	public void 구독하기(Integer userId, Integer usersId) {
		Subscribe subscribe = new Subscribe(userId, usersId);
		subscribeDao.insert(subscribe);
	}

	public void 구독취소(Integer subscribeId) {
		subscribeDao.delete(subscribeId);
	}

	public Integer 구독Id불러오기(Integer userId, Integer usersId) {
		return subscribeDao.findByUserIdAndUsersId(userId, usersId);
	}
}