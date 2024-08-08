package PKG1;

public class AddBooks {
	private int ISBN;
	private String Name;
	private String Type;
	private String Author;
	private String Publication;
	private int Quantity;
	
	public AddBooks(int iSBN, String name, String type, String author, String publication, int quantity) {
		
		ISBN = iSBN;
		Name = name;
		Type = type;
		Author = author;
		Publication = publication;
		Quantity = quantity;
	}

	public int getISBN() {
		return ISBN;
	}

	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPublication() {
		return Publication;
	}

	public void setPublication(String publication) {
		Publication = publication;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	
}
