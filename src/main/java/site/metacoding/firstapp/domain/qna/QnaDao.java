package site.metacoding.firstapp.domain.qna;

import java.util.List;


public interface  QnaDao {
          
    public Qna findById(Integer qnaId);

	public List<Qna> findAll();

	public void insert(Qna qna);

	public void update(Qna qna);

	public void delete(Integer qnaId);

}
