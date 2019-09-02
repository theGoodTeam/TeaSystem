package examgroup;

public class ExamGroup {
	private int exam_id ;
	private String Account;
	private int sub_id;
	
	public ExamGroup() {
		
	}
	public ExamGroup(String Account) {
		this.Account=Account;
	}
	
	public ExamGroup(String Account,int sub_id) {
		this.Account=Account;
		this.sub_id=sub_id;
	}
	
	public int getExam_id() {
		return exam_id;
	}

	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}

	public String getAccount() {
		return Account;
	}

	public void setAccount(String account) {
		Account = account;
	}

	public int getSub_id() {
		return sub_id;
	}

	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}

	
	

}
