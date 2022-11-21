package site.metacoding.firstapp.domain.category;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CategoryDao {

	public Category findById(Integer categoryId);

	public List<Category> findAll();

	public void insert(Category category);

	public void update(Category category);

	public void delete(Category category);

	public List<Category> findByUserId(Integer userId);

	public List<Category> findByPostId(Integer postId);

	public List<Category> findByCategoryTitle(@Param("userId") Integer userId, @Param("categoryId") Integer categoryId); 

	public void insertCategoryTitle(@Param("categoryTitle") String categoryTitle, @Param("userId") Integer userId);

}
