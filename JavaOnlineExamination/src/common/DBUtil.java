package common;
/**
 * 数据库公共类
 * @author 游中成
 * @date 2018-04-03
 */
import java.sql.*;
public class DBUtil {
	private Connection conn;
	private Statement stmt ;
	private ResultSet rs;
	
	
	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	/**
	 *1.构造方法，构造时加载数据库程序
	 */
	public DBUtil(){
		String className ="com.mysql.jdbc.Driver";
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("数据库加载失败！");
		}
			
	}
	
	/**
	 * 2.连接数据库
	 * @return 返回一个数据库连接
	 */
	public Connection getConn() {
		String url = "jdbc:mysql://localhost:3306/examdb?characterEncoding=utf-8";
		String user = "root";
		String password = "123456" ;
		try {
			 conn = DriverManager.getConnection(url, user, password);
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("数据库连接失败！");
		}
		return conn;
		
	}
	
	/**
	 * 3.创建用来发送SQL命令的Statement的对象
	 * @return
	 */
	public Statement getStmt() {
		 try {
			 if(conn == null) {
				 conn = this.getConn();
			 }
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("创建陈述失败！！");
		}
		return stmt;
	}
	
      /**
       * 4.执行SQL命令 （insert ，update ，delete）
       * @param sql
       * @return -1 代表执行SQL命令失败，>=0成功
       */
	public  int  executeUpdate(String sql) {
		int result = -1;//假设SQL命令没有成功
		try {
			if(stmt == null) {
				stmt = this.getStmt();
			}
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL命令执行失败！");
		}
		return result;
	}
	
	/**
	 * 5.执行查询命令
	 * @param sql
	 * @return 
	 */
	
	public ResultSet executeQuery(String sql) {
		try {
			if(stmt == null) {
			   stmt = this.getStmt();
			}
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("查询SQL命令执行失败！");
		}
		return rs;
	}
	
	
	/**
	 * 6.关闭数据库
	 */
	public void Close(){
		try{
			if(rs != null){
				rs.close();
				rs = null;
			}
			if(stmt != null){
				stmt.close();
				stmt = null;
			}
			
			if( conn != null){
				conn.close();
				conn = null;
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("关闭数据库失败！");
		}
	}
}
