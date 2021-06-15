<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@ page pageEncoding ="utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int num = 0;
	String status = "1";
	CustomerDao dao = CustomerDao.getInstance();
	num = dao.getMaxNum();
	boolean success = dao.insert(new CustomerDto(num,email,pwd,name,status,null));
	if(success){
	%>
	<script>
		alert('회원 등록 완료');
		location.href="list.jsp?page=1";
	</script>
	<%}else{%>
	<script>
		alert('error');
		history.back(-1);
	</script>
	<%
	}
%>