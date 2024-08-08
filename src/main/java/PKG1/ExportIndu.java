package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class ExportIndu extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
    	out.print("Export");
    	
    	try {
            // Parse UID from request
            int uid = Integer.parseInt(request.getParameter("uid"));

            // Fetch user data from the database
            Register rg = new ProcessManager().search(uid);

            if (rg != null) {
                // Define the output PDF file
                String PDFFileName = "C:\\Users\\Manish\\Desktop\\LibPDF\\User_" + rg.getUID() + ".pdf";
                Document document = new Document();

                // Initialize PDF writer
                PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
                document.open();

                // Add content to PDF
                document.add(new Paragraph("UniversityID: " + rg.getUID()));
                document.add(new Paragraph("Name: " + rg.getName()));
                document.add(new Paragraph("DOB: " + rg.getDOB()));
                document.add(new Paragraph("Level: " + rg.getLevel()));
                document.add(new Paragraph("Email: " + rg.getEmail()));
                document.add(new Paragraph("Address: " + rg.getAddress()));
                document.add(new Paragraph("Phone: " + rg.getPhone()));
                document.add(new Paragraph("UserType: " + rg.getRole()));

                // Close the document
                document.close();
                response.sendRedirect("SearchData");

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
