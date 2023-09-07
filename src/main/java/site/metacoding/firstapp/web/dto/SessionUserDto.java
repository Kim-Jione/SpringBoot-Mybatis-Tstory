package site.metacoding.firstapp.web.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SessionUserDto {
    private Integer userId;
	private String loginId;
	private String role;
	private String nickname;
}
