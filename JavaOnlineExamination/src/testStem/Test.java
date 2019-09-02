package testStem;

public class Test {
	
	private int t_id;
	private int q_id;
	private String sub_code;
	private String sub_name;
	private int t_time;
	private int  t_score;
	private String account;
	
	public Test() {
		
	}
	public Test(int t_id) {
			this.t_id=t_id;
	}
	public Test(int t_id,String sub_code) {
			this.t_id=t_id;
			this.sub_code=sub_code;
	}
	
	
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getSub_code() {
		return sub_code;
	}
	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getT_time() {
		return t_time;
	}
	public void setT_time(int t_time) {
		this.t_time = t_time;
	}
	public int getT_score() {
		return t_score;
	}
	public void setT_score(int t_score) {
		this.t_score = t_score;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
	
}
