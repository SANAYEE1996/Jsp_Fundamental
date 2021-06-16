<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String newpwd = request.getParameter("newpwd");
	String name = request.getParameter("name");
	String status = request.getParameter("status");
	int num = Integer.parseInt(request.getParameter("num"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	CustomerDao dao = CustomerDao.getInstance();
	boolean success = dao.update(
		new CustomerDto(num,null,newpwd,name,status,null));
	if(success){
%>
	<script>
	alert('회원이 수정 되었습니다.');
	location.href="view.jsp?num=<%=num%>&page=<%=cPage%>";
	</script>
<%}else{ %>
<script>
	alert('error');
	history.back(-1);
	</script>
<%} %>