<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" isErrorPage="false"%>
<%@ page import="javax.servlet.RequestDispatcher, javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<body>
	<%--page -> 내장 정보를 모두 포함하고 있는, 자기 자신/ 요즘 잘 안씀 --%>
<%-- 	
	request -> 요청
	<% request.getContentType(); %>
	<% request.getParameter("ID"); %>
	<% request.getParameterNames(); %>
	<% request.getParameterValues("Datas"); %>
	<% request.getParameterMap(); %>
	<% request.getMethod(); %>
	<% request.getHeader("Content-Disposition"); %>
	Referer(요청한 이전 페이지), User-Agent(사용자기종), Host(localhost:9876)
	<% request.getHeaderNames(); %>
	<% request.getHeaders("Content-Disposition"); %> ;별로 자동분리
	<% request.setAttribute("Key", "Value"); %>
	<% request.getAttribute("Key"); %>
	<% request.removeAttribute("Key"); %>
	<% request.getRemoteAddr(); request.getRemoteHost(); %>
	getRemoteAddr 아이피 주소 192.168.0.1 블랙리스트나 지역락에 사용
	<% request.getCookies(); %> 내가 받아온 요청의 쿠키를 따로 받아옴
	<% request.getSession(); %> 서버의 섹션 수동생성할때
	매개변수도 존재, boolean
	<% request.getContextPath(); %> sever.xml Context path="/"
	<% request.getInputStream(); %>
	<% request.getLocale(); request.getLocales(); %> euc-kr, en, ko-kr
	<% request.getCharacterEncoding(); %> 일반적으로는 자동으로 UTF-8
	<% request.getServletPath(); %>
	<% request.getServletContext(); %> 이 서블릿이 담겨있는 자체 어플리케이션을 가져오겠다 내장객체
	<% request.getPathInfo(); %> /A/B/C.jsp
	<% request.getParts(); %> 
	<% request.getPart("file"); %> multipart/form-data
	<% 
		Part part = request.getPart("file"); 
		part.getInputStream();
		part.getContentType(); // HTML 타입을 알아보겠다
		part.getSize(); // 크기
		part.getHeader("Content-Disposition"); // 따로 붙어있는 허드를 가져오겠다
		part.getName(); // 헤더에서 filname 부분을 추출
		part.write("/a.bmp"); // 파일을 저장하겠다
		part.delete(); // 파일을 삭제하겠다
		part.getSubmittedFileName();// 사용자가 사용하던 파일명
	%>  
	<% request.getRequestURL(); request.getRequestURI(); %> 전체주소값
	<% 
		RequestDispatcher patcher = request.getRequestDispatcher("/index.jsp");
		patcher.forward(request, response);
		patcher.include(request, response);
	%> 
	<% request.isSecure(); %> HTTPS 여부
	 --%>
	
<%-- 	
	<% response.setContentType("text/html"); %>  
	<% response.setCharacterEncoding("utf-8"); %> 
	<% reaponse.getWriter().append("out 내장 객체를 구하는 메서드"); %>
	<% out.append("다를바가 없다"); %>
	<% response.getOutputStream(); %>전송하면 무조건 안전하게 전송되지 않는다
	<% response.sendRedirect("/tset.html"); %> 해당 페이지로 이동, 경로 자체를 변경 	
--%>
<%-- 	
	<% response.sendError(404, "파일 못찾았어"); %> 개발할때 페이지로 에러확인용
	<% response.addCookie(new Cookie("Key", "value")); %>
	<% response.addHeader("Key", "value"); %>
	<% response.setHeader("Key", "value"); %>	
	<% response.setIntHeader("Key", 5); %>	Date, Double
	<% response.setStatus(200); %> 
--%>
	
	
<%-- 	
	서버의 session 이다 중요함 은행같이 보안요구 하느거 아님 쿠키 쓴다
	<% session.getAttribute("Key"); %> 
	<% session.getAttributeNames(); %> 
	<% session.removeAttribute("Key"); %> 
	<% session.removeValue("Key"); %> 
	<% session.getId(); %>
	<% session.isNew(); %>
	<% session.getCreationTime(); %> 생성시간 첫접속 시간
	<% session.getLastAccessedTime(); %> 
	<% session.getMaxInactiveInterval(); %>
	<% session. setMaxInactiveInterval(1800);%>
	<% session.invalidate(); %> 세션 만료기한을 현재로 변경
--%>
	 
	 
<%-- 	
	<% application.getAttribute("Key"); %>
	<% application.getAttributeNames(); %>
	<% application.setAttribute("Key", "value"); %>
	<% application.removeAttribute("Key"); %>
	<% application.getInitParameter("초기화 파라미터"); %>
	<% application.getInitParameterNames(); %>
	<% application.getContext("/test.html"); %>
	<% application.getContextPath(); %>
	<% application.getMimeType("/index.html"); %>
	<% application.getRequestDispatcher("/index.html"); %>
	<% application.log("로그"); %> console.log();
	속도가 조금 더 빠르다. System.out은 모든 출력을 제어 해서 조금 느리다
 --%>
 
	<%-- 
	<% exception. %>
	<% config. %>
	 --%>
<%-- 	 
	<% pageContext.getAttribute("Key"); %>	
	<% pageContext.getAttributeNamesInScope(0); %>	
	<% pageContext.setAttribute("Key", "value"); %>	
	<% pageContext.removeAttribute("Key"); %>	
	<% pageContext.getSession(); %> 무조건 생성한다, 생성안하고 null 값을 가져올 수 없다
	<% pageContext.getRequest(); %>
	<% pageContext.getResponse(); %>
	<% pageContext.getPage(); %>
	<% pageContext.getOut(); %>
	<% pageContext.forward(); %>
	<% pageContext.include(); %>
--%>
	 <% pageContext.getServletContext(); %>
	 
	 
	 
	 
	 
	 
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	<%--  --%>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>