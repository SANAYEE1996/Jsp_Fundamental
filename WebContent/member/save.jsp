<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int num = 0;
	String status = "1";
	CustomerDao dao = CustomerDao.getInstance();
	num = dao.getMaxNum();
	boolean success = dao.insert(
		new CustomerDto(num,email,pwd,name,status,null));
	if(success){
%>
	<script>
	alert('회원이 등록되었습니다.');
	location.href="list.jsp?page=1";
	</script>
<%}else{ %>
<script>
	alert('error');
	history.back(-1);
	</script>
<%} %>