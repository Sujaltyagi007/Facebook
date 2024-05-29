package friend;

import java.io.IOException;
import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import register.UserBean;
import register.UserDao;

public class Requestcount extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8504976553101146232L;
	protected void doGet(HttpServletRequest request,HttpServletResponse Response, ServletRequest session) throws ServletException , IOException {
		UserBean id = (UserBean)session.getAttribute("UserBean");
		if(id.equals(null)) {
			System.out.print("ID is NUll");
		}
		else {
			try {
				UserDao udao = new UserDao(Conn.connect());
				int count = udao.count();
				if(count == 0) {
					System.out.print("You Don't have any friend Request");
				}
				else {
					request.getSession().setAttribute("count",count);
				}
			}catch(Exception e) {System.out.print(e);}
		}
		
		
	}

}
