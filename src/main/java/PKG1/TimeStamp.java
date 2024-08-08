package PKG1;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class TimeStamp {
	public Timestamp getCurrentTimestamp() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        return Timestamp.valueOf(currentDateTime);
    }
}
