package friend;

import java.io.IOException;

import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import register.UserDao;

public class Frndrqstsend extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4163686587355748223L;
	protected void doGet(HttpServletRequest request , HttpServletResponse response ) throws IOException , ServletException{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int uid = Integer.parseInt(request.getParameter("uid"));
		int uid1 = Integer.parseInt(request.getParameter("uid1"));
		int actid = Integer.parseInt(request.getParameter("actid"));
		System.out.println(uid);
		System.out.println(uid1);
		if(uid==uid1) {
		System.out.println("Can't send the Friend request");
		response.sendRedirect("FriendProfile.jsp");		
		}else {
		try {
			UserDao udao = new UserDao(Conn.connect());
			boolean ubean = udao.makefrnd(uid, uid1 ,actid);
			if(ubean==true) {
				System.out.println("Friend request Sent!!");
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
			
		}catch(Exception e) {System.out.print(e);}

	}
	}
}

