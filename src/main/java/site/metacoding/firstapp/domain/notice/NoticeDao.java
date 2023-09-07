package site.metacoding.firstapp.domain.notice;

import java.util.List;

public interface  NoticeDao {
                          
	public Notice findById(Integer noticeId);
	
	public List<Notice> findAll();

	public void insert(Notice notice);

	public void update(Notice notice);

	public void delete(Integer noticeId);
}
