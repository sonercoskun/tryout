package com.company.fileup;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Path;

@Service
//@Slf4j
public class FtpUploadService {

    private static final String FTP_SERVER = "172.19.166.12";
    private static final int FTP_PORT = 21;
    private static final String FTP_USERNAME = "soner";
    private static final String FTP_PASSWORD = "soner123";


    /**
     * Verilen dosyayı FTP'ye yükler.
     * @param localFilePath Yüklenecek dosyanın lokal path'i
     * @param remoteDir FTP üzerindeki hedef dizin (örn. /incoming)
     * @return true = başarılı, false = başarısız
     */
    public boolean uploadFile(Path localFilePath, String remoteDir) {
        FTPClient ftpClient = new FTPClient();

        try {
            File localFile = new File(String.valueOf(localFilePath));

            if (!localFile.exists() || !localFile.isFile()) {
                System.out.println("FTP upload failed: file not found -> " + localFilePath);
                return false;
            }

            try (FileInputStream fis = new FileInputStream(localFile)) {

                ftpClient.connect(FTP_SERVER, FTP_PORT);
                ftpClient.login(FTP_USERNAME, FTP_PASSWORD);
                ftpClient.enterLocalPassiveMode();
                ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

                String remoteFile = (remoteDir == null || remoteDir.isBlank())
                        ? localFile.getName()
                        : remoteDir + "/" + localFile.getName();

                System.out.println("FTP upload started: " + localFilePath + "  -> " + remoteFile);

                boolean done = ftpClient.storeFile(remoteFile, fis);

                if (done) {
                    System.out.println("FTP upload successful: " + remoteFile);
                    return true;
                } else {
                    System.out.println("FTP upload failed: " +  remoteFile);
                    return false;
                }

            } finally {
                if (ftpClient.isConnected()) {
                    ftpClient.logout();
                    ftpClient.disconnect();
                }
            }

        } catch (Exception e) {
            System.out.println("FTP upload error: " + e.getMessage() +  e);
            return false;
        }
    }
}

