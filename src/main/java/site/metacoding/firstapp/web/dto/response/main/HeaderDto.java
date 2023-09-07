package site.metacoding.firstapp.web.dto.response.main;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HeaderDto {
	private Integer categoryId;
	private String categoryTitle;
	private Integer userId;
	private String loginId;
}
