package site.metacoding.firstapp.domain.category;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.response.main.HeaderDto;

public interface CategoryDao {

	public Category findById(Integer categoryId);

	public List<Category> findAll();

	public void insert(Category category);

	public void update(Category category);

	public void delete(Category category);

	public List<HeaderDto> findByUserId(Integer userId);

	public List<Category> findByPostId(Integer postId);


	public void insertCategoryTitle(@Param("categoryTitle") String categoryTitle, @Param("userId") Integer userId);


}
