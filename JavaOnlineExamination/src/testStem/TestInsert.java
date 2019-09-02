package testStem;

import common.DBUtil;

public class TestInsert {
	private Test test=null;
	private DBUtil db = new DBUtil();
	/**
	 * 生成一张试卷
	 * @param test
	 * @return
	 */
	public int insertTest(Test test) {
		String sql="insert into test_paper(sub_code,sub_name,test_time,total_score,ques_id,account) values"
				+ "('"+test.getSub_code()+"','"+test.getSub_name()+"','"+test.getT_time()+"','"+test.getT_score()+"','"+test.getQ_id()+"',"
						+ "'"+test.getAccount()+"')";
		int row=db.executeUpdate(sql);
		
		return row;
	}
	
	/*public int insertQuestionById() {
		
		
		return 0;
		
	}*/
}
