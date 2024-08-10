package PKG1;

import jakarta.servlet.ServletException;
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

public class ExportAllUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sql = "select * from Registration";
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			String PDFFileName = System.getProperty("user.home") + "/Documents/PCPS/All_Users.pdf";
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(PDFFileName));
			document.open();

			PdfPTable table = new PdfPTable(8);

			PdfPCell cell;

			cell = new PdfPCell(new Paragraph("UID"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Name"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("DOB"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Level"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Email"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Address"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("Phone"));
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("UserType"));
			table.addCell(cell);

			while (rs.next()) {
				cell = new PdfPCell(new Paragraph(String.valueOf(rs.getInt("UID"))));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Name")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("DOB")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Level")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Email")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Address")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Phone")));
				table.addCell(cell);
				cell = new PdfPCell(new Paragraph(rs.getString("Role")));
				table.addCell(cell);
			}

			document.add(table);
			document.close();
			response.sendRedirect("SearchData");

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
