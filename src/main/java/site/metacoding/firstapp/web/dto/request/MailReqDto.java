package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MailReqDto {
	private String email;
	private Integer userId;
}
