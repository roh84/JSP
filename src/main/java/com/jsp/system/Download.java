package com.jsp.system;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part; 

@WebServlet(urlPatterns= {
		"/download/*"
})
//다운로드는 @MultipartConfig 가 필요없다

public class Download extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("image/javascript");
		resp.setHeader("Content-Disposition", "attachment;filename=a.jpg");
		try( OutputStream out = resp.getOutputStream();
				InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original/2.jpg" );){
			out.write(in.readAllBytes());
		}catch(Exception e) {}
	}
}
