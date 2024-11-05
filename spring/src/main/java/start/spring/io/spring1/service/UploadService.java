package start.spring.io.spring1.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // relative path: absolute path
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();
            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            // uuid
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return finalName;
    }

    public void multiple_handleSaveUploadFile(MultipartFile[] files, String targetFolder) {
        // đường dẫn tương đối: đường dẫn tuyệt đối
        String rootPath = this.servletContext.getRealPath("/resources/images");
        try {
            // Tạo thư mục với tên thư mục được chỉ định
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists()) {
                dir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }
            // Duyệt qua từng file trong mảng `files`
            for (MultipartFile file : files) {
                if (!file.isEmpty()) { // Kiểm tra nếu file không rỗng
                    byte[] bytes = file.getBytes();
                    // Tạo tên file duy nhất bằng timestamp để tránh trùng lặp
                    String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                    File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
                    // Lưu file lên server
                    try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
                        stream.write(bytes);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // Xử lý lỗi khi lưu file
        }
    }

}
