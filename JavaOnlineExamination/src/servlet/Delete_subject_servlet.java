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
 * Servlet implementation class Delete_subject_servlet
 */
public class Delete_subject_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_subject_servlet() {
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
		
		//System.out.println("id:"+id);
		
		SubjectDao dao = new SubjectDao();
		int result = dao.doDelete(id);
		if(result>=0) {
			JOptionPane.showMessageDialog(null, "删除信息成功！", "标题",JOptionPane.WARNING_MESSAGE);
		    request.getRequestDispatcher("all_manage/query_sub.jsp").forward(request, response);
		}else {
			JOptionPane.showMessageDialog(null, "删除信息失败！", "标题",JOptionPane.WARNING_MESSAGE);
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
