package Search;
import java.io.IOException;
import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import register.UserBean;
import register.UserDao;

public class FriendProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7070231047090663739L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = (Integer.parseInt(request.getParameter("uid")));
		try {
		UserDao udao = new UserDao(Conn.connect());
		UserBean ubean =  udao.FriendDetails(id);
		if(ubean!=null) {
		request.getSession().setAttribute("user",ubean);
		request.getRequestDispatcher("FriendsProfile.jsp").forward(request, response);
		}
		}catch(Exception e) {System.out.print(e);}
	
}
}