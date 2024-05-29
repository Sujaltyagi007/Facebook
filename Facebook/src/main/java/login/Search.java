package login;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.*;

import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Search extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		try {
			Connection con=Conn.connect();
			Statement stmt=con.createStatement();
			 ResultSet rs = stmt.executeQuery("Select * from user where uname LIKE '%"+name+"%' OR umail LIKE '%"+name+"%'");	 
			if(rs!=null && rs.next()) {
				System.out.print(rs.getString("uname"));
				request.getSession().setAttribute("msg",rs);
				request.getSession().setAttribute("name",name);
				request.getSession().setAttribute("msg1","yes");
                 response.sendRedirect("index.jsp");			}
			else {
				System.out.print("\nYou Have an Error in SearchServlet");
				request.setAttribute("msg1","No Result Found!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}catch(Exception e){System.out.print(e);}
}
}