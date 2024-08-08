package PKG1;

import java.sql.Date;
import java.sql.Timestamp;

public class UserRequest {
	private int rid;
	private int isbn;
	private String bookname;
	private String genre;
	private int uid;
	private String username;
	private String phone;
	private String email;
	private String status;
	private Timestamp requestDate;
	private Date acceptDate;
	private Date dueDate;
	private double fine;
	private Date fineDate;
	
	
	public UserRequest(int rid, int isbn, String bookname, String genre, int uid, String username, String phone, String email, String status,
			Timestamp requestDate) {
		
		this.rid = rid;
		this.isbn = isbn;
		this.bookname = bookname;
		this.genre = genre;
		this.uid = uid;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.requestDate = requestDate;
	}
	
	public UserRequest(int rid, int isbn, String bookname, String genre, int uid, String username, String phone, String status,
			Timestamp requestDate) {
		
		this.rid = rid;
		this.isbn = isbn;
		this.bookname = bookname;
		this.genre = genre;
		this.uid = uid;
		this.username = username;
		this.phone = phone;
		this.status = status;
		this.requestDate = requestDate;
	}

	public UserRequest(int int1, int int2, String string, String string2, String string3) {
		
		this.rid = int1;
		this.isbn = int2;
		this.bookname = string;
		this.genre = string2;
		this.status = string3;
	}

	public UserRequest(int int1, int int2, String string, String string2, String string3, double fine) {
		this.rid = int1;
		this.uid = int2;
		this.username = string;
		this.phone = string2;
		this.email = string3;
		this.fine = fine;
	}

	public UserRequest(int int1, int int2, String string, String string2, String string3, double double1, Date date) {
		this.rid = int1;
		this.uid = int2;
		this.username = string;
		this.phone = string2;
		this.email = string3;
		this.fine = double1;
		this.fineDate = date;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Timestamp requestDate) {
		this.requestDate = requestDate;
	}

	public Date getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public double getFine() {
		return fine;
	}

	public void setFine(double fine) {
		this.fine = fine;
	}

	public Date getFineDate() {
		return fineDate;
	}

	public void setFineDate(Date fineDate) {
		this.fineDate = fineDate;
	}

}
