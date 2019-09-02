package examgroup;

import common.DBUtil;
import subject.Subject;


public class ExamGroupDao {
	

	private DBUtil db = new DBUtil();
	private ExamGroup examgroup;
	private int exam_id ;
	private String Account;
	private int sub_id;
	
	public ExamGroupDao() {
		
	}
	
    public ExamGroupDao(ExamGroup examgroup) {
		this.examgroup=examgroup;
	}
	public ExamGroup getExamgroup() {
		return examgroup;
	}

	public void setExamgroup(ExamGroup examgroup) {
		this.examgroup = examgroup;
	}
	
	/**
	 * 
	 * @param subject
	 * @return
	 */
	public boolean doAddExamGroup(ExamGroup examgroup) {
		String sql ="insert exam_group(Account,sub_id)"
				+ "values ('"+examgroup.getAccount()+"','"+examgroup.getSub_id()+"')";
		int row = db.executeUpdate(sql);
		db.Close();
		if(row>0) {
			return true;
		}else{
			return false;
		}
		
	}
	
	
	

}
