package site.metacoding.firstapp.domain.report;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Report {
    private Integer reportId;
    private String reportContent;
    private String reportCategory;
	private Integer userId;
	private Integer targetId;
    private String targetType;
	private Timestamp createdAt;
    private Timestamp updatedAt;
    
    @Builder
    public Report(String reportContent, String reportCategory, Integer userId, Integer targetId, String targetType) {
        super();
        this.reportContent = reportContent;    
        this.reportCategory = reportCategory;
        this.userId = userId;
        this.targetId = targetId;
        this.targetType = targetType;
    }
}
