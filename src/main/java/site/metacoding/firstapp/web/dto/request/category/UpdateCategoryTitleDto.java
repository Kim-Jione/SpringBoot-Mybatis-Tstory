package site.metacoding.firstapp.web.dto.request.category;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UpdateCategoryTitleDto {
	private Integer userId;
	private String categoryTitle;
}
