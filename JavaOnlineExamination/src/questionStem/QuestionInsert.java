package questionStem;

import common.DBUtil;

public class QuestionInsert {

	private DBUtil db= new DBUtil();
	private Question ques=null;
	
	public  int questionInsert(Question question) {
		String sql="insert into question_stem (ques_name,select_a,select_b,select_c,select_d,score,ques_right_answer) "
				+ "values('"+question.getQ_name()+"','"+question.getSelectA()+"','"+question.getSelectB()+"','"+question.getSelectC()+"','"+question.getSelectD()+"','"+question.getQ_score()+"','"+question.getQ_right()+"')";
		int row=db.executeUpdate(sql);
		
		db.Close();
		
		return row ;
	}
}
