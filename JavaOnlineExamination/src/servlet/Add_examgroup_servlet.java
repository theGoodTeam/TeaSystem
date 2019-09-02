package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import examgroup.ExamGroup;
import examgroup.ExamGroupDao;
import subject.Subject;
import subject.SubjectDao;

/**
 * Servlet implementation class Add_examgroup_servlet
 */
public class Add_examgroup_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_examgroup_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ServletContext application = this.getServletContext();
		
		String account = request.getParameter("account");
		String  id = request.getParameter("id");
		int sub_id = Integer.parseInt(id);
		System.out.println("id:"+id+"account:"+account);
		

		ExamGroup examgroup = new ExamGroup();
		examgroup.setAccount(account);
		examgroup.setSub_id(sub_id);
		
		ExamGroupDao edao = new ExamGroupDao(examgroup);
		boolean result = edao.doAddExamGroup(examgroup);
		if(result) {
			 JOptionPane.showMessageDialog(null, "添加成功!", "标题",JOptionPane.WARNING_MESSAGE);
			 response.sendRedirect("all_manage/tab.jsp");
		}else {
			 JOptionPane.showMessageDialog(null, "添加失败!", "标题",JOptionPane.WARNING_MESSAGE);
			 response.sendRedirect("all_manage/tab.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
