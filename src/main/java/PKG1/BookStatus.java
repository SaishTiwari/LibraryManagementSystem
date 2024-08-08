package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Receive
		String strSearch = request.getParameter("search");
		//boolean result = new Utilities().isNumeric(strSearch);
		List<UserRequest> req = null;
										
		if(strSearch!=null) {
			req = new ProcessManager().searchStatus(strSearch, GlobalVar.userid);
		}else {
			req = new ProcessManager().displayAllRequest(GlobalVar.userid);
		}
						
		//forward to display all books on BookStatus.jsp file
		request.setAttribute("req", req);
		request.setAttribute("value", strSearch);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("RequestStatus.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
