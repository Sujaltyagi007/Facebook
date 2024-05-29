package register;
import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String uname=request.getParameter("uname");
		String umail=request.getParameter("umail");
		String upass=request.getParameter("upass");
		String uphone=request.getParameter("uphone");
		String uadd=request.getParameter("uadd");
		String gen=request.getParameter("ugender");
		char ugender = (char) gen.indexOf(0);	
		String uimg=request.getParameter("uimg");
		String dob=request.getParameter("udob");
		LocalDate udob=LocalDate.parse(dob);
		String uedu=request.getParameter("uedu");
		String username=request.getParameter("username");	
		try {
			UserDao udao = new UserDao(Conn.connect());
			String user = udao.insertUser(uname,umail,upass,uphone,uadd,ugender,uimg,udob,uedu,username);
			if(user!=null) {
				System.out.print("Successful");
				response.sendRedirect("login.jsp");;
			}
		}catch(Exception e){System.out.print(e);}
		
		
	} 

}
