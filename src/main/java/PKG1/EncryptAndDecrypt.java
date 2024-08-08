package PKG1;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class EncryptAndDecrypt {
	private static final String KEY_FILE = "key.txt";

    public static void write_key(SecretKey secretKey) throws Exception {
        try (FileOutputStream fileStream = new FileOutputStream(KEY_FILE);
             ObjectOutputStream objStream = new ObjectOutputStream(fileStream)) {
            objStream.writeObject(secretKey);
        }
    }

    public static SecretKey read_key() throws Exception {
        File keyFile = new File(KEY_FILE);
        if (!keyFile.exists()) {
            throw new IOException("Key file does not exist.");
        }
        try (FileInputStream fileStream = new FileInputStream(keyFile);
             ObjectInputStream objStream = new ObjectInputStream(fileStream)) {
            return (SecretKey) objStream.readObject();
        }
    }

    public static SecretKey get_or_create_key() throws Exception {
        File keyFile = new File(KEY_FILE);
        if (keyFile.exists()) {
            try {
                return read_key();
            } catch (IOException | ClassNotFoundException e) {
                // If reading the key fails, generate a new key
                System.out.println("Failed to read key: " + e.getMessage());
                keyFile.delete(); // Remove the corrupted file
                return generate_and_store_key();
            }
        } else {
            return generate_and_store_key();
        }
    }

    private static SecretKey generate_and_store_key() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
        keyGenerator.init(256); // Using a 256-bit AES key
        SecretKey secretKey = keyGenerator.generateKey();
        write_key(secretKey);
        return secretKey;
    }

    public static String encrypt_data(String originalData) throws Exception {
        String algorithm = "AES";
        String transformation = "AES/ECB/PKCS5Padding";
        SecretKey secretKey = get_or_create_key();

        Cipher cipher = Cipher.getInstance(transformation);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);

        byte[] encryptedBytes = cipher.doFinal(originalData.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    public static String decrypt_data(String encryptedData) throws Exception {
        String algorithm = "AES";
        String transformation = "AES/ECB/PKCS5Padding";
        SecretKey secretKey = get_or_create_key();

        Cipher cipher = Cipher.getInstance(transformation);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);

        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedData);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        return new String(decryptedBytes, StandardCharsets.UTF_8);
    }
}
