<!-- HTML의 주석  안사라져서 사용자가 볼 수 있다 -->
<%-- JSP의 주석 - 번역 과정에서 사라진다 사용자가 볼 수 없다 --%>
<%-- JSP의 번역 과정은 2단계 --%>
<%-- 1. 자바 문법을 실행 코드로 번역하는 단계 --%>
<%-- 2. 번역된 JVM 문법을 실행해서 HTML을 만드는 단계--%>
<%-- 1번 과정이 느려서 미리 준비하고 나중에 요청하면 2번 과정이 동작--%>
<%-- JSP 문법이 동작할 부위를 %를 이용해서 알려준다 --%>
<%-- 자바 문법에는 일반적이 코드가 아닌 특수한 목적의 코드도 존재 import 같은거--%>
<%-- 특수한 목적의 코드를 작성하기 위한 JSP 특수 문법 --%>
<%-- 지시어 문법은 그냥 % 앞에 %@ --%>
<%-- 대부분의 문법은 key=value 형식 --%>
<%-- 1. page 문법 => 페이지의 정보를 알려주는 문법 --%>
<%-- 2. include 문법 --%>
<%-- 3. taglib 문법 조금 특별 나중에--%>
<%-- --%>
<%-- 스크립틀릿이 java 로 작성되어 있어--%>
<%-- javascript, ecmascript, groovy, ruby, jython --%>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.Scanner,java.io.InputStream" %>
<%--<%@ page extends="com.jsp.test.JSPSuper"--%>
<%@ page buffer="8kb" %>
<%@ page autoFlush="true"%><%--true 전송해, false 면 에러 띄울거임--%>
<%--@ page errorPage="/error.html"--%>
<%--@ page isErrorPage="true" --%>
<%-- exception. --%>
<%@ page session="true"%>
<%-- session.setMaxInactiveInterval(1800); --%> <%--세션이 이만큼 유지된다 초단위로 적힘, 1보다 작은 수 넣으면 무제한--%>

<%-- 스크립틀릿 --%>
<%-- 자바를 사용하기 위한 공간--%>
<% for(int i=0; i<5; i+=1); %>
<%-- 자바(language) 문법을 작성할 수 있는 공간--%>
<%-- 스크립틀릿은 HTML을 내장으로 포함해도 또는 HTML에 스크립틀릿이 포함되어도 문제없이 동작 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 액션태그중 URL을 만들어내는 태그 대부분에 사용이 가능함 --%>
	<%-- 
	<jsp:forward page="/include.jsp"/> 해당 경로로 이동해 
		</jsp:forward>
	--%>
	<%-- 자바빈 자체를 생성하도록 하는 변수가 있다 --%>
	<%-- scope 종류 (시야 -> 수명이 생김)--%>
	<%-- 1. page  --%>
	<%-- 2. request 동일한 요청 안에서만, 요청이 사라지기 전까지 --%>
	<%-- 3. session  --%>
	<%-- 4. application 이 웹사이트 전체적인거 한번 생성되면 웹사이트 끌때까지 모든 유저가 공유 --%>
	<%-- 앤션 태그의 종류가 많다 --%>
	<%-- taglib 이기 때문에 --%>
	<%-- 표현식 -> 한줄짜리 문장을 자동으로 String 으로 변경 --%>
	<%-- 식이 아닌 단순 값 출력을 위한 기능--%>
	<%-- 표현언어(EL)--%>
	<%-- ${} 사이에 넣은 값을 그냥 출력하는 기능 --%>
	<%-- 간단한 수식 -> 덧셈 뺄셈--%>
	<%-- 자바빈 객체 정보를 표현--%>
	<%-- 표현 언어는 메서드 camel-case을 알아서 동작해준다--%>
	<%-- 부등호를 위한 새로운 연산자 --%>
	${1 eq 2}<%-- equal--%>
	<%-- ${1 ne 2}<%-- not equal --%>
	${1 gt 2}<%-- greater then --%>
	${1 ge 2}<%-- greater equal --%>
	${1 lt 2}<%-- lesser then--%>
	${1 le 2}<%-- lesser equal --%>
	${empty limit} <%-- 해당 객체가 없는지 여부 --%>
	<%-- and, or, not, instanceof --%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request"/> <%-- camel-case를 이용한 setter --%>
	<jsp:setProperty name="limit" property="x" value="10"/>
	<jsp:getProperty name="limit" property="x"/>
	<jsp:setProperty name="limit" property="y" value="10"/>
	<jsp:getProperty name="limit" property="y"/>
	${limit.x}
	<jsp:include page="/include.jsp">
		<jsp:param name="y" value="5"/>
	</jsp:include>
	<%-- fn 은 특별한 녀석 -> 표현 언어와 사용되기 위해서 만들어진 taglib --%>
	
	<%--${fn:length([1,2,3])}--%>
	${fn:toUpperCase("Hello Disney")}
	${fn:toLowerCase("Hello Disney")}
	${fn:substring("Hello Disney",3,7)}
	${fn:replace("Hello Disney", "Hello","Goodbye")}
	<%-- 
	<fmt:formatDate value="date값 정확히 구해서 사용" pattern="YY-MM-DD"/>
	<fmt:parseDate value="2023-11-25" pattern="YYYY-MM-DD" var="date"/>
	--%>
	<%-- formatNumber, parseNumber --%>
	<img src="<%="HTML문법 사이에 스크립틀릿을 넣어도"%>" alt=""/>
	<%--@ include file="/include.jsp"--%>
	<ol>
		<% for(int i=0; i<10; i+=1) {%>
			<li><%=i%></li>
			<%--out.append(("A"));--%>
		<%}%>
	</ol>
	
</body>
</html>