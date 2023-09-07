package site.metacoding.firstapp.domain.visit;

import java.util.List;

public interface  VisitDao {
                              
    public Visit findById(Integer visitId);

	public List<Visit> findAll();

	public void insert(Visit visit);

	public void update(Visit visit);

	public void delete(Integer visitId);
}
