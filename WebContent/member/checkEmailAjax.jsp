<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page contentType="application/json;charset=utf-8"%>
<%
	String email = request.getParameter("email");
	CustomerDao dao = CustomerDao.getInstance();
	boolean existed = dao.isExisted(email);
	if(existed){
%>	

<%}else{%>
			

<%}%>