package testStem;

import common.DBUtil;

public class TestDelete {
	
	private DBUtil db=new DBUtil();
	
	/**
	 * 根据试卷id删除试卷信息
	 * @param id
	 * @return返回一个整型数据
	 */
	public int deleteTest(int id) {
		String sql="delete from test_paper where test_id='"+id+"'";
		int row=db.executeUpdate(sql);
		db.Close();
		return row;
	}
	/**
	 * 根据试题id删除试卷的内容
	 * @param id
	 * @return返回一个整型数据
	 */
	public int deleteTestQuestion(int id) {
		String sql="delete from test_paper where ques_id='"+id+"'";
		int row=db.executeUpdate(sql);
		db.Close();
		return row;
	}
}
