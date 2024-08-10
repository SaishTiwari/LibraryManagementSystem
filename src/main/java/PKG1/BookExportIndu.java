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

public class BookExportIndu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
    	out.print("BookExport");
    	
    	try {
            // Parse UID from request
            int isbn = Integer.parseInt(request.getParameter("isbn"));

            // Fetch user data from the database
            AddBooks book = new ProcessManager().searchBook(isbn);

            if (book != null) {
                // Define the output PDF file
            	String PDFFileName = System.getProperty("user.home") + "/Documents/PCPS/Book_" + book.getISBN() + ".pdf";
            	Document document = new Document();

                // Initialize PDF writer
                PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
                document.open();

                // Add content to PDF
                document.add(new Paragraph("ISBN: " + book.getISBN()));
                document.add(new Paragraph("BookName: " + book.getName()));
                document.add(new Paragraph("Type: " + book.getType()));
                document.add(new Paragraph("Author: " + book.getAuthor()));
                document.add(new Paragraph("Publication: " + book.getPublication()));
                document.add(new Paragraph("Quantity: " + book.getQuantity()));

                // Close the document
                document.close();
                response.sendRedirect("SearchBookData");

            } else {
                System.out.println("No such book found with ISBN");
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
