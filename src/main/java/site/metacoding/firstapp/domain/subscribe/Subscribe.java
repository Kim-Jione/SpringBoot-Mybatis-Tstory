package site.metacoding.firstapp.domain.subscribe;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class Subscribe {
	private Integer subscribeId;
	private Integer fromUserId;
	private Integer toUserId;
	private Timestamp updatedAt;
	private Timestamp createdAt;

	public Subscribe(Integer userId, Integer toUserId) {
		this.fromUserId = userId;
		this.toUserId = toUserId;
	}
}
