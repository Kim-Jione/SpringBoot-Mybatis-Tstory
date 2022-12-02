package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.domain.love.LoveDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.web.dto.request.post.PostSaveDto;

@RequiredArgsConstructor
@Service
public class PostService {
	private final LoveDao loveDao;
	private final PostDao postDao;

	public Love 좋아요(Love love) {
		loveDao.insert(love);
		return love;
	}

	public void 좋아요취소(Integer loveId) {
		loveDao.delete(loveId);
	}

	public void 게시글등록하기(PostSaveDto postSaveDto) {
		postDao.insertSave(postSaveDto);

	}
}
