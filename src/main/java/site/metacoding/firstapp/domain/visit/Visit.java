package site.metacoding.firstapp.domain.visit;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
public class Visit {
	private Integer visitId;
	private Integer userId;
	private Integer totalCount;
	private Timestamp updatedAt;
	private Timestamp createdAt;
}
