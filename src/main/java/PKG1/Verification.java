package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		EmailSetUp em = new EmailSetUp();
		int GenOTP = new ProcessManager().generateOTP();
		boolean res = new ProcessManager().checkEmail(email);
		if(res) {
			try {
	            em.setupServerProperties();
	            em.draftEmail(email, GenOTP);
	            em.sendEmail();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			
			HttpSession ss = request.getSession();
			ss.setAttribute("email", email);
			ss.setAttribute("generatedOTP", GenOTP);
			response.sendRedirect("PwdOTP.jsp");
			
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("MailSend.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
