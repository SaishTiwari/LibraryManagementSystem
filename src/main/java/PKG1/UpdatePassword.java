package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		
		if(pass1.equals(pass2)) {
			boolean res = new ProcessManager().updateNewPassword(pass2, email);
			if(res) {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request, response);
			}
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("ChangePwd.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
