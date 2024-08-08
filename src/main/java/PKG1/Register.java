package PKG1;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Register {
	private int UID;
	private String Name;
	private String Level;
	private String DOB;
	private String Address;
	private String Role;
	private String Email;
	private String Password;
	private String Phone;
	private Timestamp regDateTime;
    private Timestamp upDateTime;
	
	
	public Register() {
		UID = 0;
		Name = "";
		Level = "";
		DOB = "";
		Address = "";
		Role = "";
		Email = "";
		Password = "";
		Phone = "";
		this.regDateTime = new TimeStamp().getCurrentTimestamp();
        this.upDateTime = new TimeStamp().getCurrentTimestamp();
	}
	
	public Register(int uID, String name, String level, String dOB, String address, String role, String email, String password, String phone) {
		UID = uID;
		Name = name;
		Level = level;
		DOB = dOB;
		Address = address;
		Role = role;
		Email = email;
		Password = password;
		Phone = phone;
		this.regDateTime = new TimeStamp().getCurrentTimestamp();
        this.upDateTime = new TimeStamp().getCurrentTimestamp();
	}
	
	public Register(int uID, String name, String level, String dOB, String address, String role, String email, String password, String phone, Timestamp upDateTime) {
        UID = uID;
        Name = name;
        Level = level;
        DOB = dOB;
        Address = address;
        Role = role;
        Email = email;
        Password = password;
        Phone = phone;
        this.upDateTime = upDateTime;
    }

	

	public Register(int int1, String string, String string2, String string3, String string4, String string5,
			String string6, String string7, Timestamp timestamp, Timestamp timestamp2) {
		UID = int1;
		Name = string;
		Address = string2;
		Level = string3;
		DOB = string4;
		Role = string5;
		Email = string6;
		Phone = string7;
		this.regDateTime = timestamp;
        this.upDateTime = timestamp2;
	}

	public Register(int uid2, String name2, String level2, String phone2, String dob2, String address2,
			Timestamp currentTimestamp) {
		UID = uid2;
		Name = name2;
		Level = level2;
		Phone = phone2;
		DOB = dob2;
		Address = address2;
		this.upDateTime = currentTimestamp;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getLevel() {
		return Level;
	}

	public void setLevel(String level) {
		Level = level;
	}

	public String getDOB() {
		return DOB;
	}

	public void setDOB(String dOB) {
		DOB = dOB;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Timestamp getRegDateTime() {
        return regDateTime;
    }

    public void setRegDateTime(Timestamp regDateTime) {
        this.regDateTime = regDateTime;
    }

    public Timestamp getUpDateTime() {
        return upDateTime;
    }

    public void setUpDateTime(Timestamp upDateTime) {
        this.upDateTime = upDateTime;
    }
	
}
