package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class ExportFine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            // Parse UID from request
            int uid = Integer.parseInt(request.getParameter("rid"));

            // Fetch user data from the database
            UserRequest rg = new ProcessManager().searchFine(uid);

            if (rg != null) {
                // Define the output PDF file
            	String PDFFileName = System.getProperty("user.home") + "/Documents/PCPS/Fine_" + rg.getUid() + ".pdf";
                Document document = new Document();

                // Initialize PDF writer
                PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
                document.open();

                // Add content to PDF
                document.add(new Paragraph("RequestID: " + rg.getRid()));
                document.add(new Paragraph("UserID: " + rg.getUid()));
                document.add(new Paragraph("Username: " + rg.getUsername()));
                document.add(new Paragraph("Phone: " + rg.getPhone()));
                document.add(new Paragraph("Email: " + rg.getEmail()));
                document.add(new Paragraph("Fine: " + rg.getFine()));
                document.add(new Paragraph("FineDate: " + rg.getFineDate()));

                // Close the document
                document.close();
                response.sendRedirect("FineSearch");

            } else {
                System.out.println("No user found with ID");
            }

        } catch (NumberFormatException e) {
            System.out.println("Invalid UID format: " + e.getMessage());
        } catch (Exception e) {
            // Log or print full stack trace for better debugging
            e.printStackTrace();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
