package site.metacoding.firstapp.domain.alarm;

import java.util.List;

public interface AlarmDao {

    public Alarm findById(Integer alarmId);

	public List<Alarm> findAll();

	public void insert(Alarm alarm);

	public void update(Alarm alarm);

	public void delete(Integer alarmId);
}
