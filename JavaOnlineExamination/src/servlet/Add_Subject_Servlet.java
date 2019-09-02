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

import subject.Subject;
import subject.SubjectDao;

/**
 * Servlet implementation class Add_Subject
 */
public class Add_Subject_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Subject_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		/*response.setContentType("text/html ; charset = utf-8"); 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("urf-8");*/
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ServletContext application = this.getServletContext();
		
		String sub_code = request.getParameter("sub_code");
		String  sub_name = request.getParameter("sub_name");
		Subject subject= new Subject();
		subject.setSub_code(sub_code);
		subject.setSub_name(sub_name);
		SubjectDao dao = new SubjectDao(subject);
		boolean result = dao.doAddSubject(subject);
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
