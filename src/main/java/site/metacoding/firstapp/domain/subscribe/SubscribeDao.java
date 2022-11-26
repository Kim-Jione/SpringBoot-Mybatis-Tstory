package site.metacoding.firstapp.domain.subscribe;

import java.util.List;

public interface SubscribeDao {
	public Subscribe findById(Integer subscribeId);

	public List<Subscribe> findAll();

	public void insert(Subscribe subscribe);

	public void update(Subscribe subscribe);

	public void delete(Integer subscribeId);
}
