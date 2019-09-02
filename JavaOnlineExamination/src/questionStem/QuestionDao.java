package questionStem;

import java.util.ArrayList;



public class QuestionDao {

	private QuestionQuery query=new QuestionQuery();
	private QuestionDelete delete=new QuestionDelete();
	private QuestionInsert insert=new QuestionInsert();
	private QuestionUpdate update=new QuestionUpdate();
	
	/**
	 * 查询所有试题的信息
	 * @return 一个结果集
	 */
	public ArrayList<Question> queryAll() {
		
		return query.doSelectAll();
	}
	/**
	 * 插入题库信息
	 * @param question
	 * @return返回一个整型数据
	 */
	public int intsertQuestion(Question question) {
		
		return insert.questionInsert(question);
	}
	/**
	 * 根据试题id删除试题信息
	 * @param id
	 * @return返回一个整型数据
	 */
	public int deleteQuestion(int id) {
		
		return delete.questionDelete(id);
	}
	/**
	 * 根据试题id修改试题信息
	 * @param id
	 * @return
	 */
	public int updateQuestion(int id) {
		
		return update.doUpdateQuestion(id);
	}
	
}
