package com.jsp.mapping;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.ProcessHandle.Info;

import javax.servlet.ServletException;
// JSP, Servlet 와 관련된 모든 기능은 javax 라는 패키지에 포함
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; // Request-요청
import javax.servlet.http.HttpServletResponse; // Response-응답
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns= {
		"/resources/*",
		"/resource/*"
		}, initParams = {
			@WebInitParam(name="key", value="값")
		})
public class ResourceMapping extends HttpServlet {
	@Override // doGet 하고 컨트롤 스페이스 하면 오버라이드
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
//		System.out.println(req.getPathInfo());
		resp.setCharacterEncoding("utf-8");
		
		String info= req.getPathInfo(); //getPathInfo() 함수 는 서블릿에 전달된 경로만 반환합니다. 전달된 추가 경로 정보가 없으면 이 함수는 null 을 반환 합니다.
		String token = info.substring(info.lastIndexOf(".")+1);
		
		if(token.equalsIgnoreCase("js")) {
			resp.setContentType("application/javascript");
			try( OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + token + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		else if(token.equalsIgnoreCase("css")) {
			resp.setContentType("text/css");
			try( OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + token + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		else if(token.equalsIgnoreCase("jpeg") || token.equalsIgnoreCase("jpg")) {
			resp.setContentType("image/jpeg");
			try( OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		else if(token.equalsIgnoreCase("png")) {
			resp.setContentType("image/png");
			try( OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		else if(token.equalsIgnoreCase("gif")) {
			resp.setContentType("image/gif");
			try( OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		
//		resp.setCharacterEncoding("utf-8");
//		resp.setContentType("application/javascript"); 
//		//text/javascript -> 구형
//		//application/javascript" -> 신형
//		try( OutputStream out = resp.getOutputStream();
//				InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/js/a.js");){
//			out.write(in.readAllBytes());
//		}catch(Exception e) {}
						
						
//		getServletContext().getResourceAsStream("/WEB-INF/resources/js/a.js");
		
		
//		String id = req.getParameter("id");
//		
//		getServletContext();// Context 정보를 담은 클래스
//		InputStream a=  getServletContext().getResourceAsStream("/WEB-INF/resources/js/a.js");
//		
//		
//		resp.setContentType("text/html"); // 내용들의 MIME 정보를 세팅하는 메서드//  text/html -> 기본값
//		resp.setCharacterEncoding("utf-8");
//		PrintWriter out = resp.getWriter();
//		out.append(new String(a.readAllBytes()));
//		a.close();
//		out.append("<div>"+id+"</div>");
//		out.append("<ol>");
//		for(int i=0; i<10; i+=1) {
//			out.append("<li>");
//			out.append(Integer.toString(i)); //Integer.toString(i) -> 숫자를 문자로 변환하는 형 변환 방법
//			out.append("</li>");
//		}
//		out.append("</ol>");
		
		
		
		
//		resp.getWriter().append("<div>응답 내용1</div>");
//		resp.getWriter().append("응답 내용2");
//		resp.getWriter().append("응답 내용3");
//		resp.getWriter().append("응답 내용4");
	}
}
