package site.metacoding.firstapp.domain.user_interest;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class UserInterest {
    private Integer userInterestId;
	private Integer userId;
	private Integer categoryId;
	private String interestTitle;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}
