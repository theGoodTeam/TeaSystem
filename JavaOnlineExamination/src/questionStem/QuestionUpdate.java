package questionStem;

import common.DBUtil;

public class QuestionUpdate {

	private DBUtil db=new DBUtil();
	private Question ques=null;
	
	public int doUpdateQuestion(int id) {
		//1,构造sql命令
		String sql = "update question_stem set ques_name='"+ques.getQ_name()+"', select_a='"+ques.getSelectA()+"',select_b='"+ques.getSelectB()+"'"
				+ "select_c='"+ques.getSelectC()+"',select_d='"+ques.getSelectD()+"',score='"+ques.getQ_score()+"',ques_right_answer='"+ques.getQ_right()+"' where ques_id='"+id+"';";
		//2，送到数据库类取执行
		int row = db.executeUpdate(sql);
		//3,关闭数据库
		db.Close();
		//4，返回结果
		return row;
	}
}
