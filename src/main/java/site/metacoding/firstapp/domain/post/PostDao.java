package site.metacoding.firstapp.domain.post;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.request.post.PostSaveDto;
import site.metacoding.firstapp.web.dto.response.main.KeywordDto;
import site.metacoding.firstapp.web.dto.response.post.PagingDto;
import site.metacoding.firstapp.web.dto.response.post.PostAllDto;
import site.metacoding.firstapp.web.dto.response.post.PostDetailDto;
import site.metacoding.firstapp.web.dto.response.post.PostUpdateDto;

public interface PostDao {

	public Post findById(Integer postId);

	public List<Post> findAll();

	public void insert(Post post);

	public void update(Post post);

	public void delete(Integer postId);

	public List<Post> findByUserId(Integer userId);

	public void insertSave(PostSaveDto postSaveDto);

	public void insertUpdate(PostUpdateDto postUpdateDto);

	public PostUpdateDto findByIdUpdate(@Param("postId") Integer postId, @Param("categoryId") Integer categoryId,
			@Param("userId") Integer userId); // 누구의 카테코리의 페이지를 수정

	public List<Post> findByCategoryId(Integer categoryId);

	public List<PostAllDto> findAllAndUsername();

	public PostDetailDto findByIdAndUser(@Param("postId")Integer postId, @Param("userId")Integer userId);

	public List<PostAllDto> findAllPost(@Param("userId") Integer userId, @Param("keyword") String keyword,
			@Param("startNum") Integer startNum);

	public Post postCount(@Param("userId") Integer userId, @Param("keyword") String keyword);

	public Post categoryCount(@Param("categoryId") Integer categoryId, @Param("keyword") String keyword);

	public List<KeywordDto> findSearchAllPost(String keyword);

	public PagingDto pagingByCategory(@Param("page") Integer page, @Param("userId") Integer userId,
			@Param("categoryId") Integer categoryId, @Param("keyword") String keyword);

	public List<PostAllDto> findPost(@Param("categoryId") Integer categoryId,
			@Param("userId") Integer userId, @Param("startNum") Integer startNum, @Param("keyword") String keyword);

	public PagingDto paging(@Param("page") Integer page, @Param("userId") Integer userId,
			@Param("keyword") String keyword);

}