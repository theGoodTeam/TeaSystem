package testStem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;
import questionStem.Question;

public class TestQuery {

	private Test test=null;
	private DBUtil db = new DBUtil();
	/**
	 * 查询试卷全部内容
	 * @return返回一个结果集
	 */
	public ArrayList<Test> queryTest() {
		ArrayList<Test> list = new ArrayList<Test>();
		String sql="select test_id,sub_code,sub_name,test_time,total_score,ques_id,account from test_paper";
		ResultSet rs =db.executeQuery(sql);
		
		try {
			while(rs.next()) {
				Test test1 =new Test();
				test1.setT_id(rs.getInt("test_id"));
				test1.setSub_code(rs.getString("sub_code"));
				test1.setSub_name(rs.getString("sub_name"));
				test1.setT_time(rs.getInt("test_time"));
				test1.setT_score(rs.getInt("total_score"));
				test1.setQ_id(rs.getInt("ques_id"));
				test1.setAccount(rs.getString("account"));
				list.add(test1);//把用户存放到数组中
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
