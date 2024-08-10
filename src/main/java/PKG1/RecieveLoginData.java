package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RecieveLoginData extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int UID=Integer.parseInt(request.getParameter("uid"));
		String pwd=request.getParameter("password");
		
		String addCookie=request.getParameter("addCookie");
		System.out.println(addCookie);
		boolean res = new ProcessManager().checkAndCookie(UID, pwd);
		
		if(addCookie == null) {
			if(res) {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("ClientSite.jsp");
				requestDispatcher.forward(request, response);
			}else if(UID == 1024 && pwd.equals("admin@123")) {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("LiberianDashboard.jsp");
				requestDispatcher.forward(request, response);
			}else {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request, response);
			}
		}
		
		if(addCookie!=null & addCookie.equals("yes")) {
			if(res) {
				Cookie c1=new Cookie("uid", String.valueOf(UID));
				Cookie c2=new Cookie("password", pwd);

				c1.setMaxAge(60);
				c2.setMaxAge(60);
				
				response.addCookie(c1);
				response.addCookie(c2);
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("ClientSite.jsp");
				requestDispatcher.forward(request, response);
			}else if(UID == 1024 && pwd.equals("admin@123")) {
				Cookie c1=new Cookie("uid", String.valueOf(UID));
				Cookie c2=new Cookie("password", pwd);

				c1.setMaxAge(40);
				c2.setMaxAge(40);
				
				response.addCookie(c1);
				response.addCookie(c2);
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("LiberianDashboard.jsp");
				requestDispatcher.forward(request, response);
			}else {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}