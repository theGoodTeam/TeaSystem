package questionStem;

import common.DBUtil;

public class QuestionDelete {
	private DBUtil db= new DBUtil();
	
	public int questionDelete(int id) {
		String sql="delete from question_stem where q_id='"+id+"'";
		int row=db.executeUpdate(sql);
		db.Close();
		return row;
	}
	
}
