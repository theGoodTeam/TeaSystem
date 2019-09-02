package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Counter;
import user.User;
import user.UserDao;

/**
 * Servlet implementation class Login_servlet
 */
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//处理乱码
		/*response.setContentType("text/html ; charset = utf-8"); 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("urf-8");*/
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ServletContext application = this.getServletContext();
		
		String account = request.getParameter("account");

		String  password = request.getParameter("password");
		
		User user = new User();
		user.setAccount(account);
	
		UserDao dao = new UserDao();
		boolean flag = dao.isLogin(user, password);
		if(flag) {
			user = dao.doSelectByUsername(account);//调用方法判断登录 
			session.setAttribute("user",user);//把用户账号保存到session变量 user中
			//user_type 0： 管理员  1：老师  2：学生
			if(user.getUser_type().equals("0")) {
				response.sendRedirect("Main_exam.jsp");		
			
				 int count;
				 String count_user;//当前在线人数
				 count_user = (String)application.getAttribute("count");//强制转换
				 System.out.println("登录前人数为："+count_user);
				 if(count_user == null) {
					 count=1;
				 }else {
					 int countt = Integer.parseInt(count_user);
					 Counter x= Counter.getinstance();
					 count = x.getvistorcount(countt); 
				 }
				 
				System.out.println("登录后人数为："+count);
				System.out.println();
				 application.setAttribute("count",String.valueOf(count));//更新在线人
			 
			}else if(user.getUser_type().equals("2")) {
				
				 session.setAttribute("user",user);//把用户账号保存到session变量 user中
				// response.sendRedirect("first.jsp");
			}else if(user.getUser_type().equals("1")) {
				session.setAttribute("user",user);//把用户账号保存到session变量 user中
				 response.sendRedirect("Student.jsp");
			}
			   
   
			 
			
		 }else{
			 response.sendRedirect("error.html");
			 //JOptionPane.showMessageDialog(null, "登录失败！！");
			 
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
