package PKG1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session newSession;
    private MimeMessage mimeMessage;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UID = Integer.parseInt(request.getParameter("uid"));
		String Name = request.getParameter("name");
		String Level = request.getParameter("level");
		String DOB = request.getParameter("date");
		String Address = request.getParameter("address");
		String Role = request.getParameter("role");
		String Email = request.getParameter("mail");
		String Password = request.getParameter("password");
		String Phone = request.getParameter("phone");
		
		String en_pwd = "";
		
		try {
			en_pwd = new EncryptAndDecrypt().encrypt_data(Password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String teacherCodeStr = request.getParameter("teacherCode");
		int teacherCode = 0; // Default value or you can handle it as per your logic

		if (teacherCodeStr != null && !teacherCodeStr.trim().isEmpty()) {
		    try {
		        teacherCode = Integer.parseInt(teacherCodeStr);
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		    }
		}

		
		Register rg = new Register(UID, Name, Level, DOB, Address, Role, Email, en_pwd, Phone);
		
		if(teacherCode!=0 & teacherCode == 3081 || Role.equals("Student")) {
			int OTP = new ProcessManager().generateOTP();
			
			//OTP Sending Process 
			setupServerProperties();
			try {
				SentOTPEmail(Email,OTP);
			} catch (MessagingException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				sendEmail();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			HttpSession ss = request.getSession();
			ss.setAttribute("rg", rg);
			ss.setAttribute("generatedOTP", OTP);
			response.sendRedirect("EnterOTP.jsp");
		}else {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("RegisterUser.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void sendEmail() throws MessagingException {
        String fromUser = "saish.tiwari@patancollege.edu.np";
        String userPass = "Saish@308181"; // Use environment variables or configuration files instead
        String emailHost = "smtp.gmail.com";
        Transport transport = newSession.getTransport("smtp");
        transport.connect(emailHost, fromUser, userPass);
        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
        transport.close();
        System.out.println("Email sent successfully!");
    }

    public MimeMessage SentOTPEmail(String mail, int OTP) throws AddressException, MessagingException, IOException {
        String emailRecipients = mail; // Enter list of email recipients
        String emailSubject = "Registration OTP";
        String emailBody = "Your OTP: " + OTP;
        mimeMessage = new MimeMessage(newSession);

        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailRecipients));
        mimeMessage.setSubject(emailSubject);

        MimeBodyPart bodyPart = new MimeBodyPart();
        bodyPart.setContent(emailBody, "text/html");

        MimeMultipart multipart = new MimeMultipart();
        multipart.addBodyPart(bodyPart);

        mimeMessage.setContent(multipart);
        return mimeMessage;
    }

    public void setupServerProperties() {
        Properties properties = System.getProperties();
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        newSession = Session.getDefaultInstance(properties, null);
    }

}
