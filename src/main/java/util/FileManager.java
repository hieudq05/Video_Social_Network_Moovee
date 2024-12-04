package util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

public class FileManager {

    public String addFilePhoto(HttpServletRequest request, String filePathImage) throws IOException, ServletException {
        String picPath;
        Part filePart = request.getPart(filePathImage);
        if(filePart != null) {
            if(!filePart.getSubmittedFileName().isEmpty()) {
                File folderPhoto = new File(request.getServletContext().getRealPath("/views/images"));
                File picFile = new File(folderPhoto, filePart.getSubmittedFileName());
                filePart.write(picFile.getAbsolutePath());
                picPath = request.getContextPath()+"/views/images/"+picFile.getName();
                return picPath;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}
