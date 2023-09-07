package site.metacoding.firstapp.domain.visit;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Visit {
    private Integer visitId;
	private Integer userId;
	private Integer postId;
	private Integer previousPostId;
	private Timestamp startTime;
	private Timestamp endTime;
	private Integer durationSecond;
	private Timestamp createdAt;
	private Timestamp updatedAt;	
}
