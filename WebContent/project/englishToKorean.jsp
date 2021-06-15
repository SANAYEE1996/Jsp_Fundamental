<%@page import="java.net.URLDecoder"%>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	ApiExamTranslateNmt test = new ApiExamTranslateNmt();
	dong = test.translate(dong);
	out.print(dong);
%>
<%@page import="kr.or.kpc.util.ApiExamTranslateNmt"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=utf-8"%>