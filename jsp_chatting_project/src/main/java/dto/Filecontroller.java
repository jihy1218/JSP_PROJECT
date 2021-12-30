package dto;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(maxFileSize = 1024*1024*100, location = "C:/Users/minwook/git/JSP_PROJECT/jsp_chatting_project/src/main/webapp/carrot/upload")
public class Filecontroller extends HttpServlet{

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		Part part = (Part) request.getPart("profile");
		String par2 = request.getParameter("profile");
		
		System.out.println(part);
		System.out.println(par2);
		
	}
	
	
}
