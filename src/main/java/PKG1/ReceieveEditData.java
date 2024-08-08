package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReceieveEditData extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UID = Integer.parseInt(request.getParameter("uid"));
		String Name = request.getParameter("name");
		String Level = request.getParameter("level");
		String DOB = request.getParameter("date");
		String Address = request.getParameter("address");
		String Role = request.getParameter("role");
		String Email = request.getParameter("mail");
		String Password = request.getParameter("password");
		String Phone = request.getParameter("phone");
		
		String en_pwd = "";
		try {
			en_pwd = new EncryptAndDecrypt().encrypt_data(Password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Register rg = new Register(UID, Name, Level, DOB, Address, Role, Email, en_pwd, Phone, new TimeStamp().getCurrentTimestamp());
		
		boolean res = new ProcessManager().updateProfile(GlobalVar.userid, rg);
		if(res) {
			request.setAttribute("userid", GlobalVar.userid);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("ClientSite.jsp");
			requestDispatcher.forward(request, response);
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("EditProfile.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
