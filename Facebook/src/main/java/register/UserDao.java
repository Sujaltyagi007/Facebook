package register;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.time.LocalDate;
import connection.Conn;
import jakarta.servlet.http.Part;
public class UserDao {
	private Connection con;
	public UserDao(Connection connect) {
		this.con=connect;
	}
	public String insertUser(String uname, String umail, String upass, String uphone, String uadd, char ugender, String uimg,
			LocalDate udob, String uedu, String username) {
		String r="no";
	try{
		con=Conn.connect();
		PreparedStatement ps=con.prepareStatement("insert into user (uname,umail,upass,uphone,uadd,ugender,uimg,udob,uedu,username) values (?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, uname);
		ps.setString(2, umail);
		ps.setString(3, upass);
		ps.setString(4, uphone);
		ps.setString(5, uadd);
		ps.setString(6, String. valueOf(ugender));
		ps.setString(7, uimg);
		ps.setDate(8, java.sql.Date.valueOf(udob));
		ps.setString(9, uedu);
		ps.setString(10, username);
		int i=ps.executeUpdate();
		if(i>0) {
		r="yes";
		}
	}catch(Exception e) {System.out.println(e);}
	return r;
}

	
	public UserBean login(String email,String password) {
		UserBean ubean=null;
		try {
			Connection connection = Conn.connect();
			 PreparedStatement ps=connection.prepareStatement("Select * from user where umail=? and upass=?");
			 ps.setString(1, email);
			 ps.setString(2, password);
			 ResultSet rs=ps.executeQuery();
			 if(rs.next()) {
				 char gen=rs.getString("ugender").charAt(0);
				ubean = new UserBean(rs.getInt("uid"), rs.getString("uname"), rs.getString("umail"), rs.getString("upass"), rs.getString("uphone"), rs.getString("uadd"), gen,
						rs.getString("uimg"), rs.getString("udob"), rs.getString("uedu"), rs.getString("username"),rs.getString("uproimage"));		
			}
			 
		}catch(Exception e) {System.out.print(e);}
		return ubean;

}

	
	public String UpdateImage(Part file, String image, String id) {
		String result=null;
		try {
			Connection connection = Conn.connect();
			 String uploadpath="C:/Users/Dell/eclipse-workspace/Facebook/src/main/webapp/Userimages/"+image;
			 System.out.print(uploadpath);
			 FileOutputStream fos=new FileOutputStream(uploadpath);
			 InputStream is = file.getInputStream();
			 byte[] data=new byte[is.available()];
			 is.read(data);
			 fos.write(data);
			 fos.close();
			 
			 PreparedStatement ps= connection.prepareStatement("UPDATE `facebook`.`user` SET `uimg` = ? WHERE uid ='"+id+"'");
			 ps.setString(1, image);
			 int i=ps.executeUpdate();
			 
			 if(i>0) {
			result="yes";	 
			 }
       }catch(Exception e) {System.out.println(e);}
     return result;
	}
	

	public String Updateprofileimage(Part file, String image, String id) {
		String result=null;
		try {
			 Connection connection = Conn.connect();
			 String uploadpath="C:/Users/Dell/eclipse-workspace/Facebook/src/main/webapp/Userimages/"+image;
			 System.out.print(uploadpath);
			 FileOutputStream fos=new FileOutputStream(uploadpath);
			 InputStream is = file.getInputStream();
			 byte[] data=new byte[is.available()];
			 is.read(data);
			 fos.write(data);
			 fos.close();
			 
			 PreparedStatement ps= connection.prepareStatement("UPDATE `facebook`.`user` SET `uproimage` = ? WHERE uid ='"+id+"'");
			 ps.setString(1, image);
			 int i=ps.executeUpdate();
			 
			 if(i>0) {
			result="yes";	 
			 }
			 }catch(Exception e) {System.out.println(e);}
		return result;
	}
	public ResultSet serach(String name) {
		ResultSet rs = null;
		try {
			 Connection connection = Conn.connect();
			 Statement stmt=connection.createStatement();
			 rs = stmt.executeQuery("Select * from user where uname LIKE '%"+name+"%' OR umail LIKE '%"+name+"%'");	 
		}catch(Exception e) {System.out.print(e);}
		return rs;

	}
	public UserBean FriendDetails(int id) {
		UserBean user = null;
		Connection connection = null;
		ResultSet rs= null;
		
		try {
			connection = Conn.connect();
			String query = ("Select * from user where uid=?"); 
			PreparedStatement ps=connection.prepareStatement(query);
			ps.setInt(1,id);
			rs= ps.executeQuery();
			if(rs.next()) {
				char gen=rs.getString("ugender").charAt(0);
				user = new UserBean(rs.getInt("uid"), rs.getString("uname"), rs.getString("umail"), rs.getString("upass"), rs.getString("uphone"), rs.getString("uadd"), gen,
						rs.getString("uimg"), rs.getString("udob"), rs.getString("uedu"), rs.getString("username"),rs.getString("uproimage"));
				System.out.print("\nGoing to UserProfile Page... ");
			}
			else {
				System.out.print("ResultSet is Null");
			}
			
		}catch(Exception e) {System.out.print(e);}
		return user;
	}
	public boolean makefrnd(int uid, int uid1, int actid) {
		// TODO Auto-generated method stub
		String query = "Insert into friends (uid, uid1,actionid) select ?,?,? WHERE NOT EXISTS (select uid, uid1 , actionid  from friends where uid=? and uid1=? and actionid=?);";
		boolean ans = false;
		try {
			Connection connection = Conn.connect();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1,uid);
			ps.setInt(2,uid1);
			ps.setInt(3,actid);
			ps.setInt(4,uid);
			ps.setInt(5,uid1);
			ps.setInt(6,actid);
			int i = ps.executeUpdate();
			if(i>0) {
				ps.close();
				String query2= "insert into `facebook`.`notification` (`uid`,`count`,`status`) values (?,1,?) on dulpicate key update count = count+1";
				ps = this.con.prepareStatement(query2);
				ps.setInt(1,uid1);
				ps.setString(2, "unread");
				@SuppressWarnings("unused")
				int j= ps.executeUpdate();
				ans = true;
			}
			
		}catch(Exception e) {System.out.print(e);}
		return ans;
	}
	public int count() {
		int i = 0;
		String action = "pending";
		String query = ("Select count(uid1) as count from friends where uid1= ? and action='"+action+"'");
		try {
			Connection connection = Conn.connect();
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			i = rs.getInt("count");
		}catch(Exception e) {System.out.print(e);}
		return i;
	}
	public int makepost(String content, String image, Part file,int id) throws IOException {
		// TODO Auto-generated method stub
		int i=0;
		String query = "INSERT INTO post (postcontent,uid,postimg,postdate ) VALUES (?, ? ,? ,NOW())";
		try {
			Connection connection = Conn.connect();
			 String uploadpath="C:/Users/Dell/eclipse-workspace/Facebook/src/main/webapp/PostImages/"+image;
			 System.out.print(uploadpath);
			 FileOutputStream fos=new FileOutputStream(uploadpath);
			 InputStream is = file.getInputStream();
			 byte[] data=new byte[is.available()];
			 is.read(data);
			 fos.write(data);
			 fos.close();
			 PreparedStatement ps= connection.prepareStatement(query);
			 ps.setString(1, content);
			 ps.setInt(2,id);
			 ps.setString(3, image);
			 i=ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public int makecontentpost(String content,int id) {
		int i=0;
		String query = "INSERT INTO post (postcontent,uid,postdate ) VALUES (?,,? ,NOW())";
		try {
			Connection con = Conn.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, content);
			ps.setInt(2, id);
			i = ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}
	
}
	