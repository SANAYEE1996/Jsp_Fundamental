<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	CustomerDao dao = CustomerDao.getInstance();
	CustomerDto dto = dao.getLogin(email, pwd);
	if(dto != null){
		if(dto.getStatus().equals("1")){
			session.setMaxInactiveInterval(60*3);//초
			session.setAttribute("login",dto);
			response.sendRedirect("list.jsp?page=1");
		}else{
			%>
			<script>
				alert('탈퇴회원 입니다.\n관리자에게 문의하세요');
				history.back(-1);
			</script>
	<%
		}
	}else{
		
	%>
	<script>
		alert('로그인 정보가 잘못되었습니다.');
		history.back(-1);
	</script>
<%}%>