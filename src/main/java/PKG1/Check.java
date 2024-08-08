package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UID = Integer.parseInt(request.getParameter("uid"));
		String Name = request.getParameter("name");
		String Level = request.getParameter("level");
		String DOB = request.getParameter("dob");
		String Address = request.getParameter("address");
		String Role = request.getParameter("role");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		String Phone = request.getParameter("phone");
		Register rg = new Register(UID, Name, Level, DOB, Address, Role, Email, Password, Phone);
		
		int GenOTP = Integer.parseInt(request.getParameter("generatedOTP"));
		
		int userEnterOTP = Integer.parseInt(request.getParameter("EnterOTP"));
		
		if(userEnterOTP == GenOTP) {
			boolean res = new ProcessManager().registration(rg);
			if(res) {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request, response);
			}else {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("RegisterUser.jsp");
				requestDispatcher.forward(request, response);
			}
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("EnterOTP.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
