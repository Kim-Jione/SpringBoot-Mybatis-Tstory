package site.metacoding.firstapp.web.dto.auth;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.user.User;

@Builder
@Getter
@Setter
public class SessionUserDto {

	private Integer userId;
	private String username;

	public SessionUserDto(Integer userId, String username) {
		this.userId = userId;
		this.username = username;
	}

	public SessionUserDto(User userPS) {
		this.userId = userPS.getUserId();
		this.username = userPS.getUsername();
	}

	public SessionUserDto(FindByUsernameDto findByUsernameDto) {
		this.userId = findByUsernameDto.getUserId();
		this.username = findByUsernameDto.getUsername();
	}
}
