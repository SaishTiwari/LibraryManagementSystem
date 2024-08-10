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

public class ExportAllBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sql = "select * from Books";
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			String PDFFileName = System.getProperty("user.home") + "/Documents/PCPS/All_Books.pdf";
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
			document.open();

			PdfPTable table = new PdfPTable(6);

			PdfPCell cell;

			cell = new PdfPCell(new Paragraph("ISBN"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("BookName"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Genre"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Author"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Publication"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Quantity"));
			table.addCell(cell);

			while (rs.next()) {
				cell = new PdfPCell(new Paragraph(String.valueOf(rs.getInt("ISBN"))));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("BookName")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Type")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Author")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Publication")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(String.valueOf(rs.getInt("Quantity"))));
				table.addCell(cell);
			}

			document.add(table);
			document.close();
			response.sendRedirect("SearchBookData");

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		} 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
