package site.metacoding.firstapp.domain.post;

import java.util.List;

import site.metacoding.firstapp.web.dto.request.PostSaveDto;

public interface PostDao {

	public Post findById(Integer postId);

	public List<Post> findAll();

	public void insert(Post post);

	public void update(Post post);

	public void delete(Post post);

	public List<Post> findByUserId(Integer userId);

	public void insertSave(PostSaveDto postSaveDto);

}
