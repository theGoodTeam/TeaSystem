package testStem;

import common.DBUtil;

public class TestUpdate {
	private Test test=null;
	private DBUtil db=new DBUtil();
	
	/**
	 * 根据试卷id修改试卷信息
	 * @param id
	 * @return
	 */
	public int updateTest(int id) {
		String sql="update test_paper set sub_code='"+test.getSub_code()+"',sub_name='"+test.getSub_name()+"',test_time='"+test.getT_time()+"',"
				+ "total_score='"+test.getT_score()+"',ques_id='"+test.getQ_id()+"',account='"+test.getAccount()+"'";
		int row=db.executeUpdate(sql);
		db.Close();
		return row;
	}
}
