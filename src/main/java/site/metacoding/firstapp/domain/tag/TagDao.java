package site.metacoding.firstapp.domain.tag;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface  TagDao {
                      
    public Tag findById(Integer tagId);

	public List<String> findByTag(Integer postId);
	
	public List<Tag> findAll();

    public void insert(@Param("tagName")String tagName, @Param("postId")Integer postId);

	public void update(Tag tag);

	public void delete(Integer postId);


}
