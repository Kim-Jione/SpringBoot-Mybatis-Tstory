package site.metacoding.firstapp.domain.category;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.firstapp.web.dto.request.user.CheckDto;
import site.metacoding.firstapp.web.dto.response.main.HeaderDto;

public interface CategoryDao {

	public Category findById(Integer categoryId);

	public List<Category> findAll();

	public void insert(Category category);

	public void update(Category category);

	public List<HeaderDto> findByUserId(Integer userId);

	public List<Category> findByPostId(Integer postId);

	public void insertCategoryTitle(@Param("categoryTitle") String categoryTitle, @Param("userId") Integer userId);

	public void deleteById(Integer categoryId);

	public CheckDto findByCategoryTitle(@Param("categoryTitle") String categoryTitle,
			@Param("userId") Integer userId);

	public Category findByCategoryTitleId(@Param("categoryId") Integer categoryId,
			@Param("userId") Integer userId);

	public void updateCategoryTitle(@Param("categoryTitle") String categoryTitle, @Param("userId") Integer userId,
			@Param("categoryId") Integer categoryId);

	public void deleteAll(Integer categoryId);

	public Category findByUser(Integer userId);

}