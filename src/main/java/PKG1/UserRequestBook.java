package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserRequestBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		PrintWriter out = response.getWriter();
		out.println("ISBN = "+ isbn +"UID ="+uid);
		
		AddBooks book = new ProcessManager().fetchBookData(isbn);
		Register user = new ProcessManager().fetchData(uid); 
		
		boolean res = new ProcessManager().bookRequestCheck(uid, isbn);
		if(res) {
			response.sendRedirect("RequestBook");
		}else {
			boolean res1 = new ProcessManager().addRequest(user, book);
			if(res1) {
				response.sendRedirect("RequestBook");
			}else {
				System.out.println("Error To Request");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
