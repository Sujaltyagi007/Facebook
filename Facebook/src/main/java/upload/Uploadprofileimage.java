package upload;
import java.io.IOException;
import connection.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import register.UserDao;
@MultipartConfig
public class Uploadprofileimage extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3976167863872558653L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		Part file = request.getPart("image");
		String image =file.getSubmittedFileName();
		String id=request.getParameter("id");
		try {
			
			UserDao udao = new UserDao(Conn.connect());
			String result=udao.Updateprofileimage(file, image, id);
			if(result.equals("yes")) {
				System.out.print("Profile Photot Update Successfully");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
		}catch(Exception e) { System.out.print(e);}
		
	}

}
