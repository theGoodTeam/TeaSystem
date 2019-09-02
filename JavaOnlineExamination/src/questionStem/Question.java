package questionStem;

public class Question {
	private int q_id;
	private String q_name;
	private String selectA;
	private String selectB;
	private String selectC;
	private String selectD;
	private int q_score;
	private String q_right;
	
	public Question() {
		
	}
	public Question(int q_id) {
			this.q_id=q_id;
	}
	
	
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public Question(String q_name) {
		this.q_name=q_name;
	}
	
	public String getQ_name() {
		return q_name;
	}
	
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	
	public String getSelectA() {
		return selectA;
	}
	public void setSelectA(String selectA) {
		this.selectA = selectA;
	}
	public String getSelectB() {
		return selectB;
	}
	public void setSelectB(String selectB) {
		this.selectB = selectB;
	}
	public String getSelectC() {
		return selectC;
	}
	public void setSelectC(String selectC) {
		this.selectC = selectC;
	}
	public String getSelectD() {
		return selectD;
	}
	public void setSelectD(String selectD) {
		this.selectD = selectD;
	}
	public int getQ_score() {
		return q_score;
	}
	public void setQ_score(int q_score) {
		this.q_score = q_score;
	}
	public String getQ_right() {
		return q_right;
	}
	public void setQ_right(String q_right) {
		this.q_right = q_right;
	}
	
	
	
}
