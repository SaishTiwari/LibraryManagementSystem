package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Accept_CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid =Integer.parseInt(request.getParameter("rid")) ;
		String status = request.getParameter("status");
		
		boolean res = new ProcessManager().updateRequest(rid, status);
		if(res) {
			response.sendRedirect("ViewRequestData");
		}else {
			System.out.println("Error to update");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
