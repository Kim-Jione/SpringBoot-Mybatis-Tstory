package site.metacoding.firstapp.domain.comment;

import java.util.List;


public interface  CommentDao {
      
    public Comment findById(Integer commentId);

	public List<Comment> findAll();

	public void insert(Comment comment);

	public void update(Comment comment);

	public void delete(Integer commentId);

    public void deleteByComment(Integer qnaId);  
}
