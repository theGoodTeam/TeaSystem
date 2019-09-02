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
 * Servlet implementation class Update_Subject_Servlet
 */
public class Update_Subject_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Subject_Servlet() {
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
		
		int id =Integer.parseInt(request.getParameter("id"));
		
		String sub_code = request.getParameter("sub_code");
		String  sub_name = request.getParameter("sub_name");
		System.out.println(sub_code+"===="+sub_name);
		
		Subject subject = new Subject();
		subject.setSub_code(sub_code);
		subject.setSub_name(sub_name);
		subject.setSub_id(id);
		SubjectDao dao = new SubjectDao();
        int result  = dao.doUpdateSub(subject);
		if(result>=0) {
			JOptionPane.showMessageDialog(null, "修改信息成功！", "标题",JOptionPane.WARNING_MESSAGE);
		    request.getRequestDispatcher("all_manage/query_sub.jsp").forward(request, response);
		}else {
			JOptionPane.showMessageDialog(null, "修改信息失败！", "标题",JOptionPane.WARNING_MESSAGE);
			//request.getRequestDispatcher("error.jsp").forward(request, response);
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
