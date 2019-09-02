package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import user.User;
import user.UserDao;

/**
 * Servlet implementation class Add_TeacherObject_Servlet
 */
public class Add_TeacherObject_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_TeacherObject_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String account = request.getParameter("account");
		String  sub_name = request.getParameter("sub_name");
		
		
		
		System.out.println();
		User user = new User();
		user.setAccount(account);
	
	
		
		UserDao dao = new UserDao();
		boolean result = dao.doAddUser(user);
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
