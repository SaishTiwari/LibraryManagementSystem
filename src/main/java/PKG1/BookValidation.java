package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String authorname = request.getParameter("authorname");
		String publication = request.getParameter("publication");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		AddBooks ad = new AddBooks(isbn, name, type, authorname, publication, quantity);
		
		boolean res = new ProcessManager().addBooks(ad);
		if(res) {
			System.out.println("Added");
		}else {
			System.out.println("Error");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
