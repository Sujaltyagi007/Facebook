package post;

import java.io.IOException;
import java.sql.SQLException;

import connection.Conn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import register.UserDao;
@MultipartConfig
public class Post extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1371191130364227520L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String content = request.getParameter("postcontent");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		int id = Integer.parseInt(request.getParameter("uid"));
		System.out.print(id);
		System.out.print(image);
		if(file.equals(null)) {
			try {
				UserDao udao = new UserDao(Conn.connect());
				int i = udao.makecontentpost(content,id);
				if(i>0) {
					System.out.print("Successfully Content Post...");
					response.sendRedirect("index.jsp");
				}
				else {
					System.out.print("You Have an Error in Content Post");
					response.sendRedirect("index.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
		try {
			UserDao udao = new UserDao(Conn.connect());
			int i = udao.makepost(content,image,file,id);
			if(i>0) {
				System.out.print("Post Successfully!!!");
				response.sendRedirect("index.jsp");
			}
			else {
				System.out.print("You Have an Error in Post");
				response.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
