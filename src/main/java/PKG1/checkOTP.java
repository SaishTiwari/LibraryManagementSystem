package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class checkOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userOTP = Integer.parseInt(request.getParameter("otp"));
		int genOTP = Integer.parseInt(request.getParameter("genOTP"));
		String email = request.getParameter("email");
		
		if(userOTP == genOTP) {
			HttpSession ss = request.getSession();
			ss.setAttribute("email", email);
			response.sendRedirect("ChangePwd.jsp");
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("PwdOTP.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
