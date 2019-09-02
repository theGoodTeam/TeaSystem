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

import user.User;
import user.UserDao;



/**
 * Servlet implementation class QueryUser_Servlet
 */
public class QueryUser_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryUser_Servlet() {
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
		
		
		String  account = request.getParameter("account");
		System.out.println(account);
		UserDao dao = new UserDao();
		List<User> list = null;
		list = dao.doSelectAll(account);
		if(list != null) {
			request.setAttribute("user_list",list);
			//response.sendRedirect("all_manage/query_sub.jsp");
			request.getRequestDispatcher("all_manage/user.jsp").forward(request, response);
			
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
