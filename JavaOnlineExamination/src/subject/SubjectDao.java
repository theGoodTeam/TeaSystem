package subject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBUtil;



public class SubjectDao {
	

	private DBUtil db = new DBUtil();
	private Subject subject;
	private int sub_id;
	private String sub_code;
	private String sub_name;
	private String sub_desc;
	private String sub_type;
	
	
	
	public SubjectDao() {
	
	}
	public SubjectDao(Subject subject) {
		this.subject=subject;
	}
	
	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	

	/**
	 * 添加科目
	 * @param subject
	 * @return
	 */
	public boolean doAddSubject(Subject subject) {
		String sql ="insert subject_type(sub_code,sub_name)"
				+ "values ('"+subject.getSub_code()+"','"+subject.getSub_name()+"')";
		int row = db.executeUpdate(sql);
		db.Close();
		if(row>0) {
			return true;
		}else{
			return false;
		}
		
	}
	
	/**
	 * 查询科目列表
	 * @return 返回一个动态数组
	 */
	public ArrayList<Subject> doSelectAll_list() {
		ArrayList<Subject> list = new ArrayList<Subject>();//定义一个空的动态数组
		
		String sql = "select * from subject_type";
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next()) {
				//读取当前行数据
				Subject subject = new Subject();
				subject.setSub_code(rs.getString("sub_code"));
				subject.setSub_id(rs.getInt("sub_id"));
				subject.setSub_name(rs.getString("sub_name"));
				subject.setSub_type(rs.getString("sub_type"));
				subject.setSub_desc(rs.getString("sub_desc"));
				list.add(subject);//把用户存到数组里面
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				db.Close();
			}
		}
		
		
		return list;
	}
		
	

	public List<Subject> doSelectAll(String sub_name ,String sub_type){
		List<Subject> sublist = new ArrayList<Subject>();
		String sql = "select * from subject_type where 1=1 ";
		
		if(sub_name != null  && sub_name.length()>0) {
			sql = sql+"and sub_name like '%"+sub_name+"%'";
		}
		if(sub_type != null && sub_type.length()>0) {
			sql = sql+"and sub_type like '%"+sub_type+"%'";
		}
		
		System.out.println(sql);
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next()) {
				Subject subject = new Subject();
				subject.setSub_code(rs.getString("sub_code"));
				subject.setSub_id(rs.getInt("sub_id"));
				subject.setSub_name(rs.getString("sub_name"));
				subject.setSub_type(rs.getString("sub_type"));
				subject.setSub_desc(rs.getString("sub_desc"));
				sublist.add(subject);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sublist;
	}
	
	/**
	 *根据ID查询科目信息
	 * @param id
	 * @return
	 */
	public Subject doSelect(int id) {
		Subject subject = null;
		String sql = "select * from subject_type where sub_id = "+id+";";
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()) {
				//读记录
				subject = new Subject();
				subject.setSub_id(rs.getInt("sub_id"));
				subject.setSub_code(rs.getString("sub_code"));
				subject.setSub_name(rs.getString("sub_name"));
				subject.setSub_type(rs.getString("sub_type"));
				subject.setSub_desc(rs.getString("sub_desc"));
				
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.Close();
		}
		return subject;
	}
	
	/**
	 *根据ID查询科目信息
	 * @param id
	 * @return
	 */
	public int doSelect(String sub_name) {
		int sub_id = (Integer) null ;
		String sql = "select sub_id from subject_type where sub_nmae = "+sub_name+";";
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()) {
				//读记录
				subject = new Subject();
				sub_id = rs.getInt("sub_id");
						
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.Close();
		}
		return sub_id;
	}
	
	public int doUpdateSub(Subject subject) {
		int result = -1;
		//1,构造sql命令
		String sql = "UPDATE subject_type set sub_code='"+subject.getSub_code()+"', sub_name='"+subject.getSub_name()+"' where sub_id="+subject.getSub_id()+";";
		//2，送到数据库类取执行
		result = db.executeUpdate(sql);
		//3,关闭数据库
		db.Close();
		//4，返回结果
		return result;
	}
	


	public int doDelete(int id) {
		String sql = "delete from subject_type  where  sub_id='"+id+"';";
		int row = db.executeUpdate(sql);
		db.Close();
		return row;
		
	}
    
}
