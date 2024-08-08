package PKG1;

public class Test {

	public static void main(String[] args) {
		ExpireMailSent mail = new ExpireMailSent();
		try {
			mail.setupServerProperties();
	        mail.draftEmail("saish.tiwari@patancollege.edu.np");
	        mail.sendEmail();
		}catch(Exception e) {
			System.out.println("Unable To Send");
		}
	}

}
