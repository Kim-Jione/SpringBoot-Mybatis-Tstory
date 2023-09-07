package site.metacoding.firstapp.domain.subscribe;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.response.subscribe.PostListDto;
import site.metacoding.firstapp.web.dto.response.subscribe.UserListDto;

public interface  SubscribeDao {
                  
    public Subscribe findById(Integer subscribeId);

	public List<Subscribe> findAll();

	public void insert(Subscribe subscribe);

	public void update(Subscribe subscribe);

	public void delete(Integer subscribeId);

    public Integer findByUserId(@Param("subscriberId") Integer subscriberId,
			@Param("creatorId") Integer creatorId);

    public List<PostListDto> findAllSubscribePost(Integer fromUserId);

    public Integer findByUserIdAndToUserId(Integer fromUserId, Integer toUserId);

    public List<UserListDto> findByUserList(Integer fromUserId);
}
