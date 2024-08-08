package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CookieChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
	    String uid = null;
	    String password = null;

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if ("uid".equals(cookie.getName())) {
	                uid = cookie.getValue();
	            } else if ("password".equals(cookie.getName())) {
	                password = cookie.getValue();
	            }
	        }
	    }

	    if (uid != null && password != null) {

	        boolean res = new ProcessManager().checkAndCookie(Integer.parseInt(uid), password);
	        if(res) {
	        	response.sendRedirect("ClientSite.jsp");
	        }else if(Integer.parseInt(uid) == 1024 && password.equals("admin@123")) {
				response.sendRedirect("LiberianDashboard.jsp");
			}else {
	        	System.out.println("Invalid cookies. Please login again.");
	        }
	        
	   } else {
	        response.sendRedirect("Login.jsp"); // Redirect to login page if cookies are not present
	    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
