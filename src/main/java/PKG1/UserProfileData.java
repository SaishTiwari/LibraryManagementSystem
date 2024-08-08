package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserProfileData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("name");
		String level = request.getParameter("level");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("date");
		String address = request.getParameter("address");
		
		Register rg = new Register(uid, name, level, phone, dob, address, new TimeStamp().getCurrentTimestamp());
		
		boolean res = new ProcessManager().userProfileUpdate(uid, rg);
		if(res) {
			response.sendRedirect("SearchData");
		}else {
			System.out.println("Error to Update");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
