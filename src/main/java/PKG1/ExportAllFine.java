package PKG1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class ExportAllFine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sql = "select * from UserRequestBook";
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			String PDFFileName = System.getProperty("user.home") + "/Documents/PCPS/All_FineData.pdf";
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
			document.open();

			PdfPTable table = new PdfPTable(7);

	        // Add table headers
	        String[] headers = {"RequestID", "UserID", "Username", "Phone", "Email", "Fine", "FineDate"};
	        for (String header : headers) {
	            PdfPCell cell = new PdfPCell(new Paragraph(header));
	            table.addCell(cell);
	        }

	        // Add data rows
	        while (rs.next()) {
	            table.addCell(new PdfPCell(new Paragraph(String.valueOf(rs.getInt("RequestID")))));
	            table.addCell(new PdfPCell(new Paragraph(String.valueOf(rs.getInt("UserID")))));
	            table.addCell(new PdfPCell(new Paragraph(rs.getString("Username"))));
	            table.addCell(new PdfPCell(new Paragraph(rs.getString("Phone"))));
	            table.addCell(new PdfPCell(new Paragraph(rs.getString("Email"))));
	            table.addCell(new PdfPCell(new Paragraph(rs.getString("Fine"))));
	            table.addCell(new PdfPCell(new Paragraph(rs.getString("FineDate"))));
	        }

	        // Add table to the document
	        document.add(table);
			document.close();
			response.sendRedirect("FineSearch");

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
