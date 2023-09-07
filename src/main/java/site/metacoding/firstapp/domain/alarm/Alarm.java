package site.metacoding.firstapp.domain.alarm;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Alarm {
    private Integer alarmId;
    private String alarmSender;
    private String alarmReceiver;
    private String targetId;
    private String targetType;
    private String message;
    private Boolean isRead;
	private Timestamp createdAt;
	private Timestamp updatedAt;	
}
