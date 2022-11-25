package site.metacoding.firstapp.domain.love;

import java.util.List;

public interface LoveDao {

	public Love findById(Integer loveId);

	public List<Love> findAll();

	public void insert(Love love);

	public void update(Love love);

	public void delete(Integer loveId);
}
