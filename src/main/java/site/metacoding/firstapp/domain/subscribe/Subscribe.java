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
	private Integer userId;
	private Integer usersId;
	private Timestamp updatedAt;
	private Timestamp createdAt;

	public Subscribe(Integer userId, Integer usersId) {
		this.userId = userId;
		this.usersId = usersId;
	}
}
