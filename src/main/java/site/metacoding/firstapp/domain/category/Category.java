package site.metacoding.firstapp.domain.category;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Category {
    private Integer categoryId;
	private String categoryTitle;
	private Timestamp createdAt;
	private Timestamp updatedAt;	
}
