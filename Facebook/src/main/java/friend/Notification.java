package friend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
public class Notification extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("uid"));
		try {
			Connection con = Conn.connect();
			java.sql.Statement stmt = con.createStatement();
			ResultSet rs= stmt.executeQuery("select uid from friend where uid1 ='"+id+"'");
			if(rs.next()) {
				request.getSession().setAttribute("rqst", rs);
				response.sendRedirect("navbar.jsp");
			}
			else {
				System.out.print("You hava an error in request section");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	

}}
