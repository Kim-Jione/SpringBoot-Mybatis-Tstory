package site.metacoding.firstapp.web.dto.request.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdatePasswordDto {
	private String password;
	private String passwordUpdate;
}
