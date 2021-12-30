package dto;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@WebServlet("/upload")
@MultipartConfig(maxFileSize = 1024*1024*100, location = "c:\\attaches")
public class Filecontroller {

}
