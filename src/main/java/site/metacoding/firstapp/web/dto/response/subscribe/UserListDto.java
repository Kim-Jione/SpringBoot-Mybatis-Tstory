package site.metacoding.firstapp.web.dto.response.subscribe;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserListDto {
	private Integer subscribeId;
	private Integer fromUserId;
	private Integer toUserId;
	private String username;
	private String nickname;
}
