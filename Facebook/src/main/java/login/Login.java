package login;
import java.io.IOException;
import register.*;
import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import register.UserDao;
public class Login extends HttpServlet{
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String mail = request.getParameter("email");
		String pass= request.getParameter("password");
		try {
			UserDao udao = new UserDao(Conn.connect());
			UserBean ubean = udao.login(mail, pass);
			if(ubean!=null) {
				request.getSession().setAttribute("UserBean",ubean);
				System.out.println("login successfull");
				request.setAttribute("msg","Login successful");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
			else {
				request.setAttribute("msg","Username or Password is Incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
				
			
		}catch(Exception e) {System.out.print(e);}
	}
	

}
