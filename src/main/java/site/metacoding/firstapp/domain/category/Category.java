package site.metacoding.firstapp.domain.category;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
public class Category {
	private Integer categoryId;
	private String categoryTitle;
	private Integer userId;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
