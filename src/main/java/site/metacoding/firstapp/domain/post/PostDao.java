package site.metacoding.firstapp.domain.post;

import java.util.List;

public interface PostDao {

	public Post findById(Integer postId);

	public List<Post> findAll();

	public void insert(Post post);

	public void update(Post post);

	public void delete(Post post);
}
