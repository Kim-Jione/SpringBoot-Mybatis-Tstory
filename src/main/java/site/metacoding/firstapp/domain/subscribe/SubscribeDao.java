package site.metacoding.firstapp.domain.subscribe;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.response.subscribe.PostListDto;
import site.metacoding.firstapp.web.dto.response.subscribe.UserListDto;

public interface SubscribeDao {
	public Subscribe findById(Integer subscribeId);

	public List<Subscribe> findAll();

	public void insert(Subscribe subscribe);

	public void update(Subscribe subscribe);

	public void delete(Integer subscribeId);

	public Integer findByUserIdAndToUserId(@Param("fromUserId") Integer fromUserId,
			@Param("toUserId") Integer toUserId);

	public List<Subscribe> findByUserId(Integer fromUserId); // user가 구독한 id들

	public List<UserListDto> findByUserList(Integer fromUserId);

	public List<PostListDto> findAllSubscribePost(Integer fromUserId);
}
