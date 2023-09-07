package site.metacoding.firstapp.domain.tag;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Tag {
    private Integer tagId;
	private String tagName;
	private Integer post_id;
	private Timestamp createdAt;
	private Timestamp updatedAt;	
}
