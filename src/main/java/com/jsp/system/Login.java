package com.jsp.system;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

@WebServlet("/Login")
public class Login extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		if(id.equalsIgnoreCase("root") && pwd.equalsIgnoreCase("1234")) {
			
			resp.getWriter().append("<img src=\"/resources/1.jpg\"/>");
			resp.getWriter().append("Succeed");
		}
		else
			resp.getWriter().append("Failed");
		
	}

}
