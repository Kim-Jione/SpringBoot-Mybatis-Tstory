package site.metacoding.firstapp.domain.post;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.request.PostSaveDto;
import site.metacoding.firstapp.web.dto.response.PostAllDto;
import site.metacoding.firstapp.web.dto.response.PostUpdateDto;

public interface PostDao {

	public Post findById(Integer postId);

	public List<Post> findAll();

	public void insert(Post post);

	public void update(Post post);

	public void delete(Integer postId);

	public List<Post> findByUserId(Integer userId);

	public void insertSave(PostSaveDto postSaveDto);

	public void insertUpdate(PostUpdateDto postUpdateDto);

	public PostUpdateDto findByIdUpdate(@Param("postId") Integer postId,
			@Param("categoryId") Integer categoryId, @Param("userId") Integer userId); // 누구의 카테코리의 페이지를 수정

	public List<Post> findByCategoryId(Integer categoryId);

	public List<PostAllDto> findAllAndUsername();

}
