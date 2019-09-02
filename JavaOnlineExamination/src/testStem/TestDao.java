package testStem;

import java.util.ArrayList;

public class TestDao {
	private TestQuery query=new TestQuery();
	private TestDelete delete=new TestDelete();
	private TestInsert insert=new TestInsert();
	private TestUpdate update=new TestUpdate();
	
	/**
	 * 查询试卷全部内容
	 * @return返回一个结果集
	 */
	public ArrayList<Test> doSelectTestAll(){
		return query.queryTest();
	}
	/**
	 * 根据试卷id修改试卷信息
	 * @param id
	 * @return
	 */
	public int doUpdateTest(int id) {
		return update.updateTest(id);
	}
	/**
	 * 根据试卷id删除试卷信息
	 * @param id
	 * @return返回一个整型数据
	 */
	public int doDeleteTest(int id) {
		return delete.deleteTest(id);
	}
	/**
	 * 根据试题id删除试卷中的试题
	 * @param id
	 * @return返回一个整型数据
	 */
	public int doDeleteTestQuestion(int id) {
		return delete.deleteTestQuestion(id);
	}
	/**
	 * 添加一张试卷
	 * @param test
	 * @return返回一个整型数据
	 */
	public int doInsertTest(Test test) {
		
		return insert.insertTest(test);
	}
	
	
}
