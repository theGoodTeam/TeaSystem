package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import subject.Subject;
import subject.SubjectDao;

/**
 * Servlet implementation class QuerySub_servlet
 */
public class QuerySub_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuerySub_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html ; charset =GBK"); 
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ServletContext application = this.getServletContext();
		
		String sub_type = request.getParameter("sub_type");
		String  sub_name = request.getParameter("sub_name");
		
		System.out.println(sub_name+" +++++ "+ sub_type);
		Subject subject= new Subject();
		subject.setSub_name(sub_name);
		subject.setSub_type(sub_type);
		
		SubjectDao dao = new SubjectDao();
		List<Subject> list = null;
		list = dao.doSelectAll(sub_name, sub_type);
		if(list != null) {
			request.setAttribute("sub_list",list);
			//response.sendRedirect("all_manage/query_sub.jsp");
			request.getRequestDispatcher("all_manage/query_sub.jsp").forward(request, response);
			
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
