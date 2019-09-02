package user;

public class User {
	
	int u_id;
	String account;
	String password;
	String user_type;
	
	
	public User() {
		
	}
	
	public User(String account) {
			this.account=account;
	}
	
	public User(String account,String password) {
		this.account=account;
		this.password=password;
	}
	
	
	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	

}
