package PKG1;

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

public class ExpireMailSent {
	private Session newSession;
	private MimeMessage mimeMessage;

	public void sendEmail() throws MessagingException {
		String fromUser = "saish.tiwari@patancollege.edu.np";
		String userPass = "Saish@308181";
		String emailHost = "smtp.gmail.com";
		Transport transport = newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, userPass);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		System.out.println("Email sent successfully!");
	}

	public MimeMessage draftEmail(String mail) throws AddressException, MessagingException, IOException {
	    String emailRecipients = mail;  // Enter list of email recipients
	    String emailSubject = "Inform";
	    String emailBody = "We Request Users to Return Book on time. Your Due Data is About to Expire!.";
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

	void setupServerProperties() {
	    Properties properties = System.getProperties();
	    properties.put("mail.smtp.port", "587");
	    properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.starttls.enable", "true");
	    newSession = Session.getDefaultInstance(properties, null);
	}
}
