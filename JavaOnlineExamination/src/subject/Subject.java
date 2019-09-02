package subject;

public class Subject {
	
	
	private int sub_id;
	private String sub_code;
	private String sub_name;
	private String sub_desc;
	private String sub_type;
	
	public Subject() {
		
	}
	
	public Subject(String sub_code) {
			this.sub_code =  sub_code;
		}
	
	public Subject(String sub_code ,String sub_name) {
		this.sub_code =  sub_code;
		this.sub_name =  sub_name;
	}
	
	public int getSub_id() {
		return sub_id;
	}

	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
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

	public String getSub_desc() {
		return sub_desc;
	}

	public void setSub_desc(String sub_desc) {
		this.sub_desc = sub_desc;
	}

	public String getSub_type() {
		return sub_type;
	}

	public void setSub_type(String sub_type) {
		this.sub_type = sub_type;
	}

	

}
