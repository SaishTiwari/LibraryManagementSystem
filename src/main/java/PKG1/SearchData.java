package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class SearchData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Receive
		String strSearch = request.getParameter("search");
		//boolean result = new Utilities().isNumeric(strSearch);
		List<Register> users = null;
				
		if(strSearch!=null) {
			users = new ProcessManager().search(strSearch,GlobalVar.userid);
		}else {
			users = new ProcessManager().displayAll();
		}
		
		//forward to display all users on DisplayUsers.jsp file
		request.setAttribute("users", users);
		request.setAttribute("value", strSearch);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserList.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
