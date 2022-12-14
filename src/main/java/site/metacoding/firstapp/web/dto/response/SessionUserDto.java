package site.metacoding.firstapp.web.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SessionUserDto {

	private Integer userId;
	private String username;

	public SessionUserDto(Integer userId, String username) {
		this.userId = userId;
		this.username = username;
	}
}
