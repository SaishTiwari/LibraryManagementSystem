package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		String name = request.getParameter("name"); 
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		String publication = request.getParameter("publication");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		AddBooks book = new AddBooks(isbn,name,type,author,publication,quantity);
		boolean res = new ProcessManager().bookUpdate(isbn, book);
		if(res) {
			response.sendRedirect("SearchBookData");
		}else {
			System.out.println("Error to Update");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
