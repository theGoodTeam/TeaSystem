package questionStem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;
import user.User;

public class QuestionQuery {
	private DBUtil db= new DBUtil();
	private Question ques=null;
	
	/**
	 * 查询：查询全部题信息
	 * @return 一个结果集
	 */
	public ArrayList<Question> doSelectAll() {
		ArrayList<Question> list = new ArrayList<Question>();
		String sql="select ques_id,ques_name,select_a,select_b,select_c,select_d,score,ques_right_answer from question_stem";
		ResultSet rs =db.executeQuery(sql);
		
		try {
			while(rs.next()) {
				Question ques1 =new Question();
				ques1.setQ_id(rs.getInt("ques_id"));
				ques1.setQ_name(rs.getString("ques_name"));
				ques1.setSelectA(rs.getString("select_a"));
				ques1.setSelectB(rs.getString("select_b"));
				ques1.setSelectC(rs.getString("select_c"));
				ques1.setSelectD(rs.getString("select_d"));
				ques1.setQ_score(rs.getInt("score"));
				ques1.setQ_right(rs.getString("ques_right_answer"));
				list.add(ques1);//把用户存放到数组中
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.Close();
		}
		return list;		
	}
}
