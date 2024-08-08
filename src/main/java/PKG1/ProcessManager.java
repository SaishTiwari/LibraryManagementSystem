package PKG1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;




public class ProcessManager extends DatabaseConnection{
    
	public boolean checkAndCookie(int uid, String pass){
		boolean res = false;
		
		try {
            Connection conn = connect();
            String sql = "select * from Registration";
            Statement s = conn.createStatement();
            
            int usr = 0;
            String pwd = "";
            
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()){
            	
            	usr = rs.getInt("UID");
            	pwd = new EncryptAndDecrypt().decrypt_data(rs.getString("Password"));
            	
            	if(uid==usr & pass.equals(pwd)) {
            		GlobalVar.userid = rs.getInt("UID");
                    res = true;
            	}
            }
            
        } catch (Exception e) {
        	System.out.println("Error: " + e.getMessage());
        }
		
		return res;
	}
	
	public boolean registration(Register rg) {
		boolean res = false;
		
		try {
            Connection con = connect();
            String sql = "INSERT INTO Registration (uid, name, level, DOB, address, role, email, password, phone, RegistrationDateTime, UpdateDateTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, rg.getUID());
            ps.setString(2, rg.getName());
            ps.setString(3, rg.getLevel());
            ps.setString(4, rg.getDOB());
            ps.setString(5, rg.getAddress());
            ps.setString(6, rg.getRole());
            ps.setString(7, rg.getEmail());
            ps.setString(8, rg.getPassword());
            ps.setString(9, rg.getPhone());
            ps.setTimestamp(10, rg.getRegDateTime());
			ps.setTimestamp(11, rg.getUpDateTime());
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
		
		return res;
	}
    
    public int generateOTP() {
    	
    	int OTP = 0;
    	
    	Random rn = new Random();
        int n1 = rn.nextInt(9) + 1; 
        int n2 = rn.nextInt(10);    
        int n3 = rn.nextInt(10);
        int n4 = rn.nextInt(10);

        String stringOTP = String.valueOf(n1) + String.valueOf(n2) + String.valueOf(n3) + String.valueOf(n4);
    	OTP = Integer.parseInt(stringOTP);
        
    	return OTP;
    }
    
    public boolean checkEmail(String email) {
    	boolean res = false;
    	
    	try {
			Connection con=connect();
			String sql="select * from Registration where Email=?";
			
			PreparedStatement s=con.prepareStatement(sql);
			s.setString(1, email);
			ResultSet rs=s.executeQuery();
			
			while(rs.next()){
				res = true;
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
    	
    	return res;
    }
    
    public boolean updateNewPassword(String pass, String email) {
    	boolean res = false;
    	
    	try {
			Connection con=connect();
			String sql="update Registration set password=? where email=?";
			
			PreparedStatement s=con.prepareStatement(sql);
			s.setString(1, pass);
			s.setString(2, email);
			
			int rowsAffected = s.executeUpdate();

	        if (rowsAffected > 0) {
	            res = true;
	        }
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
    	
    	return res;
    }
    
    public Register fetchData(int currentID) {
    	Register rg = null;
    	
    	try {
            Connection conn = connect();
            String sql = "select * from Registration where UID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, currentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
            	String name = rs.getString("Name");
            	String level = rs.getString("Level");
            	String dob = rs.getString("DOB");
            	String address = rs.getString("Address");
            	String role = rs.getString("Role");
            	String email = rs.getString("Email");
            	String password = rs.getString("Password");
            	String phone = rs.getString("Phone");
            	
            	rg = new Register(currentID, name, level, dob, address, role, email, password, phone);
            	
            } else {
                System.out.println("Not Found!");
            }
        } catch (Exception e) {
        	System.out.println("Error: " + e.getMessage());
        }
    	
    	return rg;
    }
    
    public boolean updateProfile(int currentID, Register rg) {
    	boolean res = false;
    	
    	try {
            Connection con = connect();
            String sql = "update Registration set uid=?, name=?, level=?, DOB=?, address=?, role=?, email=?, password=?, phone=?, UpdateDateTime=? where uid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, rg.getUID());
            ps.setString(2, rg.getName());
            ps.setString(3, rg.getLevel());
            ps.setString(4, rg.getDOB());
            ps.setString(5, rg.getAddress());
            ps.setString(6, rg.getRole());
            ps.setString(7, rg.getEmail());
            ps.setString(8, rg.getPassword());
            ps.setString(9, rg.getPhone());
            ps.setTimestamp(10, rg.getUpDateTime());
            ps.setInt(11, currentID);
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    	
    	return res;
    }
    
    public boolean addBooks(AddBooks ad) {
		boolean res = false;
		
		try {
            Connection con = connect();
            String sql = "INSERT INTO Books (ISBN, BookName, Type, Author, Publication, Quantity) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ad.getISBN());
            ps.setString(2, ad.getName());
            ps.setString(3, ad.getType());
            ps.setString(4, ad.getAuthor());
            ps.setString(5, ad.getPublication());
            ps.setInt(6, ad.getQuantity());
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
		
		return res;
	}
    
    public Register search(int uid) {
		
		String SQL="SELECT * FROM Registration WHERE uid="+uid+"";
				
		Register user = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();			
			while(rs.next()) {
				user = new Register(rs.getInt("UID"), rs.getString("Name"), rs.getString("Address"),rs.getString("Level"), rs.getString("DOB"), rs.getString("Role"), rs.getString("Email"), rs.getString("Phone"), rs.getTimestamp("RegistrationDateTime"),rs.getTimestamp("UpdateDateTime"));
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return user;
	}
	
	public List<Register> search(String strSearch, int uid) {
		
		String SQL="SELECT * FROM Registration WHERE Name='"+strSearch+"' OR Email='"+strSearch+"' OR Phone='"+strSearch+"' OR Address='"+strSearch+"' OR Level='"+strSearch+"' OR Role='"+strSearch+"'";
		
		boolean result = new Utils().isNumeric(strSearch);
		if(result) {
			SQL="SELECT * FROM Registration WHERE uid="+strSearch;
		}
		List users = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();
			users = new ArrayList<Register>();
			
			while(rs.next()) {
				
				Register user = new Register(rs.getInt("UID"), rs.getString("Name"), rs.getString("Address"),rs.getString("Level"), rs.getString("DOB"), rs.getString("Role"), rs.getString("Email"), rs.getString("Phone"), rs.getTimestamp("RegistrationDateTime"),rs.getTimestamp("UpdateDateTime"));
				users.add(user);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return users;
	}
	
	public List<Register> displayAll() {
		

		String SQL="SELECT * FROM Registration";

		List users = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery(SQL);
			users = new ArrayList<Register>();
			
			while(rs.next()) {
				
				Register user = new Register(rs.getInt("UID"), rs.getString("Name"), rs.getString("Address"),rs.getString("Level"), rs.getString("DOB"), rs.getString("Role"), rs.getString("Email"), rs.getString("Phone"), rs.getTimestamp("RegistrationDateTime"),rs.getTimestamp("UpdateDateTime"));
				users.add(user);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return users;
	}
	
	public boolean userProfileUpdate(int currentID, Register rg) {
    	boolean res = false;
    	
    	try {
            Connection con = connect();
            String sql = "update Registration set uid=?, Name=?, Level=?, Phone=?, DOB=?, Address=?, UpdateDateTime=? where uid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, rg.getUID());
            ps.setString(2, rg.getName());
            ps.setString(3, rg.getLevel());
            ps.setString(4, rg.getPhone());
            ps.setString(5, rg.getDOB());
            ps.setString(6, rg.getAddress());
            ps.setTimestamp(7, rg.getUpDateTime());
            ps.setInt(8, currentID);
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    	
    	return res;
    }
	
	public List<AddBooks> searchBook(String strSearch) {
		
		String SQL="SELECT * FROM Books WHERE BookName='"+strSearch+"' OR Publication='"+strSearch+"' OR Type='"+strSearch+"' OR Author='"+strSearch+"'";
		
		boolean result = new Utils().isNumeric(strSearch);
		if(result) {
			SQL="SELECT * FROM Books WHERE ISBN="+strSearch;
		}
		List books = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();
			books = new ArrayList<AddBooks>();
			
			while(rs.next()) {
				
				AddBooks book = new AddBooks(rs.getInt("ISBN"), rs.getString("BookName"), rs.getString("Type"),rs.getString("Author"), rs.getString("Publication"), rs.getInt("Quantity"));
				books.add(book);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return books;
	}

	public List<AddBooks> displayAllBooks() {
	

		String SQL="SELECT * FROM Books";
	
		List books = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery(SQL);
			books = new ArrayList<AddBooks>();
			
			while(rs.next()) {
				
				AddBooks book = new AddBooks(rs.getInt("ISBN"), rs.getString("BookName"), rs.getString("Type"),rs.getString("Author"), rs.getString("Publication"), rs.getInt("Quantity"));
				books.add(book);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return books;
	}
	
	public AddBooks searchBook(int isbn) {
		
		String SQL="SELECT * FROM Books WHERE ISBN="+isbn+"";
				
		AddBooks book = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();			
			while(rs.next()) {
				book = new AddBooks(rs.getInt("ISBN"), rs.getString("BookName"), rs.getString("Type"),rs.getString("Author"), rs.getString("Publication"), rs.getInt("Quantity"));
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return book;
	}
	
	public AddBooks fetchBookData(int isbn) {
    	AddBooks book = null;
    	
    	try {
            Connection conn = connect();
            String sql = "select * from Books where ISBN=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, isbn);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
            	String name = rs.getString("BookName");
            	String type = rs.getString("Type");
            	String author = rs.getString("Author");
            	String publication = rs.getString("Publication");
            	int quantity = rs.getInt("Quantity");
            	
            	book = new AddBooks(isbn, name, type, author, publication, quantity);
            	
            } else {
                System.out.println("Not Found!");
            }
        } catch (Exception e) {
        	System.out.println("Error: " + e.getMessage());
        }
    	
    	return book;
    }
	
	public boolean bookUpdate(int isbn, AddBooks book) {
    	boolean res = false;
    	
    	try {
            Connection con = connect();
            String sql = "update Books set ISBN=?, BookName=?, Type=?, Author=?, Publication=?, Quantity=? where ISBN=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, book.getISBN());
            ps.setString(2, book.getName());
            ps.setString(3, book.getType());
            ps.setString(4, book.getAuthor());
            ps.setString(5, book.getPublication());
            ps.setInt(6, book.getQuantity());
            ps.setInt(7, isbn);
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    	
    	return res;
    }
	
	public boolean addRequest(Register user, AddBooks book) {
		boolean res = false;
		
		try {
            Connection con = connect();
            String sql = "INSERT INTO UserRequestBook (ISBN, BookName, Genre, UserID, UserName, Phone, Email, Status, RequestDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, book.getISBN());
            ps.setString(2, book.getName());
            ps.setString(3, book.getType());
            ps.setInt(4, user.getUID());
            ps.setString(5, user.getName());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getEmail());
            ps.setString(8, "Pending");
            ps.setTimestamp(9, new TimeStamp().getCurrentTimestamp());
            
            int result = ps.executeUpdate();

            if (result > 0) {
                
            	res = true;
            	
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
		
		return res;
	}
	
	public boolean bookRequestCheck(int uid, int isbn) {
	    boolean res = false;

	    try {
	        Connection conn = connect();
	        String sql = "SELECT * FROM UserRequestBook WHERE ISBN=? AND UserID=? And Status = 'Pending'";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, isbn);
	        ps.setInt(2, uid);
	        
	        ResultSet rs = ps.executeQuery(); // Use executeQuery() for SELECT statements

	        if (rs.next()) { // Check if there is at least one row in the result set
	            res = true;
	        }

	        rs.close();
	        ps.close();
	        conn.close();
	        
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	    }

	    return res;
	}

	public List<UserRequest> searchStatus(String strSearch, int uid) {
	    String SQL;
	    boolean isNumeric = new Utils().isNumeric(strSearch);

	    if (isNumeric) {
	        // Query for numeric search
	        SQL = "SELECT * FROM UserRequestBook WHERE (RequestID = ? OR ISBN = ?) AND UserID = ?";
	    } else {
	        // Query for string search including date
	        SQL = "SELECT * FROM UserRequestBook WHERE (BookName = ? OR Genre = ? OR Status = ? OR DATE(RequestDate) = ?) AND UserID = ?";
	    }

	    List<UserRequest> reqs = new ArrayList<>();
	    try (Connection conn = new DatabaseConnection().connect();
	         PreparedStatement pstat = conn.prepareStatement(SQL)) {

	        if (isNumeric) {
	            // Set parameters for numeric search (RequestID or ISBN)
	            pstat.setInt(1, Integer.parseInt(strSearch));
	            pstat.setInt(2, Integer.parseInt(strSearch));
	            pstat.setInt(3, uid);
	        } else {
	            // Set parameters for string search (BookName, Genre, Status)
	            pstat.setString(1, strSearch);
	            pstat.setString(2, strSearch);
	            pstat.setString(3, strSearch);

	            // Handle date search
	            try {
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                java.util.Date parsedDate = dateFormat.parse(strSearch);
	                java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
	                pstat.setDate(4, sqlDate);
	            } catch (ParseException e) {
	                // If parsing fails, set parameter to null
	                pstat.setNull(4, java.sql.Types.DATE);
	            }

	            pstat.setInt(5, uid);
	        }

	        try (ResultSet rs = pstat.executeQuery()) {
	            while (rs.next()) {
	                UserRequest req = new UserRequest(
	                    rs.getInt("RequestID"),
	                    rs.getInt("ISBN"),
	                    rs.getString("BookName"),
	                    rs.getString("Genre"),
	                    rs.getString("Status")
	                );
	                reqs.add(req);
	            }
	        }
	    } catch (Exception ex) {
	        System.out.println("Error : " + ex.getMessage());
	    }
	    return reqs;
	}


	public List<UserRequest> displayAllRequest(int uid) {
	

		String SQL="SELECT * FROM UserRequestBook where UserID="+uid;
	
		List reqs = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery(SQL);
			reqs = new ArrayList<UserRequest>();
			
			while(rs.next()) {
				
				UserRequest req = new UserRequest(rs.getInt("RequestID"), rs.getInt("ISBN"), rs.getString("BookName"),rs.getString("Genre"), rs.getString("Status"));
				reqs.add(req);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return reqs;
	}
	
	public List<UserRequest> searchStatus(String strSearch) {
	    // Base query with UserID and other conditions
	    String SQL = "SELECT * FROM UserRequestBook WHERE (UserName = ? OR Phone = ? OR BookName = ? OR Genre = ? OR Status = ? OR DATE(RequestDate) = ?) AND Status = 'Pending'";

	    boolean result = new Utils().isNumeric(strSearch);
	    if (result) {
	        // Query for numeric search including UserID
	        SQL = "SELECT * FROM UserRequestBook WHERE (RequestID = ? OR ISBN = ? OR UserID = ?) AND Status = 'Pending'";
	    }

	    List<UserRequest> reqs = new ArrayList<>();
	    try (Connection conn = new DatabaseConnection().connect();
	         PreparedStatement pstat = conn.prepareStatement(SQL)) {

	        if (result) {
	            // Set parameters for numeric search (RequestID, ISBN, UserID)
	            pstat.setInt(1, Integer.parseInt(strSearch)); // RequestID
	            pstat.setInt(2, Integer.parseInt(strSearch)); // ISBN
	            pstat.setInt(3, Integer.parseInt(strSearch)); // UserID
	        } else {
	            // Set parameters for string search (UserName, Phone, BookName, Genre, Status)
	            pstat.setString(1, strSearch);  // UserName
	            pstat.setString(2, strSearch);  // Phone
	            pstat.setString(3, strSearch);  // BookName
	            pstat.setString(4, strSearch);  // Genre
	            pstat.setString(5, strSearch);  // Status

	            // Handle date search (using only the date part)
	            try {
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                dateFormat.setLenient(false); // Ensure strict date parsing
	                java.util.Date parsedDate = dateFormat.parse(strSearch);
	                java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
	                pstat.setDate(6, sqlDate);
	            } catch (ParseException e) {
	                pstat.setNull(6, java.sql.Types.DATE);
	            }
	        }

	        try (ResultSet rs = pstat.executeQuery()) {
	            while (rs.next()) {
	                UserRequest req = new UserRequest(
	                    rs.getInt("RequestID"),
	                    rs.getInt("ISBN"),
	                    rs.getString("BookName"),
	                    rs.getString("Genre"),
	                    rs.getInt("UserID"),
	                    rs.getString("UserName"),
	                    rs.getString("Phone"),
	                    rs.getString("Status"),
	                    rs.getTimestamp("RequestDate")
	                );
	                reqs.add(req);
	            }
	        }
	    } catch (Exception ex) {
	        System.out.println("Error : " + ex.getMessage());
	    }
	    return reqs;
	}


	public List<UserRequest> displayAllRequest() {
	

		String SQL="SELECT * FROM UserRequestBook where Status = 'Pending'";
	
		List reqs = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery(SQL);
			reqs = new ArrayList<UserRequest>();
			
			while(rs.next()) {
				
				UserRequest req = new UserRequest(
	                    rs.getInt("RequestID"),
	                    rs.getInt("ISBN"),
	                    rs.getString("BookName"),
	                    rs.getString("Genre"),
	                    rs.getInt("UserID"),
	                    rs.getString("Username"),
	                    rs.getString("Phone"),
	                    rs.getString("Status"),
	                    rs.getTimestamp("RequestDate")
	                );
	                reqs.add(req);
				
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return reqs;
	}
	
	public boolean updateRequest(int rid, String status) {
	    boolean res = false;

	    String sql = "UPDATE UserRequestBook SET Status = ?, AcceptDate = ?, DueDate = ?, Fine = ? WHERE RequestID = ?";

	    try (Connection con = connect();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, status);
	        
	        if (status.equals("Accepted")) {
	        	
	            ps.setDate(2, Date.valueOf(LocalDate.now()));
	            ps.setDate(3, Date.valueOf(LocalDate.now().plusDays(7)));
	            ps.setDouble(4, 0.0);
	        } else {
	        	
	            ps.setNull(2, java.sql.Types.DATE);
	            ps.setNull(3, java.sql.Types.DATE);
	            ps.setNull(4, java.sql.Types.DOUBLE);
	        }
	        
	        // Set RequestID
	        ps.setInt(5, rid);

	        int result = ps.executeUpdate();

	        if (result > 0) {
	            res = true;
	        }

	    } catch (SQLException e) {
	        System.out.println("Error: " + e.getMessage());
	    }

	    return res;
	}
	
	public void fineTracker() {
		
		Date realDate = Date.valueOf(LocalDate.now());
        LocalDate reldate = realDate.toLocalDate();

        
        try {
            Connection con = connect();


            // Fetching data from database
            String sql = "SELECT * FROM UserRequestBook \r\n"
            		+ "WHERE FineStatus IS NULL \r\n"
            		+ "   OR (FineStatus != 'PaidOut' AND FineStatus != 'BookReturn');\r\n"
            		+ "";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            // Reading data from result set
            while (rs.next()) {
                if(rs.getDate("AcceptDate")!=null) {
                	Date due_date = rs.getDate("DueDate");
                    LocalDate dueDate = due_date.toLocalDate();
                    Date book_date = rs.getDate("AcceptDate");
                    LocalDate bookDate = book_date.toLocalDate();
                    String email = rs.getString("Email");
                    
                    int id = rs.getInt("RequestID");
                    double fine = rs.getDouble("fine");
                    Date fine_date = rs.getDate("FineDate");
                    
                    //Sending Mail
                    System.out.println(realDate);
                    LocalDate book_Date = bookDate.plusDays(6);
                    
                    if (reldate.equals(book_Date)) {
                        
                    	ExpireMailSent mail=new ExpireMailSent();
                		try {
                			mail.setupServerProperties();
                	        mail.draftEmail(email);
                	        mail.sendEmail();
                		}catch(Exception e) {
                			System.out.println(e);
                		}

                    } else {
                        System.out.println("Unable to Send");
                    }
                    
                    if (reldate.equals(dueDate)) {
                        
                    	ExpireMailSent mail=new ExpireMailSent();
                		try {
                			mail.setupServerProperties();
                	        mail.draftEmail(email);
                	        mail.sendEmail();
                		}catch(Exception e) {
                			System.out.println(e);
                		}

                    } else {
                        System.out.println("Unable to Send");
                    }
                    
                    // Checking overdue condition and updating fine
                    String sql1 = "UPDATE UserRequestBook SET fine=?,FineDate=?,FineStatus=? WHERE RequestID=?";
                    PreparedStatement ps = con.prepareStatement(sql1);
                    ps.setInt(4,id);
                    // Check due date
                    if (realDate.after(due_date)) {
                        if(!realDate.equals(fine_date)) {
                        	fine += 100; // Example: Adding 100 to the fine amount
                            ps.setDouble(1, fine);
                            ps.setDate(2, realDate);
                            ps.setString(3, "DuePending");
                            ps.executeUpdate();
                            System.out.println("Fine inserted due to overdue!");
                           
                        }
                        
                        
                    } else {
                        System.out.println("The book is not overdue.");
                    }
                    ps.close();
                }else {
                	System.out.println("Request Not Accepted By Liberian!");
                }
                
            }
            
            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}
	
	public List<UserRequest> searchFine(String strSearch) {
	    // Base query with UserID and other conditions
	    String SQL = "SELECT * FROM UserRequestBook \r\n"
	    		+ "WHERE (UserName = ? OR Phone = ? OR Email = ?) \r\n"
	    		+ "  AND Status = 'Accepted' \r\n"
	    		+ "  AND (FineStatus IS NULL OR (FineStatus != 'PaidOut' AND FineStatus != 'BookReturn'));\r\n"
	    		+ "";
	    fineTracker();
	    boolean result = new Utils().isNumeric(strSearch);
	    if (result) {
	        // Query for numeric search including UserID
	        SQL = "SELECT * FROM UserRequestBook \r\n"
	        		+ "WHERE UserID = ? \r\n"
	        		+ "  AND Status = 'Accepted' \r\n"
	        		+ "  AND (FineStatus IS NULL OR (FineStatus != 'PaidOut' AND FineStatus != 'BookReturn'));\r\n"
	        		+ "";
	    }

	    List<UserRequest> reqs = new ArrayList<>();
	    try (Connection conn = new DatabaseConnection().connect();
	         PreparedStatement pstat = conn.prepareStatement(SQL)) {

	        if (result) {
	            
	            pstat.setInt(1, Integer.parseInt(strSearch)); // UserID
	        } else {
	            
	            pstat.setString(1, strSearch);  // UserName
	            pstat.setString(2, strSearch);  // Phone
	            pstat.setString(3, strSearch);  // Email

	            
	        }

	        try (ResultSet rs = pstat.executeQuery()) {
	            while (rs.next()) {
	                UserRequest req = new UserRequest(
	                	rs.getInt("RequestID"),
	                    rs.getInt("UserID"),
	                    rs.getString("UserName"),
	                    rs.getString("Phone"),
	                    rs.getString("Email"),
	                    rs.getDouble("Fine")
	                );
	                reqs.add(req);
	            }
	        }
	    } catch (Exception ex) {
	        System.out.println("Error : " + ex.getMessage());
	    }
	    return reqs;
	}
	
	public List<UserRequest> displayAllFine() {
	    String SQL = "SELECT * FROM UserRequestBook \r\n"
	    		+ "WHERE Status = 'Accepted' \r\n"
	    		+ "AND (FineStatus IS NULL OR (FineStatus != 'PaidOut' AND FineStatus != 'BookReturn'));";
	    
	    fineTracker();  // Assuming this is a method you have defined elsewhere
	    
	    List<UserRequest> reqs = new ArrayList<>();
	    
	    try (Connection conn = new DatabaseConnection().connect();
	         Statement s = conn.createStatement();
	         ResultSet rs = s.executeQuery(SQL)) {
	        
	        while (rs.next()) {
	            UserRequest req = new UserRequest(
	                rs.getInt("RequestID"),
	                rs.getInt("UserID"),
	                rs.getString("UserName"),
	                rs.getString("Phone"),
	                rs.getString("Email"),
	                rs.getDouble("Fine")
	            );
	            reqs.add(req);
	        }
	    } catch (Exception ex) {
	        System.out.println("Error: " + ex.getMessage());
	        // Consider using a logging framework or rethrowing the exception
	    }
	    
	    return reqs;
	}

	
	public boolean updateFineStatus	(int rid, String status) {
	    boolean res = false;

	    String sql = "UPDATE UserRequestBook SET FineStatus = ? WHERE RequestID = ?";

	    try (Connection con = connect();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, status);
	        ps.setInt(2, rid);

	        int result = ps.executeUpdate();

	        if (result > 0) {
	            res = true;
	        }

	    } catch (SQLException e) {
	        System.out.println("Error: " + e.getMessage());
	    }

	    return res;
	}
	
	public UserRequest searchFine(int uid) {
		
		String SQL="SELECT * FROM UserRequestBook WHERE RequestID="+uid+"";
		UserRequest req = null;
		try {
			Connection conn = new DatabaseConnection().connect();
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();			
			while(rs.next()) {
				req = new UserRequest(
	                	rs.getInt("RequestID"),
	                    rs.getInt("UserID"),
	                    rs.getString("UserName"),
	                    rs.getString("Phone"),
	                    rs.getString("Email"),
	                    rs.getDouble("Fine"),
	                    rs.getDate("FineDate")
	                );
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return req;
	}
}
