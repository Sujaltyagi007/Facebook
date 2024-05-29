package register;

public class UserBean {
	private int uid;
	private String uname;
	private String umail;
	private String upass 	;
	private String uphone;
	private String uadd;
	private char ugender;
	private String uimg;
	private String udob;
	private String uedu;
	private String username;
	private String uproimage;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUadd() {
		return uadd;
	}
	public void setUadd(String uadd) {
		this.uadd = uadd;
	}
	public char getUgender() {
		return ugender;
	}
	public void setUgender(char ugender) {
		this.ugender = ugender;
	}
	public String getUimg() {
		return uimg;
	}
	public void setUimg(String uimg) {
		this.uimg = uimg;
	}
	public String getUdob() {
		return udob;
	}
	public void setUdob(String udob) {
		this.udob = udob;
	}
	public String getUedu() {
		return uedu;
	}
	public void setUedu(String uedu) {
		this.uedu = uedu;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUproimage() {
		return uproimage;
	}
	public void setUproimage(String uproimage) {
		this.uproimage= uproimage;
	}
	public UserBean(int uid, String uname, String umail, String upass, String uphone, String uadd, char ugender,
			String uimg, String udob, String uedu, String username,String uproimage) {
		super(); 
		this.uid = uid;
		this.uname = uname;
		this.umail = umail;
		this.upass = upass;
		this.uphone = uphone;
		this.uadd = uadd;
		this.ugender = ugender;
		this.uimg = uimg;
		this.udob = udob;
		this.uedu = uedu;
		this.username = username;
		this.uproimage = uproimage;
	}
	public UserBean(String uname, String umail, String upass, String uphone, String uadd, char ugender, String uimg,
			String udob, String uedu, String username,String uproimage) {
		super();
		this.uname = uname;
		this.umail = umail;
		this.upass = upass;
		this.uphone = uphone;
		this.uadd = uadd;
		this.ugender = ugender;
		this.uimg = uimg;
		this.udob = udob;
		this.uedu = uedu;
		this.username = username;
		this.uproimage = uproimage;
	}
	@Override
	public String toString() {
		return "UserBean [uid=" + uid + ", uname=" + uname + ", umail=" + umail + ", upass=" + upass + ", uphone="
				+ uphone + ", uadd=" + uadd + ", ugender=" + ugender + ", uimg=" + uimg + ", udob=" + udob + ", uedu="
				+ uedu + ", username=" + username +",uproimage="+ uproimage +"]";
	}
	
	public UserBean() {
		
	}
	
	
}
