package com.company.fileup;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

@Service
//@Slf4j
public class FileExportService {

//    private static final String EXPORT_DIR = "/home/evm/";
private static final String EXPORT_DIR = "C:\\Users\\evam\\Desktop\\evam";

    public Path createSmsFile(Map<String, Object> musteriBilgileri, Map<String, Object> headerInfo) {
        String smsTipi = String.valueOf(headerInfo.getOrDefault("smsTipi", "GEN"));
        String kampanyaBirimi = String.valueOf(headerInfo.getOrDefault("kampanyaBirimi", ""));
        String fileName = "VB_FLK_" + kampanyaBirimi + "_" +
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")) + ".txt";

        Path filePath = Paths.get(EXPORT_DIR, fileName);
        StringBuilder icerik = new StringBuilder();

        String bosluk = "               "; // 15 karakterlik boşluk buffer

//        for (Map<String, Object> bilgi : musteriBilgileri) {

        // değerleri tablo veya event parametrelerinden al
        String kampanyaReferansi = String.valueOf(musteriBilgileri.getOrDefault("kampanyaReferansi", ""));
        String musteriTelefonNo = String.valueOf(musteriBilgileri.getOrDefault("musteriTelefon", ""));
        String kampanyaKategorisi = String.valueOf(musteriBilgileri.getOrDefault("kampanyaKategorisi", ""));
        String kisaMesajMetni = String.valueOf(musteriBilgileri.getOrDefault("smsMetni", ""));
        String musteriTipi = String.valueOf(musteriBilgileri.getOrDefault("musteriTipi", ""));
        String musteriNo = String.valueOf(musteriBilgileri.getOrDefault("musteriNo", ""));

        // Kampanya referansı sabit uzunluk (15) olacak şekilde boşluk doldur
        String refPad = kampanyaReferansi +
                bosluk.substring(0, Math.max(0, 15 - kampanyaReferansi.length()));

        // C# örneğindeki satır yapısı
        String satir = smsTipi.toUpperCase() +
                kampanyaBirimi +
                "5" +
                refPad +
                "90" + musteriTelefonNo + ' ' +
                kampanyaKategorisi + ' ' +
                kisaMesajMetni +
                "#!" + musteriTipi + ' ' + musteriNo;

        icerik.append(satir).append(System.lineSeparator());
//        }

        try {
            Files.createDirectories(filePath.getParent());
            Files.write(filePath, icerik.toString().getBytes(StandardCharsets.UTF_8),
                    StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

            System.out.println("Dosya oluşturuldu: {} ({} kayıt) " + filePath + musteriBilgileri.size());
            return filePath;

        } catch (IOException e) {
            System.out.println("Dosya oluşturulurken hata oluştu " + e);
            throw new RuntimeException("Dosya oluşturma başarısız: " + filePath, e);
        }

    }

}
