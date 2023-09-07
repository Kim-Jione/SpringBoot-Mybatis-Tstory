package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.domain.love.LoveDao;
@RequiredArgsConstructor
@Service
public class LoveService {

    private final LoveDao loveDao;
	
    public Love 좋아요(Love love) {
		loveDao.insert(love);
		return love;
	}

	public void 좋아요취소(Integer loveId) {
		loveDao.delete(loveId);
	}
}
