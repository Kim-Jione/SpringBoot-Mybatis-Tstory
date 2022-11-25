package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.domain.love.LoveDao;

@RequiredArgsConstructor
@Service
public class PostService {
	private final LoveDao loveDao;

	public Love 좋아요(Love love) {
		loveDao.insert(love);
		return love;
	}
}
