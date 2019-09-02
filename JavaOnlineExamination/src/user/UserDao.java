package user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBUtil;
import subject.Subject;

public class UserDao {
	private DBUtil db = new DBUtil();
	private User user;
	int u_id;
	String account;
	String password;
	String user_type;
	
	
	public UserDao() {
			
		}
	
	public UserDao(User user) {
		user = this.user;
	}
	 //获取一个user对象
	public User getUser() {
		return user;
	}
	//设置一个user对象
	public void setUser(User user) {
		this.user = user;
	}
	
	
	/**
	 * 重载登录方法  参数为User
	 * @param user
	 * @return
	 */
	public boolean isLogin(User user, String password) {
	
		String sql = "select * from user  where  account='"+user.getAccount()+"' and password='"+password+"'";
		ResultSet rs = db.executeQuery(sql);
		boolean flag = false;
		try {
			 flag = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		
		return flag;
	}

   

	/**
	 * 根据用户名称查找用户信息
	 * @param username
	 * @return 返回一个user对象
	 */
	
	public User doSelectByUsername(String account) {
		User user = null;
		String sql = "select * from user where account = '"+account+"'";
		ResultSet rs = db.executeQuery(sql);
		
		try {
			if(rs.next()) {
				
				user = new User();
				user.setU_id(rs.getInt("u_Id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUser_type(rs.getString("user_type"));
				

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
		return user;
		
	}
	/**
	 * 
	 * @param subject
	 * @return
	 */
	public boolean doAddUser(User user) {
		String sql ="insert user(Account,password,user_type)"
				+ "values ('"+user.getAccount()+"','"+user.getPassword()+"','"+user.getUser_type()+"')";
		int row = db.executeUpdate(sql);
		db.Close();
		if(row>0) {
			return true;
		}else{
			return false;
		}
		
	}

	
	public ArrayList<User> doSelectAll_list(){
		ArrayList<User> userlist = new ArrayList<User>();
		
		String sql = "select * from user ";
		
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next()) {
				User user =new User();
				user.setU_id(rs.getInt("u_id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUser_type(rs.getString("user_type"));
				userlist.add(user);//把用户存放到数组中
				
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}
	
	
	
	public List<User> doSelectAll(String account){
		List<User> userlist = new ArrayList<User>();
		
		String sql = "select * from user where account like '%"+account+"%'";
		
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next()) {
				User user =new User();
				user.setU_id(rs.getInt("u_id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUser_type(rs.getString("user_type"));
				userlist.add(user);//把用户存放到数组中
				
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}
	
	
}
